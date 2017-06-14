#include <stdlib.h>
#include <stdbool.h>
#include "heat.h"
#include "dircc_system_state.h"
#include "dircc_helpers.h"

#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wformat"

///////////////////////////////////////////////
// Graph type stuff

uint32_t dev_ready_to_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    const dev_state *dState
){
    uint32_t stillGoing = DIRCC_STATE_GET_DATA(dState, state_t) < gProps->maxTime && \
    		DIRCC_STATE_GET_DATA(dState, state_seenNow) == dProps->neighbourCount;
    unsigned v = stillGoing ? OUTPUT_FLAG_dev_out : 0;
    DIRCC_LOG_PRINTF("dev_ready: state={%u,%u}, ready={%u,%u}", DIRCC_STATE_GET_DATA(dState, state_t), DIRCC_STATE_GET_DATA(dState, state_seenNow), stillGoing, v);
    return v;
}

void dev_in_receive_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    dev_state *dState,
    const edge_props *eProps,
    edge_state *eState,
    temp_msg *msg
){
    DIRCC_LOG_PRINTF("dev_in: state={%u}, edge={%u}, msg={%u,%u}", DIRCC_STATE_GET_DATA(dState, state_t), eProps->weight, msg->t, msg->temp);

    if(msg->t == DIRCC_STATE_GET_DATA(dState, state_t)) {
    	DIRCC_LOG_PRINTF("Received packet for current time -> %u", msg->t);
    	uint32_t seenNowVal = DIRCC_STATE_GET_DATA(dState, state_seenNow);
    	uint32_t newTemp = DIRCC_STATE_GET_DATA(dState, state_accNow);
    	newTemp += msg->temp * eProps->weight;
    	DIRCC_STATE_SET_DATA(dState, state_seenNow, seenNowVal + 1);
    	DIRCC_STATE_SET_DATA(dState, state_accNow, newTemp);
    } else if((msg->t + 1) == DIRCC_STATE_GET_DATA(dState, state_t)) {
    	DIRCC_LOG_PRINTF("Received packet for next time -> %u", msg->t);
    	uint32_t seenNextVal = DIRCC_STATE_GET_DATA(dState, state_seenNext);
    	uint32_t newTemp = DIRCC_STATE_GET_DATA(dState, state_accNext);
    	newTemp += msg->temp * eProps->weight;
    	DIRCC_STATE_SET_DATA(dState, state_seenNext, seenNextVal + 1);
    	DIRCC_STATE_SET_DATA(dState, state_accNext, newTemp);
    } else {
    	DIRCC_LOG_PRINTF("ERROR: Received packet for unknown time -> %u", msg->t);
    	dircc_setState(dircc_getActiveDevice(), DIRCC_STATE_ERROR, NULL);
    }

    if (DIRCC_STATE_GET_DATA(dState, state_t) >= gProps->maxTime && DIRCC_STATE_GET_DATA(dState, state_seenNow) >= dProps->neighbourCount) {
        // Break the fourth wall
    	DIRCC_LOG_PRINTF("Woo, device has halted.");
        dircc_exit(DIRCC_STATE_DONE);
    }
}

bool dev_out_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    dev_state *dState,
    temp_msg *msg
){
	uint32_t newHeat = 0;
    DIRCC_LOG_PRINTF("dev_out: state={%u}", DIRCC_STATE_GET_DATA(dState, state_t));
	uint32_t newT= DIRCC_STATE_GET_DATA(dState, state_t) + 1;

    if(dProps->isDirichlet) {
    	newHeat = DIRCC_STATE_GET_DATA(dState, state_accNow) + dProps->initValue;
    } else {
    	newHeat = DIRCC_STATE_GET_DATA(dState, state_accNow);
    }

	DIRCC_STATE_SET_DATA(dState, state_heat, newHeat);
	DIRCC_STATE_SET_DATA(dState, state_accNow, newHeat*dProps->selfWeight);
	msg->temp = newHeat;
	msg->t = newT;

	DIRCC_STATE_SET_DATA(dState, state_t, newT);
	DIRCC_STATE_SET_DATA(dState, state_seenNow, DIRCC_STATE_GET_DATA(dState, state_seenNext));
	DIRCC_STATE_SET_DATA(dState, state_seenNext, 0);

    return true;
}

InputPortVTable INPUT_VTABLES_dev[INPUT_COUNT_dev]={
    {
        (receive_handler_t)dev_in_receive_handler,
        sizeof(packet_t),
        0,
        0
    }
};

OutputPortVTable OUTPUT_VTABLES_dev[OUTPUT_COUNT_dev]={
    {
        (send_handler_t)dev_out_send_handler,
        sizeof(packet_t)
    }
};

////////////////////////////////////////////////////////////

DeviceTypeVTable DEVICE_TYPE_VTABLES[DEVICE_TYPE_COUNT] = {
    {
        (ready_to_send_handler_t)dev_ready_to_send_handler,
        OUTPUT_COUNT_dev,
        OUTPUT_VTABLES_dev,
        INPUT_COUNT_dev,
        INPUT_VTABLES_dev,
        (compute_handler_t)DIRCC_HANDLER_NONE // No compute handler
    }
};
