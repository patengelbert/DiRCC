/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'streaming_0_cpu' in SOPC Builder design 'demo'
 * SOPC Builder design path: ../../demo.sopcinfo
 *
 * Generated: Mon Feb 06 19:31:30 GMT 2017
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00010820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x11
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00008020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x11
#define ALT_CPU_NAME "streaming_0_cpu"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00008000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00010820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x11
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00008020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x11
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00008000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_FIFO
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/streaming_0_jtag_uart"
#define ALT_LOG_PORT_BASE 0x11070
#define ALT_LOG_PORT_DEV streaming_0_jtag_uart
#define ALT_LOG_PORT_IS_JTAG_UART
#define ALT_LOG_PORT_PRESENT
#define ALT_LOG_PORT_TYPE ALTERA_AVALON_JTAG_UART
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/streaming_0_jtag_uart"
#define ALT_STDERR_BASE 0x11070
#define ALT_STDERR_DEV streaming_0_jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/streaming_0_jtag_uart"
#define ALT_STDIN_BASE 0x11070
#define ALT_STDIN_DEV streaming_0_jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/streaming_0_jtag_uart"
#define ALT_STDOUT_BASE 0x11070
#define ALT_STDOUT_DEV streaming_0_jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "demo"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK STREAMING_0_TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * streaming_0_fifo_in_in_csr configuration
 *
 */

#define ALT_MODULE_CLASS_streaming_0_fifo_in_in_csr altera_avalon_fifo
#define STREAMING_0_FIFO_IN_IN_CSR_AVALONMM_AVALONMM_DATA_WIDTH 32
#define STREAMING_0_FIFO_IN_IN_CSR_AVALONMM_AVALONST_DATA_WIDTH 32
#define STREAMING_0_FIFO_IN_IN_CSR_BASE 0x11020
#define STREAMING_0_FIFO_IN_IN_CSR_BITS_PER_SYMBOL 8
#define STREAMING_0_FIFO_IN_IN_CSR_CHANNEL_WIDTH 0
#define STREAMING_0_FIFO_IN_IN_CSR_ERROR_WIDTH 0
#define STREAMING_0_FIFO_IN_IN_CSR_FIFO_DEPTH 16
#define STREAMING_0_FIFO_IN_IN_CSR_IRQ -1
#define STREAMING_0_FIFO_IN_IN_CSR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STREAMING_0_FIFO_IN_IN_CSR_NAME "/dev/streaming_0_fifo_in_in_csr"
#define STREAMING_0_FIFO_IN_IN_CSR_SINGLE_CLOCK_MODE 1
#define STREAMING_0_FIFO_IN_IN_CSR_SPAN 32
#define STREAMING_0_FIFO_IN_IN_CSR_SYMBOLS_PER_BEAT 4
#define STREAMING_0_FIFO_IN_IN_CSR_TYPE "altera_avalon_fifo"
#define STREAMING_0_FIFO_IN_IN_CSR_USE_AVALONMM_READ_SLAVE 1
#define STREAMING_0_FIFO_IN_IN_CSR_USE_AVALONMM_WRITE_SLAVE 0
#define STREAMING_0_FIFO_IN_IN_CSR_USE_AVALONST_SINK 1
#define STREAMING_0_FIFO_IN_IN_CSR_USE_AVALONST_SOURCE 0
#define STREAMING_0_FIFO_IN_IN_CSR_USE_BACKPRESSURE 1
#define STREAMING_0_FIFO_IN_IN_CSR_USE_IRQ 0
#define STREAMING_0_FIFO_IN_IN_CSR_USE_PACKET 1
#define STREAMING_0_FIFO_IN_IN_CSR_USE_READ_CONTROL 0
#define STREAMING_0_FIFO_IN_IN_CSR_USE_REGISTER 1
#define STREAMING_0_FIFO_IN_IN_CSR_USE_WRITE_CONTROL 1


/*
 * streaming_0_fifo_in_out configuration
 *
 */

