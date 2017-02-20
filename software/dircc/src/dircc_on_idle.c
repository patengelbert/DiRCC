#include "dircc_on_idle.h"
#include "dircc_rts.h"

bool dircc_onIdle(PThreadContext *ctxt)
{
    DeviceContext *dev=0;
    DIRCC_LOG_PRINTF("previously checked %u/%u nodes", ctxt->rtcChecked, ctxt->numDevices);
    if(ctxt->rtcChecked >= ctxt->numDevices) {
    	DIRCC_LOG_PRINTF("No computes available");
        return false; // We already did a complete loop and there was nothing
    }

    for(unsigned i=0; i<IDLE_SWEEP_CHUNK_SIZE;i++){
        dev=ctxt->devices + ctxt->rtcOffset;
    	DIRCC_LOG_PRINTF("checking device %u", dev->index);

        ctxt->rtcOffset++;
        ctxt->rtcChecked++;
        if(ctxt->rtcOffset >= ctxt->numDevices){
            ctxt->rtcOffset=0;
        }

        if( dev->rtsFlags&0x80000000 ){
            DIRCC_LOG_PRINTF("device %u wishes to compute", dev->index);
            break;
        }
    }

    if(dev) {
    	DIRCC_LOG_PRINTF("couldn't find device this time");
        return true; // Didn't find one this time, but there might still be one
    }

    const DeviceTypeVTable *vtable=dev->vtable;

    DIRCC_LOG_PRINTF("calling computeHandler");
    vtable->computeHandler(
        ctxt->graphProps,
        dev->properties,
        dev->state
    );

    dircc_UpdateRTS(ctxt, dev);

    return true;
}
