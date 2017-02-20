/*
 * dircc_defines.h
 *
 *  Created on: Feb 2, 2017
 *      Author: patrick
 */

#ifndef DIRCC_DEFINES_H_
#define DIRCC_DEFINES_H_

#include <stdlib.h>
#include <stdint.h>
#include "sys/alt_log_printf.h"

#ifdef ALT_LOG_ENABLE
// Always print filename before debug message
#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)
#define DIRCC_LOG_PRINTF(fmt, ...) ALT_LOG_PRINTF("[%s:%d] dircc_node %d: %s -> " fmt "\n", __FILENAME__, __LINE__, NIOS2_CPU_ID_VALUE,  __FUNCTION__, ##__VA_ARGS__)
#elif
// Disable if logging is disabled
#define DIRCC_LOG_PRINTF(...)
#endif

#define DIRCC_LOG_AND_EXIT(fmt, ...) {DIRCC_LOG_PRINTF(fmt, ##__VA_ARGS__); exit(EXIT_FAILURE); }

// Define bool stdbool.h seems to be broken on nios, fix here
#ifdef __bool_true_false_are_defined
//#define _Bool uint32_t
#undef bool
#undef true
#undef false
#endif

#define bool	uint32_t
#define true	1
#define false	0

typedef uint32_t dircc_packet_status;
typedef uint32_t dircc_err_code;

typedef uint32_t device_addr_t;
typedef uint8_t virt_addr_t;
typedef uint8_t port_index_t;

#define  DIRCC_FIFO_START_PACKET 0x00000001
#define  DIRCC_FIFO_END_PACKET 0x00000002
#define  DIRCC_FIFO_PACKET_DATA 0x00000000
#define  DIRCC_FIFO_PACKET_CLEAR 0x00000000

#define DIRCC_FIFO_SINGLE_WORD DIRCC_FIFO_START_PACKET | DIRCC_FIFO_END_PACKET

#define  DIRCC_SUCCESS 0x00000001
#define  DIRCC_ERROR_INIT_FAILURE 0x00000002
#define  DIRCC_ERROR_SEND_FAILURE 0x00000004
#define  DIRCC_ERROR_FIFO_FULL 0x00000008
#define  DIRCC_ERROR_FIFO_EMPTY 0x00000010
#define  DIRCC_ERROR_MISMATCHED_PACKET 0x00000011
#define  DIRCC_ERROR_INTERNAL_ERROR 0x00000020
#define  DIRCC_ERROR_NOT_IMPLEMENTED 0x80000000

#define MAX_DATA_LEN 8
#define DIRCC_PACKET_SIZE sizeof(packet_t) / sizeof(uint32_t) // 7 32 bit words long

#define MAX_INPUT_PORTS UINT8_MAX
#define MAX_OUTPUT_PORTS UINT8_MAX
#define MAX_ADDRESS UINT32_MAX
#define MAX_VIRTUAL_ADDRESS UINT8_MAX

#define DIRCC_ADDRESS_FLAG_NONE 0
#define DIRCC_HANDLER_NULL 0

#define IDLE_SWEEP_CHUNK_SIZE 32

#endif /* DIRCC_DEFINES_H_ */
