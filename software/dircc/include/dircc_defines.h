/*
 * dircc_defines.h
 *
 *  Created on: Feb 2, 2017
 *      Author: patrick
 */

#ifndef DIRCC_DEFINES_H_
#define DIRCC_DEFINES_H_

#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>
#include "sys/alt_log_printf.h"

#ifdef ALT_LOG_ENABLE
// Always print filename before debug message
#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)
#define DIRCC_LOG_PRINTF(fmt, ...) ALT_LOG_PRINTF("[%s:%d] " fmt "\n", __FILENAME__, __LINE__, ##__VA_ARGS__)
#elif
// Disable if logging is disabled
#define DIRCC_LOG_PRINTF(...)
#endif

#define DIRCC_LOG_AND_EXIT(fmt, ...) {DIRCC_LOG_PRINTF(fmt, ##__VA_ARGS__); exit(EXIT_FAILURE); }

typedef uint32_t dircc_packet_status;
typedef uint32_t dircc_err_code;

typedef uint32_t device_addr_t;
typedef uint8_t  virt_addr_t;
typedef uint8_t  port_index_t;

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
#define DIRCC_MSG_SIZE sizeof(dircc_msg_t) / sizeof(uint32_t) // 5 32 bit words long

#define MAX_INPUT_PORTS UINT8_MAX
#define MAX_OUTPUT_PORTS UINT8_MAX
#define MAX_ADDRESS UINT32_MAX
#define MAX_VIRTUAL_ADDRESS UINT8_MAX

typedef struct
{
    device_addr_t dest;               // 32 bits
    device_addr_t source;             // 32 bits
    virt_addr_t   virt_dest;          // 8 bits
    virt_addr_t   virt_source;        // 8 bits
    port_index_t  dest_port;          // 8 bits
    port_index_t  source_port;        // 8 bits
    uint8_t       data[MAX_DATA_LEN]; // 64 bits
} dircc_msg_t;

#define DIRCC_ADDRESS_FLAG_NONE 0
#define DIRCC_HANDLER_NULL 0

#endif /* DIRCC_DEFINES_H_ */