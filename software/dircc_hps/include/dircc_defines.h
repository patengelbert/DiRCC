/*
 * dircc_defines.h
 *
 *  Created on: Feb 2, 2017
 *      Author: patrick
 */

#ifndef DIRCC_DEFINES_H_
#define DIRCC_DEFINES_H_

#include <stdint.h>

// Define bool stdbool.h seems to be broken on nios, fix here
//#ifdef __bool_true_false_are_defined
////#define _Bool uint32_t
//#undef bool
//#undef true
//#undef false
//#endif
//
//#define bool	uint32_t
//#define true	1
//#define false	0

typedef uint32_t dircc_packet_status;
typedef uint16_t dircc_err_code;

typedef uint32_t device_addr_t;
typedef uint8_t virt_addr_t;
typedef uint8_t port_index_t;

#define  DIRCC_SUCCESS 0x0001
#define  DIRCC_ERROR_INIT_FAILURE 0x0002
#define  DIRCC_ERROR_SEND_FAILURE 0x0004
#define  DIRCC_ERROR_FIFO_FULL 0x0008
#define  DIRCC_ERROR_FIFO_EMPTY 0x0010
#define  DIRCC_ERROR_MISMATCHED_PACKET 0x0011
#define  DIRCC_ERROR_INTERNAL_ERROR 0x0020
#define  DIRCC_ERROR_NOT_IMPLEMENTED 0x8000

#define MAX_DATA_LEN 10
#define DIRCC_PACKET_SIZE sizeof(packet_t) / sizeof(uint32_t) // 8 32 bit words long

#define MAX_INPUT_PORTS UINT8_MAX + 1
#define MAX_OUTPUT_PORTS UINT8_MAX + 1
#define MAX_ADDRESS UINT32_MAX + 1
#define MAX_VIRTUAL_ADDRESS UINT8_MAX + 1
#define MAX_SUPPORTED_EDGES UINT8_MAX + 1

#define DIRCC_ADDRESS_FLAG_NONE (0)
#define DIRCC_HANDLER_NONE (0)
#define DIRCC_BINDING_NONE (0)

#define MAX_DEVICE_USER_STATE_BYTES 8
#define MAX_EDGE_USER_STATE_BYTES 5

#define IDLE_SWEEP_CHUNK_SIZE 32

#define DIRCC_RTS_FLAGS_COMPUTE 0x80000000

#ifdef USE_RTL
#define MAX_DEVICES_PER_THREAD 1
#else
#define MAX_DEVICES_PER_THREAD MAX_VIRTUAL_ADDRESS
#endif

/* Remove some functions that are not needed */
#define DIRCC_LOG_PRINTF(...) do {} while(0)
#define DIRCC_EXIT_FAILURE(...) do {} while(0)
#define dircc_exit(...) do {} while(0)

#endif /* DIRCC_DEFINES_H_ */
