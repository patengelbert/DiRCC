
#ifndef _MAIN_RTOS_H
#define _MAIN_RTOS_H

// Standard includes.
#include <stdio.h>
#include <limits.h>

// Altera library includes.
#include "alt_timers.h"
#include "alt_interrupt.h"
#include "alt_globaltmr.h"
#include "alt_address_space.h"
#include "alt_clock_manager.h"

/* Scheduler include files. */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

//soc support
#include "FreeRTOSConfig.h"

#include "socal/hps.h"

#define SDRAM_BASE		0x00100000 // (1Mb base offset) page 587
#define	HPS2FPGA		0xC0000000 // (3Gb base offset)Base address of HPS2FPGA bridgeHPS2FPGA bridge(960Mb span)

#endif
