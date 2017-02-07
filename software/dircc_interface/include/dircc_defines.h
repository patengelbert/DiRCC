/*
 * dircc_defines.h
 *
 *  Created on: Feb 2, 2017
 *      Author: patrick
 */

#ifndef DIRCC_DEFINES_H_
#define DIRCC_DEFINES_H_

#include "sys/alt_log_printf.h"

#define DIRCC_FIFO_START_PACKET 0x00000001
#define DIRCC_FIFO_END_PACKET	0x00000002
#define DIRCC_FIFO_PACKET_DATA	0x00000000
#define DIRCC_FIFO_PACKET_CLEAR	0x00000000

#define DIRCC_FIFO_SINGLE_WORD DIRCC_FIFO_START_PACKET | DIRCC_FIFO_END_PACKET
#define DIRCC_FIFO_EMPTY(X) ((X & 0x3) << 2)

#define DIRCC_SUCCESS 				0x00000001
#define DIRCC_ERROR_INIT_FAILURE	0x00000002
#define DIRCC_ERROR_SEND_FAILURE	0x00000004
#define DIRCC_ERROR_FIFO_FULL		0x00000008
#define DIRCC_ERROR_FIFO_EMPTY      0x00000010
#define DIRCC_ERROR_MISMATCHED_PACKET 0x00000011
#define DIRCC_ERROR_INTERNAL_ERROR	0x00000020
#define DIRCC_ERROR_NOT_IMPLEMENTED 0x80000000

#ifdef ALT_LOG_ENABLE
// Always print filename before debug message
#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)
#define DIRCC_LOG_PRINTF(fmt, ...) ALT_LOG_PRINTF("[%s] " fmt, __FILENAME__, ##__VA_ARGS__)
#elif
// Disable if logging is disabled
#define DIRCC_LOG_PRINTF(...)
#endif

#endif /* DIRCC_DEFINES_H_ */
