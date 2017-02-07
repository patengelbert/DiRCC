#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdlib.h>

#include "system.h"

#include "altera_avalon_fifo_util.h"

#include "dircc_defines.h"
#include "dircc_interface.h"

union dircc_msg_u {
    dircc_msg_t as_struct;
    uint32_t as_arr[DIRCC_MSG_SIZE];
};

uint32_t dircc_my_id() {
    // TODO: Implement ID
    return DIRCC_ERROR_NOT_IMPLEMENTED;
}

dircc_err_code dircc_init_fifo(uint32_t csr_address) {
    if (altera_avalon_fifo_init(csr_address, 0, ALMOST_EMPTY, ALMOST_FULL) != ALTERA_AVALON_FIFO_OK) {
        DIRCC_LOG_PRINTF("Error initializing %s\n", STREAMING_0_FIFO_IN_IN_CSR_NAME);
        return DIRCC_ERROR_INIT_FAILURE;
    }
    return DIRCC_SUCCESS;
}

void dircc_print_status(alt_u32 csr_address) {
    DIRCC_LOG_PRINTF("--------------------------------------\n");
    DIRCC_LOG_PRINTF("LEVEL = %u\n", altera_avalon_fifo_read_level(csr_address));
    DIRCC_LOG_PRINTF("STATUS = %u\n", altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_ALL));
    DIRCC_LOG_PRINTF("EVENT = %u\n", altera_avalon_fifo_read_event(csr_address, ALTERA_AVALON_FIFO_EVENT_ALL));
    DIRCC_LOG_PRINTF("IENABLE = %u\n", altera_avalon_fifo_read_ienable(csr_address, ALTERA_AVALON_FIFO_IENABLE_ALL));
    DIRCC_LOG_PRINTF("ALMOSTEMPTY = %u\n", altera_avalon_fifo_read_almostempty(csr_address));
    DIRCC_LOG_PRINTF("ALMOSTFULL = %u\n\n", altera_avalon_fifo_read_almostfull(csr_address));
}

dircc_err_code dircc_can_send(uint32_t csr_address) {
    return  altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_AF_MSK) ? DIRCC_ERROR_FIFO_FULL : DIRCC_SUCCESS;
}

dircc_err_code dircc_send(uint32_t data_address, uint32_t csr_address, const dircc_msg_t* msg) {

    union dircc_msg_u msg_serializer = { .as_struct = *msg };

    // Check that the fifo has the space and won't truncate the packet
    if (dircc_can_send(csr_address) != DIRCC_SUCCESS) {
        DIRCC_LOG_PRINTF("Error setting up packet: FIFO full\n");
        return DIRCC_ERROR_FIFO_FULL;
    }

    // Set up start of packet
    altera_avalon_fifo_write_other_info(data_address, csr_address, DIRCC_FIFO_START_PACKET);

    // Send packet data
    for (uint16_t i = 0; i < DIRCC_MSG_SIZE - 1; i++)
        altera_avalon_fifo_write_fifo(data_address, csr_address, msg_serializer.as_arr[i]);

    // Set up end of packet
    altera_avalon_fifo_write_other_info(data_address, csr_address, DIRCC_FIFO_END_PACKET);
    // Send final data
    altera_avalon_fifo_write_fifo(data_address, csr_address, msg_serializer.as_arr[DIRCC_MSG_SIZE - 1]);

    DIRCC_LOG_PRINTF("Successfuly sent packet of size: %d\n", sizeof(msg_serializer));

    return DIRCC_SUCCESS;
}

dircc_err_code dircc_can_recv(uint32_t csr_address) {
    return  altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_AE_MSK) ? DIRCC_ERROR_FIFO_EMPTY : DIRCC_SUCCESS;
}

