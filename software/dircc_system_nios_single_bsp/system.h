/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'processing_cpu' in SOPC Builder design 'dircc_system_nios_single'
 * SOPC Builder design path: ../../fpga/dircc_system_nios_single.sopcinfo
 *
 * Generated: Fri Apr 21 18:05:46 BST 2017
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
#define ALT_CPU_BREAK_ADDR 0x00020820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x12
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00010020
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
#define ALT_CPU_INST_ADDR_WIDTH 0x12
#define ALT_CPU_NAME "processing_cpu"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00010000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00020820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x12
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00010020
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
#define NIOS2_INST_ADDR_WIDTH 0x12
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00010000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_FIFO
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2
#define __CONDUIT_AVALON_MM_BRIDGE


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/processing_jtag_uart"
#define ALT_LOG_PORT_BASE 0x21078
#define ALT_LOG_PORT_DEV processing_jtag_uart
#define ALT_LOG_PORT_IS_JTAG_UART
#define ALT_LOG_PORT_PRESENT
#define ALT_LOG_PORT_TYPE ALTERA_AVALON_JTAG_UART
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/processing_jtag_uart"
#define ALT_STDERR_BASE 0x21078
#define ALT_STDERR_DEV processing_jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/processing_jtag_uart"
#define ALT_STDIN_BASE 0x21078
#define ALT_STDIN_DEV processing_jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/processing_jtag_uart"
#define ALT_STDOUT_BASE 0x21078
#define ALT_STDOUT_DEV processing_jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "dircc_system_nios_single"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK PROCESSING_TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * processing_address configuration
 *
 */

#define ALT_MODULE_CLASS_processing_address conduit_avalon_mm_bridge
#define PROCESSING_ADDRESS_BASE 0x21060
#define PROCESSING_ADDRESS_IRQ -1
#define PROCESSING_ADDRESS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PROCESSING_ADDRESS_NAME "/dev/processing_address"
#define PROCESSING_ADDRESS_SPAN 8
#define PROCESSING_ADDRESS_TYPE "conduit_avalon_mm_bridge"


/*
 * processing_fifo_in_in_csr configuration
 *
 */

#define ALT_MODULE_CLASS_processing_fifo_in_in_csr altera_avalon_fifo
#define PROCESSING_FIFO_IN_IN_CSR_AVALONMM_AVALONMM_DATA_WIDTH 32
#define PROCESSING_FIFO_IN_IN_CSR_AVALONMM_AVALONST_DATA_WIDTH 32
#define PROCESSING_FIFO_IN_IN_CSR_BASE 0x21020
#define PROCESSING_FIFO_IN_IN_CSR_BITS_PER_SYMBOL 8
#define PROCESSING_FIFO_IN_IN_CSR_CHANNEL_WIDTH 0
#define PROCESSING_FIFO_IN_IN_CSR_ERROR_WIDTH 0
#define PROCESSING_FIFO_IN_IN_CSR_FIFO_DEPTH 16
#define PROCESSING_FIFO_IN_IN_CSR_IRQ -1
#define PROCESSING_FIFO_IN_IN_CSR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PROCESSING_FIFO_IN_IN_CSR_NAME "/dev/processing_fifo_in_in_csr"
#define PROCESSING_FIFO_IN_IN_CSR_SINGLE_CLOCK_MODE 0
#define PROCESSING_FIFO_IN_IN_CSR_SPAN 32
#define PROCESSING_FIFO_IN_IN_CSR_SYMBOLS_PER_BEAT 4
#define PROCESSING_FIFO_IN_IN_CSR_TYPE "altera_avalon_fifo"
#define PROCESSING_FIFO_IN_IN_CSR_USE_AVALONMM_READ_SLAVE 1
#define PROCESSING_FIFO_IN_IN_CSR_USE_AVALONMM_WRITE_SLAVE 0
#define PROCESSING_FIFO_IN_IN_CSR_USE_AVALONST_SINK 1
#define PROCESSING_FIFO_IN_IN_CSR_USE_AVALONST_SOURCE 0
#define PROCESSING_FIFO_IN_IN_CSR_USE_BACKPRESSURE 1
#define PROCESSING_FIFO_IN_IN_CSR_USE_IRQ 0
#define PROCESSING_FIFO_IN_IN_CSR_USE_PACKET 1
#define PROCESSING_FIFO_IN_IN_CSR_USE_READ_CONTROL 0
#define PROCESSING_FIFO_IN_IN_CSR_USE_REGISTER 1
#define PROCESSING_FIFO_IN_IN_CSR_USE_WRITE_CONTROL 1


/*
 * processing_fifo_in_out configuration
 *
 */