#define ALT_MODULE_CLASS_streaming_0_fifo_in_out altera_avalon_fifo
#define STREAMING_0_FIFO_IN_OUT_AVALONMM_AVALONMM_DATA_WIDTH 32
#define STREAMING_0_FIFO_IN_OUT_AVALONMM_AVALONST_DATA_WIDTH 32
#define STREAMING_0_FIFO_IN_OUT_BASE 0x11060
#define STREAMING_0_FIFO_IN_OUT_BITS_PER_SYMBOL 8
#define STREAMING_0_FIFO_IN_OUT_CHANNEL_WIDTH 0
#define STREAMING_0_FIFO_IN_OUT_ERROR_WIDTH 0
#define STREAMING_0_FIFO_IN_OUT_FIFO_DEPTH 16
#define STREAMING_0_FIFO_IN_OUT_IRQ -1
#define STREAMING_0_FIFO_IN_OUT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STREAMING_0_FIFO_IN_OUT_NAME "/dev/streaming_0_fifo_in_out"
#define STREAMING_0_FIFO_IN_OUT_SINGLE_CLOCK_MODE 1
#define STREAMING_0_FIFO_IN_OUT_SPAN 8
#define STREAMING_0_FIFO_IN_OUT_SYMBOLS_PER_BEAT 4
#define STREAMING_0_FIFO_IN_OUT_TYPE "altera_avalon_fifo"
#define STREAMING_0_FIFO_IN_OUT_USE_AVALONMM_READ_SLAVE 1
#define STREAMING_0_FIFO_IN_OUT_USE_AVALONMM_WRITE_SLAVE 0
#define STREAMING_0_FIFO_IN_OUT_USE_AVALONST_SINK 1
#define STREAMING_0_FIFO_IN_OUT_USE_AVALONST_SOURCE 0
#define STREAMING_0_FIFO_IN_OUT_USE_BACKPRESSURE 1
#define STREAMING_0_FIFO_IN_OUT_USE_IRQ 0
#define STREAMING_0_FIFO_IN_OUT_USE_PACKET 1
#define STREAMING_0_FIFO_IN_OUT_USE_READ_CONTROL 0
#define STREAMING_0_FIFO_IN_OUT_USE_REGISTER 1
#define STREAMING_0_FIFO_IN_OUT_USE_WRITE_CONTROL 1


/*
 * streaming_0_fifo_out_in configuration
 *
 */

#define ALT_MODULE_CLASS_streaming_0_fifo_out_in altera_avalon_fifo
#define STREAMING_0_FIFO_OUT_IN_AVALONMM_AVALONMM_DATA_WIDTH 32
#define STREAMING_0_FIFO_OUT_IN_AVALONMM_AVALONST_DATA_WIDTH 32
#define STREAMING_0_FIFO_OUT_IN_BASE 0x11068
#define STREAMING_0_FIFO_OUT_IN_BITS_PER_SYMBOL 8
#define STREAMING_0_FIFO_OUT_IN_CHANNEL_WIDTH 0
#define STREAMING_0_FIFO_OUT_IN_ERROR_WIDTH 0
#define STREAMING_0_FIFO_OUT_IN_FIFO_DEPTH 16
#define STREAMING_0_FIFO_OUT_IN_IRQ -1
#define STREAMING_0_FIFO_OUT_IN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STREAMING_0_FIFO_OUT_IN_NAME "/dev/streaming_0_fifo_out_in"
#define STREAMING_0_FIFO_OUT_IN_SINGLE_CLOCK_MODE 1
#define STREAMING_0_FIFO_OUT_IN_SPAN 8
#define STREAMING_0_FIFO_OUT_IN_SYMBOLS_PER_BEAT 4
#define STREAMING_0_FIFO_OUT_IN_TYPE "altera_avalon_fifo"
#define STREAMING_0_FIFO_OUT_IN_USE_AVALONMM_READ_SLAVE 0
#define STREAMING_0_FIFO_OUT_IN_USE_AVALONMM_WRITE_SLAVE 1
#define STREAMING_0_FIFO_OUT_IN_USE_AVALONST_SINK 0
#define STREAMING_0_FIFO_OUT_IN_USE_AVALONST_SOURCE 1
#define STREAMING_0_FIFO_OUT_IN_USE_BACKPRESSURE 1
#define STREAMING_0_FIFO_OUT_IN_USE_IRQ 0
#define STREAMING_0_FIFO_OUT_IN_USE_PACKET 1
#define STREAMING_0_FIFO_OUT_IN_USE_READ_CONTROL 0
#define STREAMING_0_FIFO_OUT_IN_USE_REGISTER 1
#define STREAMING_0_FIFO_OUT_IN_USE_WRITE_CONTROL 1


/*
 * streaming_0_fifo_out_in_csr configuration
 *
 */

