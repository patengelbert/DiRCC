#include "barrier.h"
#include "stdlib.h"

#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wformat"

///////////////////////////////////////////////
// Graph type stuff

uint32_t dev_ready_to_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    const dev_state *dState
){
    bool stillGoing = dState->t < gProps->maxTime;
    bool currentFull = dState->seenNow >= gProps->devCount;
    unsigned v =
        ((stillGoing && currentFull) ? OUTPUT_FLAG_dev_out : 0)
        |
        ((!stillGoing && !dState->halted) ? OUTPUT_FLAG_halt_out : 0);
    DIRCC_LOG_PRINTF("dev_ready: state={%u,%u,%u}, ready={%u,%u,%u}", dState->t, dState->seenNow, dState->seenNext, stillGoing, currentFull, v);
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
    DIRCC_LOG_PRINTF("dev_in: state={%u,%u,%u}, msg={%u}", dState->t, dState->seenNow, dState->seenNext, msg->t);

    if(msg->t == dState->t){
        dState->seenNow++;
    }else if(msg->t == dState->t+1){
        dState->seenNext++;
    }else{
        exit(EXIT_FAILURE);
    }
}

bool dev_out_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    dev_state *dState,
    tick_msg *msg
){
    DIRCC_LOG_PRINTF("dev_out: state={%u,%u,%u}", dState->t, dState->seenNow, dState->seenNext);

    if (dState->t < gProps->maxTime ||
    		dState->seenNow >= gProps->devCount)
    	exit(EXIT_FAILURE);

    dState->t++;

    msg->t = dState->t;

    dState->seenNow=dState->seenNext;
    dState->seenNext=0;

    return true;
}

bool dev_halt_send_handler(
    const graph_props *gProps,
    const dev_props *dProps,
    dev_state *dState,
    done_msg *msg
){
    dState->halted=true;
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
    },{
        (send_handler_t)dev_halt_send_handler,
        sizeof(packet_t)+sizeof(done_msg)
    }
};

///////////////////////////////////////////////////////////
// Halt

uint32_t halt_ready_to_send_handler(
    const graph_props *gProps,
    const halt_props *dProps,
    const halt_state *dState
){
    return 0;
}

void halt_in_receive_handler(
    const graph_props *gProps,
    const halt_props *dProps,
    halt_state *dState,
    const void *eProps,
    void *eState,
    done_msg *msg
){
    DIRCC_LOG_PRINTF("halt_in: state={%u}, gProps={%u}", dState->seen, gProps->devCount);


    dState->seen++;

    if(dState->seen == gProps->devCount){
        // Break the fourth wall
        DIRCC_LOG_PRINTF("Woo, devices have halted.");
        exit(EXIT_SUCCESS);
    }
}

InputPortVTable INPUT_VTABLES_halt[INPUT_COUNT_halt]={
    {
        (receive_handler_t)halt_in_receive_handler,
        sizeof(packet_t)+sizeof(tick_msg),
        0,
        0
    }
};

OutputPortVTable OUTPUT_VTABLES_halt[OUTPUT_COUNT_halt]={
};





////////////////////////////////////////////////////////////




DeviceTypeVTable DEVICE_TYPE_VTABLES[DEVICE_TYPE_COUNT] = {
    {
        (ready_to_send_handler_t)dev_ready_to_send_handler,
        OUTPUT_COUNT_dev,
        OUTPUT_VTABLES_dev,
        INPUT_COUNT_dev,
        INPUT_VTABLES_dev,
        (compute_handler_t)DIRCC_HANDLER_NULL // No compute handler
    },{
        (ready_to_send_handler_t)halt_ready_to_send_handler,
        OUTPUT_COUNT_halt,
        OUTPUT_VTABLES_halt,
        INPUT_COUNT_halt,
        INPUT_VTABLES_halt,
        (compute_handler_t)DIRCC_HANDLER_NULL // No compute handler
    }
};
