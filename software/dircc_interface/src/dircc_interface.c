#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdlib.h>

#include "system.h"

#include "sys/alt_log_printf.h"

#include "altera_avalon_fifo_util.h"

#include "dircc_defines.h"
#include "dircc_interface.h"

#define ALMOST_EMPTY DIRCC_MSG_SIZE + 1
#define ALMOST_FULL STREAMING_0_FIFO_IN_IN_CSR_FIFO_DEPTH - DIRCC_MSG_SIZE

union dircc_msg_u {
    dircc_msg_t as_struct;
    uint32_t as_arr[DIRCC_MSG_SIZE];
};

uint32_t get_level(uint32_t csr_address);

dircc_err_code dircc_init_fifo(uint32_t csr_address) {
    if (altera_avalon_fifo_init(csr_address, 0, ALMOST_EMPTY, ALMOST_FULL) != ALTERA_AVALON_FIFO_OK) {
        ALT_LOG_PRINTF("[dircc_interface.c] Error initializing %s\n", STREAMING_0_FIFO_IN_IN_CSR_NAME);
        return DIRCC_ERROR_INIT_FAILURE;
    }
    return DIRCC_SUCCESS;
}

void print_status(alt_u32 csr_address) {
    ALT_LOG_PRINTF("[dircc_interface.c] --------------------------------------\n");
    ALT_LOG_PRINTF("[dircc_interface.c] LEVEL = %u\n", altera_avalon_fifo_read_level(csr_address));
    ALT_LOG_PRINTF("[dircc_interface.c] STATUS = %u\n",
            altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_ALL));
    ALT_LOG_PRINTF("[dircc_interface.c] EVENT = %u\n",
            altera_avalon_fifo_read_event(csr_address, ALTERA_AVALON_FIFO_EVENT_ALL));
    ALT_LOG_PRINTF("[dircc_interface.c] IENABLE = %u\n",
            altera_avalon_fifo_read_ienable(csr_address, ALTERA_AVALON_FIFO_IENABLE_ALL));
    ALT_LOG_PRINTF("[dircc_interface.c] ALMOSTEMPTY = %u\n", altera_avalon_fifo_read_almostempty(csr_address));
    ALT_LOG_PRINTF("[dircc_interface.c] ALMOSTFULL = %u\n\n", altera_avalon_fifo_read_almostfull(csr_address));
}

dircc_err_code dircc_send(uint32_t data_address, uint32_t csr_address, const dircc_msg_t* msg) {

    // TODO: Fix if not enough space to send whole packet

    union dircc_msg_u msg_serializer = { .as_struct = *msg };

    // Set up start of packet
    if (altera_avalon_fifo_write_other_info(data_address, csr_address, DIRCC_FIFO_START_PACKET) != ALTERA_AVALON_FIFO_OK) {
        ALT_LOG_PRINTF("[dircc_interface.c] Error setting up packet: FIFO full\n");
        return DIRCC_ERROR_FIFO_FULL;
    }

    // Send packet data
    for (uint16_t i = 0; i < DIRCC_MSG_SIZE - 1; i++)
        altera_avalon_fifo_write_fifo(data_address, csr_address, msg_serializer.as_arr[i]);

    // Set up end of packet
    if (altera_avalon_fifo_write_other_info(data_address, csr_address, DIRCC_FIFO_END_PACKET) != ALTERA_AVALON_FIFO_OK) {
        ALT_LOG_PRINTF("[dircc_interface.c] Error setting up packet: FIFO full\n");
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
            ALT_LOG_PRINTF("[dircc_interface.c] Error reading packet: no start of packet found\n");
            return DIRCC_ERROR_EMPTY;
        }

    }

    int32_t err = ALTERA_AVALON_FIFO_OK;
    // read the packet data
    for (uint16_t i = 1; i < DIRCC_MSG_SIZE; i++) {
        if (altera_avalon_fifo_read_other_info(data_address) & DIRCC_FIFO_END_PACKET) {
            ALT_LOG_PRINTF("[dircc_interface.c] Error reading packet: Unexpected end of packet at word %d\n", i);
            return DIRCC_ERROR_MISMATCHED_PACKET;
        }
        msg_deserializer.as_arr[i] = altera_avalon_fifo_read_fifo(data_address, csr_address);
        if (err != ALTERA_AVALON_FIFO_OK) {
            ALT_LOG_PRINTF("[dircc_interface.c] Error reading packet: fifo error %d\n", err);
            return DIRCC_ERROR_INTERNAL_ERROR;
        }
    }

    memcpy(msg, &(msg_deserializer.as_struct), sizeof(msg_deserializer.as_struct));

    return DIRCC_SUCCESS;
}

dircc_err_code dircc_clr_fifo(uint32_t data_address, uint32_t csr_address) {
    while (altera_avalon_fifo_read_level(csr_address) != 0) {
        altera_avalon_fifo_read_fifo(data_address, csr_address);
    }
    ALT_LOG_PRINTF("[dircc_interface.c] Metadata after clear: %d\n", altera_avalon_fifo_read_other_info(data_address));
    return DIRCC_SUCCESS;
}

uint32_t get_level(uint32_t csr_address) {
    uint32_t level = altera_avalon_fifo_read_level(csr_address);
    ALT_LOG_PRINTF("[dircc_interface.c] Read level %d from address %d\n", level, csr_address);
    return level;
}

int main() {
    dircc_init_fifo(STREAMING_0_FIFO_IN_IN_CSR_BASE); // Init input fifo
    dircc_init_fifo(STREAMING_0_FIFO_OUT_IN_CSR_BASE); //Init output fifo

    // Drop any messages still waiting in the input fifo
    dircc_clr_fifo(STREAMING_0_FIFO_IN_OUT_BASE, STREAMING_0_FIFO_IN_IN_CSR_BASE);
    ALT_LOG_PRINTF("[dircc_interface.c] Cleared FIFO %s\n", STREAMING_0_FIFO_IN_OUT_NAME);

    dircc_msg_t msg =
            { .dest = 0x00000001, .source = 0x00000002, .srcPort = 0x0003, .destPort = 0x0004, .data = "Hello" };

    // Send the message
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);
    dircc_send(STREAMING_0_FIFO_OUT_IN_BASE, STREAMING_0_FIFO_OUT_IN_CSR_BASE, &msg);

    // Check status of messages
    ALT_LOG_PRINTF("[dircc_interface.c] Status for out fifo\n");
    print_status(STREAMING_0_FIFO_OUT_IN_CSR_BASE);
    ALT_LOG_PRINTF("[dircc_interface.c] Status for in fifo\n");
    print_status(STREAMING_0_FIFO_IN_IN_CSR_BASE);

    // Receive message
    dircc_msg_t rcvMsg;
    while (dircc_recv(STREAMING_0_FIFO_IN_OUT_BASE, STREAMING_0_FIFO_IN_IN_CSR_BASE, &rcvMsg) == DIRCC_SUCCESS) {
        ALT_LOG_PRINTF("[dircc_interface.c] MSG:\n");
        ALT_LOG_PRINTF("[dircc_interface.c] %d\n", rcvMsg.dest);
        ALT_LOG_PRINTF("[dircc_interface.c] %d\n", rcvMsg.source);
        ALT_LOG_PRINTF("[dircc_interface.c] %d\n", rcvMsg.srcPort);
        ALT_LOG_PRINTF("[dircc_interface.c] %d\n", rcvMsg.destPort);
        ALT_LOG_PRINTF("[dircc_interface.c] %s\n", rcvMsg.data);
    }
}

