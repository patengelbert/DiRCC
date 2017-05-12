/*
 * dircc_system_state.c
 *
 *  Created on: May 9, 2017
 *      Author: patrick
 */

#include <stddef.h>
#include "dircc_system_state.h"
#include "dircc_helpers.h"

void dircc_initState(DeviceContext *dCtxt)
{
	DeviceState *dState = dCtxt->state;
	dState->dirccState = DIRCC_STATE_UNKNOWN;
}

void dircc_setState(DeviceContext *dCtxt, const uint16_t state, const void *extraData)
{
	DeviceState *dState = dCtxt->state;
	DIRCC_LOG_PRINTF("Adding state %04x to device %d", state, dCtxt->index);
	dState->dirccState |= state;
	DIRCC_LOG_PRINTF("New state is %04x", dState->dirccState);
	if (extraData != NULL)
	{
		dState->dirccStateExtraData = *(uint16_t *)extraData;
	}
}

void dircc_unsetState(DeviceContext *dCtxt, const uint16_t state)
{
	DeviceState *dState = dCtxt->state;
	DIRCC_LOG_PRINTF("Removing state %04x from device %d", state, dCtxt->index);
	dState->dirccState &= ~state;
	DIRCC_LOG_PRINTF("New state is %04x", dState->dirccState);
}

void dircc_setExclusiveState(DeviceContext *dCtxt, const uint16_t state, const void *extraData)
{
	DeviceState *dState = dCtxt->state;
	DIRCC_LOG_PRINTF("Setting state %04x on device %d", state, dCtxt->index);
	dState->dirccState = state;
	DIRCC_LOG_PRINTF("New state is %04x", dState->dirccState);
	if (extraData != NULL)
	{
		dState->dirccStateExtraData = *(uint16_t *)extraData;
	}
}

void dircc_setThreadMultiState(PThreadContext *ctxt, const uint16_t state, const void *extraData)
{
	for(unsigned i = 0; i < ctxt->numDevices; i++)
	{
		DeviceContext *dCtxt = ctxt->devices + i;
		dircc_setState(dCtxt, state, extraData);
	}
}

void dircc_setThreadMultiExclusiveState(PThreadContext *ctxt, const uint16_t state, const void *extraData)
{
	for(unsigned i = 0; i < ctxt->numDevices; i++)
	{
		DeviceContext *dCtxt = ctxt->devices + i;
		dircc_setExclusiveState(dCtxt, state, extraData);
	}
}

uint16_t dircc_getState(const DeviceContext *dCtxt)
{
	DeviceState *dState = dCtxt->state;
	return dState->dirccState;
}

void *dircc_getExtraData(const DeviceContext *dCtxt)
{
	DeviceState *dState = dCtxt->state;
	return (void *)(&dState->dirccStateExtraData);
}
