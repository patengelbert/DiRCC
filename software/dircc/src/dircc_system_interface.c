#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "altera_avalon_fifo_util.h"

#include "dircc_defines.h"
#include "dircc_helpers.h"
#include "dircc_system_interface.h"

#define SWAP_UINT32(x) ((((x) & 0xFF000000) >> 24) | (((x) & 0x00FF0000) >> 8) | (((x) & 0x0000FF00) << 8) | (((x) & 0x000000FF) << 24))

union dircc_msg_u
{
    packet_t as_struct;
    uint32_t as_arr[DIRCC_PACKET_SIZE];
};

uint32_t dircc_thread_id()
{
	return *(uint32_t *)dircc_address_data_address;
}

dircc_err_code dircc_init_fifo(uint32_t csr_address, uint32_t almost_empty, uint32_t almost_full)
{
    if (altera_avalon_fifo_init(csr_address, 0, almost_empty, almost_full) != ALTERA_AVALON_FIFO_OK) {
        DIRCC_LOG_PRINTF("Error initializing %u", csr_address);
        return DIRCC_ERROR_INIT_FAILURE;
    }
    DIRCC_LOG_PRINTF("Initialized FIFO at %u", csr_address);
    DIRCC_LOG_PRINTF("Almost Empty: %u", almost_empty);
    DIRCC_LOG_PRINTF("Almost Full: %u", almost_full);
    return DIRCC_SUCCESS;
}

void dircc_print_status(const uint32_t csr_address)
{
    DIRCC_LOG_PRINTF("--------------------------------------");
    DIRCC_LOG_PRINTF("LEVEL = %u", altera_avalon_fifo_read_level(csr_address));
    DIRCC_LOG_PRINTF("STATUS = %u", altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_ALL));
    DIRCC_LOG_PRINTF("EVENT = %u", altera_avalon_fifo_read_event(csr_address, ALTERA_AVALON_FIFO_EVENT_ALL));
    DIRCC_LOG_PRINTF("IENABLE = %u", altera_avalon_fifo_read_ienable(csr_address, ALTERA_AVALON_FIFO_IENABLE_ALL));
    DIRCC_LOG_PRINTF("ALMOSTEMPTYTHRES = %u", altera_avalon_fifo_read_almostempty(csr_address));
    DIRCC_LOG_PRINTF("ALMOSTFULLTHRES = %u", altera_avalon_fifo_read_almostfull(csr_address));
}

void dircc_print_packet(const packet_t *msg)
{
	DIRCC_LOG_PRINTF("Dest: %u.%u.%u + %u", msg->dest.hw_node, msg->dest.sw_node, msg->dest.port, msg->dest.flag);
	DIRCC_LOG_PRINTF("Src: %u.%u.%u + %u", msg->source.hw_node, msg->source.sw_node, msg->source.port, msg->source.flag);
	DIRCC_LOG_PRINTF("Lamport: %u", msg->lamport);
	DIRCC_LOG_PRINTF("Data:%s", (char *)msg->payload);
}

dircc_err_code dircc_can_send(uint32_t csr_address)
{
    return altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_AF_MSK) ? DIRCC_ERROR_FIFO_FULL
                                                                                         : DIRCC_SUCCESS;
}

dircc_err_code dircc_send(uint32_t data_address, uint32_t csr_address, const packet_t* msg)
{

	DIRCC_LOG_PRINTF("Sending packet");
	dircc_print_packet(msg);

    union dircc_msg_u msg_serializer = {.as_struct = *msg};

    // Check that the fifo has the space and won't truncate the packet
    if (dircc_can_send(csr_address) != DIRCC_SUCCESS) {
        DIRCC_LOG_PRINTF("Error setting up packet: FIFO full");
        return DIRCC_ERROR_FIFO_FULL;
    }

    // Set up start of packet
    altera_avalon_fifo_write_other_info(data_address, csr_address, DIRCC_FIFO_START_PACKET);

    // Send packet data
    for (uint32_t i = 0; i < DIRCC_PACKET_SIZE - 1; i++)
        altera_avalon_fifo_write_fifo(data_address, csr_address, SWAP_UINT32(msg_serializer.as_arr[i]));

    // Set up end of packet
    altera_avalon_fifo_write_other_info(data_address, csr_address, DIRCC_FIFO_END_PACKET);
    // Send final data
    altera_avalon_fifo_write_fifo(data_address, csr_address, SWAP_UINT32(msg_serializer.as_arr[DIRCC_PACKET_SIZE - 1]));

    DIRCC_LOG_PRINTF("Successfully sent packet of size: %d", sizeof(msg_serializer));

    return DIRCC_SUCCESS;
}

