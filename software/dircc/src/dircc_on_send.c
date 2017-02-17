
#include <assert.h>
#include "dircc_on_send.h"
#include "dircc_rts.h"

static unsigned right_most_one(uint32_t x)
{
    assert(x);

    unsigned index=0;
    while(!(x&1)){
        index++;
        x=x>>1;
    }
    
    return index;
}

//! Prepare a message on the given buffer
/*! \param numTargets Receives the number o f addresses to send the packet to
    \param pTargets If numTargets>0, this will be pointed at an array with numTargets elements
    \retval Size of message in bytes
*/
unsigned dircc_onSend(PThreadContext *ctxt, void *message, uint32_t numTargets, const address_t *pTargets)
{
    DIRCC_LOG_PRINTF("begin");

    numTargets=0;
    pTargets=0;
    
    DeviceContext *dev = dircc_PopRTS(ctxt);
    if(!dev){
        return 0;
    }
    
    const DeviceTypeVTable *vtable=dev->vtable;

    assert(dev->rtsFlags);

    unsigned portIndex=right_most_one(dev->rtsFlags);
    
    DIRCC_LOG_PRINTF("device=%08x:%04x, rtsFlags=%x, selected=%u", ctxt->threadId, dev->index,  dev->rtsFlags, portIndex);    

    send_handler_t handler=vtable->outputPorts[portIndex].sendHandler;

    DIRCC_LOG_PRINTF("calling application handler");    

    ctxt->lamport++;
    
    bool doSend=handler(
        ctxt->graphProps,
        dev->properties, 
        dev->state,
        ((packet_t*)message)->payload
    );
    DIRCC_LOG_PRINTF("application handler done, doSend=%d", doSend?1:0);    

    
    if(doSend){
        numTargets=dev->targets[portIndex].numTargets;
        pTargets=dev->targets[portIndex].targets;
        ((packet_t*)message)->source.hw_node=ctxt->threadId;
        ((packet_t*)message)->source.sw_node=dev->index;
        ((packet_t*)message)->source.port=portIndex;
        ((packet_t*)message)->lamport=ctxt->lamport;
    }
    
    DIRCC_LOG_PRINTF("numTargets=%u, pTargets=%p", numTargets, pTargets);    

    DIRCC_LOG_PRINTF("updating RTS");    
    dev->rtsFlags=0;    // Reflect that it is no longer on the RTC list due to the pop
    dev->rtc=false; 
    dircc_UpdateRTS(ctxt, dev);
    DIRCC_LOG_PRINTF("rtsFlags=%x", dev->rtsFlags);    
    
    DIRCC_LOG_PRINTF("end");    
    
    return vtable->outputPorts[portIndex].messageSize;
}
