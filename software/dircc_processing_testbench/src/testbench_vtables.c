#include <stdbool.h>
#include <stdlib.h>
#include <assert.h>
#include "testbench.h"

#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wformat"

///////////////////////////////////////////////
// Graph type stuff

uint32_t dev_ready_to_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    const dev_state *dState
){
    unsigned v = dState->rts ? OUTPUT_FLAG_dev_out : 0;
    DIRCC_LOG_PRINTF("dev_ready: state={%u,%u,%u}, ready={%u}", dState->t, dState->rts, v);
    return v;
}

void dev_in_receive_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    dev_state *dState,
    const void *eProps,
    void *eState,
    tick_msg *msg
){
    DIRCC_LOG_PRINTF("dev_in: state={%u,%u}, msg={%u}", dState->t, dState->rts, msg->t);
    dState->t = msg->t;
    dState->rts = true;
}

bool dev_out_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    dev_state *dState,
    tick_msg *msg
){
    DIRCC_LOG_PRINTF("dev_out: state={%u,%u}", dState->t, dState->rts);

    dState->rts = false;
    msg->t = dState->t;

    return true;
}

InputPortVTable INPUT_VTABLES_dev[INPUT_COUNT_dev]={
    {
        (receive_handler_t)dev_in_receive_handler,
        sizeof(packet_t)+sizeof(tick_msg),
        0,
        0
    }
};

OutputPortVTable OUTPUT_VTABLES_dev[OUTPUT_COUNT_dev]={
    {
        (send_handler_t)dev_out_send_handler,
        sizeof(packet_t)+sizeof(tick_msg)
    }
};

DeviceTypeVTable DEVICE_TYPE_VTABLES[DEVICE_TYPE_COUNT] = {
    {
        (ready_to_send_handler_t)dev_ready_to_send_handler,
        OUTPUT_COUNT_dev,
        OUTPUT_VTABLES_dev,
        INPUT_COUNT_dev,
        INPUT_VTABLES_dev,
        (compute_handler_t)DIRCC_HANDLER_NULL // No compute handler
    }
};
