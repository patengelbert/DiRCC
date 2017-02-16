
#include "dircc_defines.h"
#include "dircc_on_receive.h"

void dircc_on_receive(PThreadContext *ctxt, const void *message)
{
    DIRCC_LOG_PRINTF("begin\n");

    const packet_t *packet=(const packet_t*)message;

    // Map to the device and its vtable
    unsigned deviceIndex=packet->dest.device;
    DIRCC_LOG_PRINTF("finding vtable, device inst index=%u\n", deviceIndex);
    if (deviceIndex >= ctxt->numDevices)
    	DIRCC_LOG_AND_EXIT("device index %u >= num devices %u", deviceIndex, ctxt->numDevices);
    DeviceContext *dev=ctxt->devices + deviceIndex;
    const DeviceTypeVTable *vtable=dev->vtable;

    // Map to the particular port
    unsigned portIndex=packet->dest.port;
    fprintf(stderr, "softswitch_onReceive:   finding port, port name index=%u\n", portIndex);
    assert(portIndex < vtable->numInputs);
    const InputPortVTable *port=vtable->inputPorts + portIndex;
    receive_handler_t handler=port->receiveHandler;

    const void *eProps=0;
    void *eState=0;

    if(port->propertiesSize | port->stateSize){
        // We have to look up the edge info associated with this edge

        fprintf(stderr, "softswitch_onReceive:   finding edge info, src=%08x:%04x:%02x, msg.laport=%u\n", packet->source.thread, packet->source.device, packet->source.port, packet->lamport);


        const InputPortBinding *begin=dev->sources[portIndex].sourceBindings;
        const InputPortBinding *end=dev->sources[portIndex].sourceBindings+dev->sources[portIndex].numSources;

        // This will compile away into pure code, no library stuff
        auto edge=std::lower_bound(begin, end, packet->source, [](const InputPortBinding &a, const address_t &b){
            if(a.source.thread < b.thread) return true;
            if(a.source.thread > b.thread) return false;
            if(a.source.device < b.device) return true;
            if(a.source.device > b.device) return false;
            return a.source.port < b.port;
        });

        assert(edge->source.device==packet->source.device && edge->source.thread==packet->source.thread && edge->source.port==packet->source.port);

        eProps=edge->edgeProperties;
        eState=edge->edgeState;
        // If an edge has properties or state, you must deliver some
        assert(!port->propertiesSize || eProps);
        assert(!port->stateSize || eState);
    }


    // Call the application level handler
    fprintf(stderr, "softswitch_onReceive:   begin application handler, packet=%p, payload=%p\n", packet, packet->payload);
    handler(
        ctxt->graphProps,
        dev->properties,
        dev->state,
        eProps,
        eState,
        packet->payload
    );
    fprintf(stderr, "softswitch_onReceive:   end application handler\n");

    fprintf(stderr, "softswitch_onReceive:   updating RTS\n");
    softswitch_UpdateRTS(ctxt, dev);
    fprintf(stderr, "softswitch_onReceive:   new rts=%x\n", dev->rtsFlags);

    fprintf(stderr, "softswitch_onReceive: end\n");
}
