#include "dircc_impl.h"
#include "dircc_helpers.h"
#include "dircc_rts.h"
#include "dircc_system_state.h"

bool dircc_onIdle(PThreadContext *ctxt)
{
    DeviceContext *dev=0;
    DIRCC_LOG_PRINTF("previously checked %u/%u nodes", ctxt->rtcChecked, ctxt->numDevices);
    if(ctxt->rtcChecked >= ctxt->numDevices) {
    	DIRCC_LOG_PRINTF("No computes available");
        return false; // We already did a complete loop and there was nothing
    }

    unsigned unswept = ctxt->numDevices - ctxt->rtcChecked;
    unsigned sweep_left = IDLE_SWEEP_CHUNK_SIZE < unswept ? IDLE_SWEEP_CHUNK_SIZE : unswept;
    unsigned foundDev = 0;
    for(unsigned i=0; i<sweep_left;i++){
        dev=ctxt->devices + ctxt->rtcOffset;
    	DIRCC_LOG_PRINTF("checking device %u", dev->index);

        ctxt->rtcOffset++;
        ctxt->rtcChecked++;
        if(ctxt->rtcOffset >= ctxt->numDevices){
            ctxt->rtcOffset=0;
        }

        // Check for compute ready, excluding any errored devices
        if( (dev->rtsFlags & DIRCC_RTS_FLAGS_COMPUTE) && !(dircc_getState(dev) & (DIRCC_STATE_DONE | DIRCC_STATE_ERROR))){
            DIRCC_LOG_PRINTF("device %u wishes to compute", dev->index);
            foundDev = 1;
            break;
        }
    }

    if(!foundDev) {
    	DIRCC_LOG_PRINTF("couldn't find device this time");
        return true; // Didn't find one this time, but there might still be one
    }

    const DeviceTypeVTable *vtable=dev->vtable;

    DIRCC_LOG_PRINTF("calling computeHandler");

    activeDevice = dev;

    dircc_unsetState(dev, DIRCC_STATE_IDLE);
    dircc_setState(dev, DIRCC_STATE_COMPUTE, &(dev->index));
    vtable->computeHandler(
        ctxt->graphProps,
        dev->properties,
        &(((DeviceState *)dev->state)->userState)
    );
    activeDevice = NULL;
    dircc_unsetState(dev, DIRCC_STATE_COMPUTE);
    dircc_setState(dev, DIRCC_STATE_IDLE, NULL);

    dircc_UpdateRTS(ctxt, dev);

    return true;
}