#define ALT_MODULE_CLASS_processing_fifo_in_out altera_avalon_fifo
#define PROCESSING_FIFO_IN_OUT_AVALONMM_AVALONMM_DATA_WIDTH 32
#define PROCESSING_FIFO_IN_OUT_AVALONMM_AVALONST_DATA_WIDTH 32
#define PROCESSING_FIFO_IN_OUT_BASE 0x21068
#define PROCESSING_FIFO_IN_OUT_BITS_PER_SYMBOL 8
#define PROCESSING_FIFO_IN_OUT_CHANNEL_WIDTH 0
#define PROCESSING_FIFO_IN_OUT_ERROR_WIDTH 0
#define PROCESSING_FIFO_IN_OUT_FIFO_DEPTH 16
#define PROCESSING_FIFO_IN_OUT_IRQ -1
#define PROCESSING_FIFO_IN_OUT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PROCESSING_FIFO_IN_OUT_NAME "/dev/processing_fifo_in_out"
#define PROCESSING_FIFO_IN_OUT_SINGLE_CLOCK_MODE 0
#define PROCESSING_FIFO_IN_OUT_SPAN 8
#define PROCESSING_FIFO_IN_OUT_SYMBOLS_PER_BEAT 4
#define PROCESSING_FIFO_IN_OUT_TYPE "altera_avalon_fifo"
#define PROCESSING_FIFO_IN_OUT_USE_AVALONMM_READ_SLAVE 1
#define PROCESSING_FIFO_IN_OUT_USE_AVALONMM_WRITE_SLAVE 0
#define PROCESSING_FIFO_IN_OUT_USE_AVALONST_SINK 1
#define PROCESSING_FIFO_IN_OUT_USE_AVALONST_SOURCE 0
#define PROCESSING_FIFO_IN_OUT_USE_BACKPRESSURE 1
#define PROCESSING_FIFO_IN_OUT_USE_IRQ 0
#define PROCESSING_FIFO_IN_OUT_USE_PACKET 1
#define PROCESSING_FIFO_IN_OUT_USE_READ_CONTROL 0
#define PROCESSING_FIFO_IN_OUT_USE_REGISTER 1
#define PROCESSING_FIFO_IN_OUT_USE_WRITE_CONTROL 1


/*
 * processing_fifo_out_in configuration
 *
 */

#define ALT_MODULE_CLASS_processing_fifo_out_in altera_avalon_fifo
#define PROCESSING_FIFO_OUT_IN_AVALONMM_AVALONMM_DATA_WIDTH 32
#define PROCESSING_FIFO_OUT_IN_AVALONMM_AVALONST_DATA_WIDTH 32
#define PROCESSING_FIFO_OUT_IN_BASE 0x21070
#define PROCESSING_FIFO_OUT_IN_BITS_PER_SYMBOL 8
#define PROCESSING_FIFO_OUT_IN_CHANNEL_WIDTH 0
#define PROCESSING_FIFO_OUT_IN_ERROR_WIDTH 0
#define PROCESSING_FIFO_OUT_IN_FIFO_DEPTH 16
#define PROCESSING_FIFO_OUT_IN_IRQ -1
#define PROCESSING_FIFO_OUT_IN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PROCESSING_FIFO_OUT_IN_NAME "/dev/processing_fifo_out_in"
#define PROCESSING_FIFO_OUT_IN_SINGLE_CLOCK_MODE 0
#define PROCESSING_FIFO_OUT_IN_SPAN 8
#define PROCESSING_FIFO_OUT_IN_SYMBOLS_PER_BEAT 4
#define PROCESSING_FIFO_OUT_IN_TYPE "altera_avalon_fifo"
#define PROCESSING_FIFO_OUT_IN_USE_AVALONMM_READ_SLAVE 0
#define PROCESSING_FIFO_OUT_IN_USE_AVALONMM_WRITE_SLAVE 1
#define PROCESSING_FIFO_OUT_IN_USE_AVALONST_SINK 0
#define PROCESSING_FIFO_OUT_IN_USE_AVALONST_SOURCE 1
#define PROCESSING_FIFO_OUT_IN_USE_BACKPRESSURE 1
#define PROCESSING_FIFO_OUT_IN_USE_IRQ 0
#define PROCESSING_FIFO_OUT_IN_USE_PACKET 1
#define PROCESSING_FIFO_OUT_IN_USE_READ_CONTROL 0
#define PROCESSING_FIFO_OUT_IN_USE_REGISTER 1
#define PROCESSING_FIFO_OUT_IN_USE_WRITE_CONTROL 1


/*
 * processing_fifo_out_in_csr configuration
 *
 */