dircc_err_code dircc_can_recv(uint32_t csr_address)
{
    return altera_avalon_fifo_read_status(csr_address, ALTERA_AVALON_FIFO_STATUS_AE_MSK) ? DIRCC_ERROR_FIFO_EMPTY
                                                                                         : DIRCC_SUCCESS;
}

dircc_err_code dircc_recv(uint32_t data_address, uint32_t csr_address, packet_t* msg)
{

    // TODO: Fix if not whole packet has been received
    // TODO: This will discard any data before SOP

    union dircc_msg_u msg_deserializer;
    uint32_t data;

    DIRCC_LOG_PRINTF("Found %d words to read", altera_avalon_fifo_read_level(csr_address));
    while (altera_avalon_fifo_read_level(csr_address) > 0){
    	data = altera_avalon_fifo_read_fifo(data_address, csr_address);
    	// Pop data until start of packet
        msg_deserializer.as_arr[0] = SWAP_UINT32(data);

        if((altera_avalon_fifo_read_other_info(data_address) & DIRCC_FIFO_START_PACKET) != 0) break;
    }

    if (altera_avalon_fifo_read_level(csr_address) == 0) {
        DIRCC_LOG_PRINTF("Error reading packet: no start of packet found");
        return DIRCC_ERROR_FIFO_EMPTY;
    }

    // read the packet data
    for (uint32_t i = 1; i < DIRCC_PACKET_SIZE - 1; i++) {
        data = altera_avalon_fifo_read_fifo(data_address, csr_address);
        msg_deserializer.as_arr[i] = SWAP_UINT32(data);
        if (altera_avalon_fifo_read_other_info(data_address) & DIRCC_FIFO_END_PACKET) {
            DIRCC_LOG_PRINTF("Error reading packet: Unexpected end of packet at word %d", i);
            return DIRCC_ERROR_MISMATCHED_PACKET;
        }
    }

    data = altera_avalon_fifo_read_fifo(data_address, csr_address);
    msg_deserializer.as_arr[DIRCC_PACKET_SIZE-1] = SWAP_UINT32(data);
    if ((altera_avalon_fifo_read_other_info(data_address) & DIRCC_FIFO_END_PACKET) == 0) {
        DIRCC_LOG_PRINTF("Error reading packet: no end of packet found");
        return DIRCC_ERROR_MISMATCHED_PACKET;
    }

    // Copy the data to release ownership
    memcpy(msg, &(msg_deserializer.as_struct), sizeof(msg_deserializer.as_struct));

    DIRCC_LOG_PRINTF("Successfully received packet of size: %d", sizeof(msg_deserializer));

	DIRCC_LOG_PRINTF("Received packet");
	dircc_print_packet(msg);

    return DIRCC_SUCCESS;
}

dircc_err_code dircc_clr_fifo(uint32_t data_address, uint32_t csr_address)
{
    while (altera_avalon_fifo_read_level(csr_address) != 0)
        altera_avalon_fifo_read_fifo(data_address, csr_address);
    altera_avalon_fifo_clear_event(csr_address, ALTERA_AVALON_FIFO_EVENT_ALL);
    DIRCC_LOG_PRINTF("Cleared FIFO at %u", data_address);
    return DIRCC_SUCCESS;
}

uint32_t dircc_get_level(uint32_t csr_address)
{
    uint32_t level = altera_avalon_fifo_read_level(csr_address);
    DIRCC_LOG_PRINTF("Read level %d from address %d", level, csr_address);
    return level;
}
