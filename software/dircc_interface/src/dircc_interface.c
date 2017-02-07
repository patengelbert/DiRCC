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
    DIRCC_LOG_PRINTF("STATUS = %u\n",
            altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_ALL));
    DIRCC_LOG_PRINTF("EVENT = %u\n",
            altera_avalon_fifo_read_event(csr_address, ALTERA_AVALON_FIFO_EVENT_ALL));
    DIRCC_LOG_PRINTF("IENABLE = %u\n",
            altera_avalon_fifo_read_ienable(csr_address, ALTERA_AVALON_FIFO_IENABLE_ALL));
    DIRCC_LOG_PRINTF("ALMOSTEMPTY = %u\n", altera_avalon_fifo_read_almostempty(csr_address));
    DIRCC_LOG_PRINTF("ALMOSTFULL = %u\n\n", altera_avalon_fifo_read_almostfull(csr_address));
}

dircc_err_code dircc_send(uint32_t data_address, uint32_t csr_address, const dircc_msg_t* msg) {

    // TODO: Fix if not enough space to send whole packet

    union dircc_msg_u msg_serializer = { .as_struct = *msg };

    // Set up start of packet
    if (altera_avalon_fifo_write_other_info(data_address, csr_address, DIRCC_FIFO_START_PACKET) != ALTERA_AVALON_FIFO_OK) {
        DIRCC_LOG_PRINTF("Error setting up packet: FIFO full\n");
        return DIRCC_ERROR_FIFO_FULL;
    }

    // Send packet data
    for (uint16_t i = 0; i < DIRCC_MSG_SIZE - 1; i++)
        altera_avalon_fifo_write_fifo(data_address, csr_address, msg_serializer.as_arr[i]);

    // Set up end of packet
    if (altera_avalon_fifo_write_other_info(data_address, csr_address, DIRCC_FIFO_END_PACKET) != ALTERA_AVALON_FIFO_OK) {
        DIRCC_LOG_PRINTF("Error setting up packet: FIFO full\n");
        return DIRCC_ERROR_FIFO_FULL;
    }
    // Send final data
    altera_avalon_fifo_write_fifo(data_address, csr_address, msg_serializer.as_arr[DIRCC_MSG_SIZE - 1]);
    return DIRCC_SUCCESS;
}

dircc_err_code dircc_recv(uint32_t data_address, uint32_t csr_address, dircc_msg_t* msg) {

    // TODO: Fix if not whole packet has been received
    // Metadata is always in the slot behind the actual data, s pop data, then read attached metadata

    union dircc_msg_u msg_deserializer;

    while (!(altera_avalon_fifo_read_other_info(data_address) & DIRCC_FIFO_START_PACKET)) {

        msg_deserializer.as_arr[0] = altera_avalon_fifo_read_fifo(data_address, csr_address);

        if (altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_E_MSK)) {
            DIRCC_LOG_PRINTF("Error reading packet: no start of packet found\n");
            return DIRCC_ERROR_EMPTY;
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
            DIRCC_LOG_PRINTF("Error reading packet: fifo error %d\n", err);
            return DIRCC_ERROR_INTERNAL_ERROR;
        }
    }

    // Copy the data to release ownership
    memcpy(msg, &(msg_deserializer.as_struct), sizeof(msg_deserializer.as_struct));

    return DIRCC_SUCCESS;
}

dircc_err_code dircc_clr_fifo(uint32_t data_address, uint32_t csr_address) {
    while (altera_avalon_fifo_read_level(csr_address) != 0) {
        altera_avalon_fifo_read_fifo(data_address, csr_address);
    }
    DIRCC_LOG_PRINTF("Metadata after clear: %d\n", altera_avalon_fifo_read_other_info(data_address));
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
    DIRCC_LOG_PRINTF("Cleared FIFO %s\n", STREAMING_0_FIFO_IN_OUT_NAME);

    dircc_msg_t msg =
            { .dest = 0x00000001, .source = 0x00000002, .srcPort = 0x0003, .destPort = 0x0004, .data = "Hello" };

    // Send the message
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
    while (dircc_recv(STREAMING_0_FIFO_IN_OUT_BASE, STREAMING_0_FIFO_IN_IN_CSR_BASE, &rcvMsg) == DIRCC_SUCCESS) {
        DIRCC_LOG_PRINTF("MSG:\n");
        DIRCC_LOG_PRINTF("%d\n", rcvMsg.dest);
        DIRCC_LOG_PRINTF("%d\n", rcvMsg.source);
        DIRCC_LOG_PRINTF("%d\n", rcvMsg.srcPort);
        DIRCC_LOG_PRINTF("%d\n", rcvMsg.destPort);
        DIRCC_LOG_PRINTF("%s\n", rcvMsg.data);
    }
}

