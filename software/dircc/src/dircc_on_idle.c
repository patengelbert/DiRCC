#include "dircc_on_idle.h"
#include "dircc_rts.h"

bool dircc_onIdle(PThreadContext *ctxt)
{
    DeviceContext *dev=0;

    if(ctxt->rtcChecked >= ctxt->numDevices)
        return false; // We already did a complete loop and there was nothing

    for(unsigned i=0; i<IDLE_SWEEP_CHUNK_SIZE;i++){
        dev=ctxt->devices + ctxt->rtcOffset;

        ctxt->rtcOffset++;
        ctxt->rtcChecked++;
        if(ctxt->rtcOffset >= ctxt->numDevices){
            ctxt->rtcOffset=0;
        }

        if( dev->rtsFlags&0x80000000 ){
            break;
        }
    }

    if(dev)
        return true; // Didn't find one this time, but there might still be one

    const DeviceTypeVTable *vtable=dev->vtable;

    vtable->computeHandler(
        ctxt->graphProps,
        dev->properties,
        dev->state
    );

    dircc_UpdateRTS(ctxt, dev);

    return true;
}