dircc_err_code dircc_recv(uint32_t data_address, uint32_t csr_address, dircc_msg_t* msg) {

    // TODO: Fix if not whole packet has been received
    // TODO: This will discard any data before SOP
    // Metadata is always in the slot behind the actual data, so pop data, then read attached metadata

    union dircc_msg_u msg_deserializer;

    while (!(altera_avalon_fifo_read_other_info(data_address) & DIRCC_FIFO_START_PACKET)) {

        msg_deserializer.as_arr[0] = altera_avalon_fifo_read_fifo(data_address, csr_address);

        if (altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_E_MSK)) {
            DIRCC_LOG_PRINTF("Error reading packet: no start of packet found\n");
            return DIRCC_ERROR_FIFO_EMPTY;
        }

    }

    int32_t err = ALTERA_AVALON_FIFO_OK;
    // read the packet data
    for (uint16_t i = 1; i < DIRCC_MSG_SIZE; i++) {
        if (altera_avalon_fifo_read_other_info(data_address) & DIRCC_FIFO_END_PACKET) {
            DIRCC_LOG_PRINTF("Error reading packet: Unexpected end of packet at word %d\n", i);
            return DIRCC_ERROR_MISMATCHED_PACKET;
        }
        msg_deserializer.as_arr[i] = altera_avalon_fifo_read_fifo(data_address, csr_address);
        if (err != ALTERA_AVALON_FIFO_OK) {
            DIRCC_LOG_PRINTF("Error reading packet: packet not fully received\n", err);
            return DIRCC_ERROR_INTERNAL_ERROR;
        }
    }

    // Copy the data to release ownership
    memcpy(msg, &(msg_deserializer.as_struct), sizeof(msg_deserializer.as_struct));

    DIRCC_LOG_PRINTF("Successfuly received packet of size: %d\n", sizeof(msg_deserializer));
    return DIRCC_SUCCESS;
}

dircc_err_code dircc_clr_fifo(uint32_t data_address, uint32_t csr_address) {
    while (altera_avalon_fifo_read_level(csr_address) != 0)
        altera_avalon_fifo_read_fifo(data_address, csr_address);
    altera_avalon_fifo_clear_event(csr_address, ALTERA_AVALON_FIFO_EVENT_ALL);
    DIRCC_LOG_PRINTF("Cleared FIFO at %u\n", data_address);
    return DIRCC_SUCCESS;
}

uint32_t dircc_get_level(uint32_t csr_address) {
    uint32_t level = altera_avalon_fifo_read_level(csr_address);
    DIRCC_LOG_PRINTF("Read level %d from address %d\n", level, csr_address);
    return level;
}

int main() {
    dircc_init_fifo(STREAMING_0_FIFO_IN_IN_CSR_BASE); // Init input fifo
    dircc_init_fifo(STREAMING_0_FIFO_OUT_IN_CSR_BASE); //Init output fifo

    // Drop any messages still waiting in the input fifo
    dircc_clr_fifo(STREAMING_0_FIFO_IN_OUT_BASE, STREAMING_0_FIFO_IN_IN_CSR_BASE);

    dircc_msg_t msg = { .dest = 0x00000001, .source = 0x00000002, .src_port = 0x0003, .dest_port = 0x0004, .data = "Hello!!" };

    // Send the message
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);

    // Check status of messages
    DIRCC_LOG_PRINTF("Status for out fifo\n");
    dircc_print_status(STREAMING_0_FIFO_OUT_IN_CSR_BASE);
    DIRCC_LOG_PRINTF("Status for in fifo\n");
    dircc_print_status(STREAMING_0_FIFO_IN_IN_CSR_BASE);

    // Receive message
    dircc_msg_t rcvMsg;
    uint32_t err = dircc_recv(STREAMING_0_FIFO_IN_OUT_BASE, STREAMING_0_FIFO_IN_IN_CSR_BASE, &rcvMsg);
    while (err == DIRCC_SUCCESS) {
        DIRCC_LOG_PRINTF("MSG:\n");
        DIRCC_LOG_PRINTF("%d\n", rcvMsg.dest);
        DIRCC_LOG_PRINTF("%d\n", rcvMsg.source);
        DIRCC_LOG_PRINTF("%d\n", rcvMsg.src_port);
        DIRCC_LOG_PRINTF("%d\n", rcvMsg.dest_port);
        DIRCC_LOG_PRINTF("%s\n", rcvMsg.data);
        DIRCC_LOG_PRINTF("Can recv: %d\n", dircc_can_recv(STREAMING_0_FIFO_IN_IN_CSR_BASE) == DIRCC_SUCCESS ? 1 : 0);
        err = dircc_recv(STREAMING_0_FIFO_IN_OUT_BASE, STREAMING_0_FIFO_IN_IN_CSR_BASE, &rcvMsg);
    }
}

