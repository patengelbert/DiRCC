/*
 * dircc_state.h
 *
 *  Created on: May 9, 2017
 *      Author: patrick
 */

#ifndef DIRCC_STATE_H_
#define DIRCC_STATE_H_

#include "dircc.h"

#define DIRCC_STATE_MAX (1 << 16)
#define DIRCC_STATE_MASK 0xFFFF

typedef enum _dircc_state
{
	DIRCC_STATE_UNKNOWN 	= 	(1 << 0),
	DIRCC_STATE_DISABLED	=	(1 << 1),
	DIRCC_STATE_IDLE		=	(1 << 2),
	DIRCC_STATE_BOOTING		= 	(1 << 3),
	DIRCC_STATE_BOOTED		=	(1 << 4),
	DIRCC_STATE_RUNNING		=	(1 << 5),
	DIRCC_STATE_COMPUTE		=	(1 << 6),
	DIRCC_STATE_RECEIVE		=	(1 << 7),
	DIRCC_STATE_SEND		=	(1 << 8),
	DIRCC_STATE_STOPPED		=	(1 << 9),
	DIRCC_STATE_DONE		=	(1 << 10),


	DIRCC_STATE_ERROR		=	(1 << 15),
} dircc_state;

void dircc_initState(DeviceContext *dCtxt);

void dircc_setState(DeviceContext *dCtxt, const uint16_t state, const void *extraData);

void dircc_unsetState(DeviceContext *dCtxt, const uint16_t state);

void dircc_setExclusiveState(DeviceContext *dCtxt, const uint16_t state, const void *extraData);

void dircc_setThreadMultiState(PThreadContext *ctxt, const uint16_t state, const void *extraData);

void dircc_setThreadMultiExclusiveState(PThreadContext *ctxt, const uint16_t state, const void *extraData);

uint16_t dircc_getState(const DeviceContext *dCtxt);

void *dircc_getExtraData(const DeviceContext *dCtxt);

#endif /* DIRCC_STATE_H_ */
