/*
 * port_asm.h
 *
 *  Created on: 5 May 2017
 *      Author: patrick
 */

#ifndef RTOS_SOURCE_PORTABLE_INCLUDE_PORT_ASM_H_
#define RTOS_SOURCE_PORTABLE_INCLUDE_PORT_ASM_H_

#include "portmacro.h"


#ifdef __cplusplus
	extern "C" {
#endif

extern const uint32_t ulICCIAR;
extern const uint32_t ulICCEOIR;
extern const uint32_t ulICCPMR;
extern const uint32_t ulMaxAPIPriorityMask;

void vPortRestoreTaskContext( void );
void vApplicationFPUSafeIRQHandler( uint32_t ulICCIAR );

#ifdef __cplusplus
	} // extern "C"
#endif

#endif /* RTOS_SOURCE_PORTABLE_INCLUDE_PORT_ASM_H_ */