#define ALT_MODULE_CLASS_streaming_0_fifo_out_in_csr altera_avalon_fifo
#define STREAMING_0_FIFO_OUT_IN_CSR_AVALONMM_AVALONMM_DATA_WIDTH 32
#define STREAMING_0_FIFO_OUT_IN_CSR_AVALONMM_AVALONST_DATA_WIDTH 32
#define STREAMING_0_FIFO_OUT_IN_CSR_BASE 0x11040
#define STREAMING_0_FIFO_OUT_IN_CSR_BITS_PER_SYMBOL 8
#define STREAMING_0_FIFO_OUT_IN_CSR_CHANNEL_WIDTH 0
#define STREAMING_0_FIFO_OUT_IN_CSR_ERROR_WIDTH 0
#define STREAMING_0_FIFO_OUT_IN_CSR_FIFO_DEPTH 16
#define STREAMING_0_FIFO_OUT_IN_CSR_IRQ -1
#define STREAMING_0_FIFO_OUT_IN_CSR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STREAMING_0_FIFO_OUT_IN_CSR_NAME "/dev/streaming_0_fifo_out_in_csr"
#define STREAMING_0_FIFO_OUT_IN_CSR_SINGLE_CLOCK_MODE 1
#define STREAMING_0_FIFO_OUT_IN_CSR_SPAN 32
#define STREAMING_0_FIFO_OUT_IN_CSR_SYMBOLS_PER_BEAT 4
#define STREAMING_0_FIFO_OUT_IN_CSR_TYPE "altera_avalon_fifo"
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_AVALONMM_READ_SLAVE 0
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_AVALONMM_WRITE_SLAVE 1
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_AVALONST_SINK 0
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_AVALONST_SOURCE 1
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_BACKPRESSURE 1
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_IRQ 0
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_PACKET 1
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_READ_CONTROL 0
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_REGISTER 1
#define STREAMING_0_FIFO_OUT_IN_CSR_USE_WRITE_CONTROL 1


/*
 * streaming_0_jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_streaming_0_jtag_uart altera_avalon_jtag_uart
#define STREAMING_0_JTAG_UART_BASE 0x11070
#define STREAMING_0_JTAG_UART_IRQ 16
#define STREAMING_0_JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define STREAMING_0_JTAG_UART_NAME "/dev/streaming_0_jtag_uart"
#define STREAMING_0_JTAG_UART_READ_DEPTH 64
#define STREAMING_0_JTAG_UART_READ_THRESHOLD 8
#define STREAMING_0_JTAG_UART_SPAN 8
#define STREAMING_0_JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define STREAMING_0_JTAG_UART_WRITE_DEPTH 64
#define STREAMING_0_JTAG_UART_WRITE_THRESHOLD 8


/*
 * streaming_0_mem configuration
 *
 */

#define ALT_MODULE_CLASS_streaming_0_mem altera_avalon_onchip_memory2
#define STREAMING_0_MEM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define STREAMING_0_MEM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define STREAMING_0_MEM_BASE 0x8000
#define STREAMING_0_MEM_CONTENTS_INFO ""
#define STREAMING_0_MEM_DUAL_PORT 0
#define STREAMING_0_MEM_GUI_RAM_BLOCK_TYPE "AUTO"
#define STREAMING_0_MEM_INIT_CONTENTS_FILE "demo_streaming_0_mem"
#define STREAMING_0_MEM_INIT_MEM_CONTENT 1
#define STREAMING_0_MEM_INSTANCE_ID "NONE"
#define STREAMING_0_MEM_IRQ -1
#define STREAMING_0_MEM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STREAMING_0_MEM_NAME "/dev/streaming_0_mem"
#define STREAMING_0_MEM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define STREAMING_0_MEM_RAM_BLOCK_TYPE "AUTO"
#define STREAMING_0_MEM_READ_DURING_WRITE_MODE "OLD_DATA"
#define STREAMING_0_MEM_SINGLE_CLOCK_OP 1
#define STREAMING_0_MEM_SIZE_MULTIPLE 1
#define STREAMING_0_MEM_SIZE_VALUE 20480
#define STREAMING_0_MEM_SPAN 20480
#define STREAMING_0_MEM_TYPE "altera_avalon_onchip_memory2"
#define STREAMING_0_MEM_WRITABLE 1


/*
 * streaming_0_timer configuration
 *
 */

#define ALT_MODULE_CLASS_streaming_0_timer altera_avalon_timer
#define STREAMING_0_TIMER_ALWAYS_RUN 0
#define STREAMING_0_TIMER_BASE 0x11000
#define STREAMING_0_TIMER_COUNTER_SIZE 32
#define STREAMING_0_TIMER_FIXED_PERIOD 0
#define STREAMING_0_TIMER_FREQ 50000000
#define STREAMING_0_TIMER_IRQ 0
#define STREAMING_0_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define STREAMING_0_TIMER_LOAD_VALUE 49999
#define STREAMING_0_TIMER_MULT 0.001
#define STREAMING_0_TIMER_NAME "/dev/streaming_0_timer"
#define STREAMING_0_TIMER_PERIOD 1
#define STREAMING_0_TIMER_PERIOD_UNITS "ms"
#define STREAMING_0_TIMER_RESET_OUTPUT 0
#define STREAMING_0_TIMER_SNAPSHOT 1
#define STREAMING_0_TIMER_SPAN 32
#define STREAMING_0_TIMER_TICKS_PER_SEC 1000
#define STREAMING_0_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define STREAMING_0_TIMER_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
