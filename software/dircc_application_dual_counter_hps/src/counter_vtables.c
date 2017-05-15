#include <stdlib.h>
#include <stdbool.h>
#include "counter.h"

#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wformat"

///////////////////////////////////////////////
// Graph type stuff

uint32_t dev_ready_to_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    const dev_state *dState
){
    uint32_t stillGoing = dState->count < gProps->maxTime;
    unsigned v = ((stillGoing && dState->rts) ? OUTPUT_FLAG_dev_out : 0);
    DIRCC_LOG_PRINTF("dev_ready: state={%u,%u}, ready={%u,%u}", dState->count, dState->rts, stillGoing, v);
    return v;
}

void dev_in_receive_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    dev_state *dState,
    const edge_props *eProps,
    edge_state *eState,
    tick_msg *msg
){
    DIRCC_LOG_PRINTF("dev_in: state={%u}, edge={%u,%u}, msg={%u}", dState->count, eProps->one, eState->received, msg->tick);

    eState->received += 1;
    dState->count=msg->tick + 1;
    dState->rts = true;

    if (dState->count >= gProps->maxTime) {
        // Break the fourth wall
    	DIRCC_LOG_PRINTF("Woo, devices have halted.");
        dircc_exit(DIRCC_STATE_DONE);
    }
}

bool dev_out_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    dev_state *dState,
    tick_msg *msg
){
    DIRCC_LOG_PRINTF("dev_out: state={%u}", dState->count);

    msg->tick = dState->count;

    dState->rts = false;
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