#define ALT_MODULE_CLASS_processing_fifo_out_in_csr altera_avalon_fifo
#define PROCESSING_FIFO_OUT_IN_CSR_AVALONMM_AVALONMM_DATA_WIDTH 32
#define PROCESSING_FIFO_OUT_IN_CSR_AVALONMM_AVALONST_DATA_WIDTH 32
#define PROCESSING_FIFO_OUT_IN_CSR_BASE 0x21040
#define PROCESSING_FIFO_OUT_IN_CSR_BITS_PER_SYMBOL 8
#define PROCESSING_FIFO_OUT_IN_CSR_CHANNEL_WIDTH 0
#define PROCESSING_FIFO_OUT_IN_CSR_ERROR_WIDTH 0
#define PROCESSING_FIFO_OUT_IN_CSR_FIFO_DEPTH 16
#define PROCESSING_FIFO_OUT_IN_CSR_IRQ -1
#define PROCESSING_FIFO_OUT_IN_CSR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PROCESSING_FIFO_OUT_IN_CSR_NAME "/dev/processing_fifo_out_in_csr"
#define PROCESSING_FIFO_OUT_IN_CSR_SINGLE_CLOCK_MODE 0
#define PROCESSING_FIFO_OUT_IN_CSR_SPAN 32
#define PROCESSING_FIFO_OUT_IN_CSR_SYMBOLS_PER_BEAT 4
#define PROCESSING_FIFO_OUT_IN_CSR_TYPE "altera_avalon_fifo"
#define PROCESSING_FIFO_OUT_IN_CSR_USE_AVALONMM_READ_SLAVE 0
#define PROCESSING_FIFO_OUT_IN_CSR_USE_AVALONMM_WRITE_SLAVE 1
#define PROCESSING_FIFO_OUT_IN_CSR_USE_AVALONST_SINK 0
#define PROCESSING_FIFO_OUT_IN_CSR_USE_AVALONST_SOURCE 1
#define PROCESSING_FIFO_OUT_IN_CSR_USE_BACKPRESSURE 1
#define PROCESSING_FIFO_OUT_IN_CSR_USE_IRQ 0
#define PROCESSING_FIFO_OUT_IN_CSR_USE_PACKET 1
#define PROCESSING_FIFO_OUT_IN_CSR_USE_READ_CONTROL 0
#define PROCESSING_FIFO_OUT_IN_CSR_USE_REGISTER 1
#define PROCESSING_FIFO_OUT_IN_CSR_USE_WRITE_CONTROL 1


/*
 * processing_jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_processing_jtag_uart altera_avalon_jtag_uart
#define PROCESSING_JTAG_UART_BASE 0x21078
#define PROCESSING_JTAG_UART_IRQ 16
#define PROCESSING_JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PROCESSING_JTAG_UART_NAME "/dev/processing_jtag_uart"
#define PROCESSING_JTAG_UART_READ_DEPTH 64
#define PROCESSING_JTAG_UART_READ_THRESHOLD 8
#define PROCESSING_JTAG_UART_SPAN 8
#define PROCESSING_JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define PROCESSING_JTAG_UART_WRITE_DEPTH 64
#define PROCESSING_JTAG_UART_WRITE_THRESHOLD 8


/*
 * processing_mem configuration
 *
 */

#define ALT_MODULE_CLASS_processing_mem altera_avalon_onchip_memory2
#define PROCESSING_MEM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define PROCESSING_MEM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define PROCESSING_MEM_BASE 0x10000
#define PROCESSING_MEM_CONTENTS_INFO ""
#define PROCESSING_MEM_DUAL_PORT 1
#define PROCESSING_MEM_GUI_RAM_BLOCK_TYPE "AUTO"
#define PROCESSING_MEM_INIT_CONTENTS_FILE "dircc_system_nios_single_processing_mem"
#define PROCESSING_MEM_INIT_MEM_CONTENT 1
#define PROCESSING_MEM_INSTANCE_ID "NONE"
#define PROCESSING_MEM_IRQ -1
#define PROCESSING_MEM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PROCESSING_MEM_NAME "/dev/processing_mem"
#define PROCESSING_MEM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define PROCESSING_MEM_RAM_BLOCK_TYPE "AUTO"
#define PROCESSING_MEM_READ_DURING_WRITE_MODE "OLD_DATA"
#define PROCESSING_MEM_SINGLE_CLOCK_OP 1
#define PROCESSING_MEM_SIZE_MULTIPLE 1
#define PROCESSING_MEM_SIZE_VALUE 40960
#define PROCESSING_MEM_SPAN 40960
#define PROCESSING_MEM_TYPE "altera_avalon_onchip_memory2"
#define PROCESSING_MEM_WRITABLE 1


/*
 * processing_timer configuration
 *
 */

#define ALT_MODULE_CLASS_processing_timer altera_avalon_timer
#define PROCESSING_TIMER_ALWAYS_RUN 0
#define PROCESSING_TIMER_BASE 0x21000
#define PROCESSING_TIMER_COUNTER_SIZE 32
#define PROCESSING_TIMER_FIXED_PERIOD 0
#define PROCESSING_TIMER_FREQ 50000000
#define PROCESSING_TIMER_IRQ 0
#define PROCESSING_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PROCESSING_TIMER_LOAD_VALUE 49999
#define PROCESSING_TIMER_MULT 0.001
#define PROCESSING_TIMER_NAME "/dev/processing_timer"
#define PROCESSING_TIMER_PERIOD 1
#define PROCESSING_TIMER_PERIOD_UNITS "ms"
#define PROCESSING_TIMER_RESET_OUTPUT 0
#define PROCESSING_TIMER_SNAPSHOT 1
#define PROCESSING_TIMER_SPAN 32
#define PROCESSING_TIMER_TICKS_PER_SEC 1000
#define PROCESSING_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define PROCESSING_TIMER_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
