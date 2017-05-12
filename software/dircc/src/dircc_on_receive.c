
#include "dircc_defines.h"
#include "dircc_impl.h"
#include "dircc_helpers.h"
#include "dircc_rts.h"
#include "dircc_system_state.h"

#define MAX(a, b) a > b ? a : b

void dircc_onReceive(PThreadContext *ctxt, const void *message)
{
    DIRCC_LOG_PRINTF("begin");

    const packet_t *packet=(const packet_t*)message;

    // Update Lamport
    ctxt->lamport = MAX(ctxt->lamport, packet->lamport) + 1;

    // Map to the device and its vtable
    unsigned deviceIndex=packet->dest.sw_node;
    DIRCC_LOG_PRINTF("finding vtable, device inst index=%u", deviceIndex);
    DIRCC_ASSERT(ctxt, deviceIndex < ctxt->numDevices);
    DeviceContext *dev=ctxt->devices + deviceIndex;
    const DeviceTypeVTable *vtable=dev->vtable;

    dircc_unsetState(dev, DIRCC_STATE_IDLE);
    dircc_setState(dev, DIRCC_STATE_RECEIVE, &(dev->index));

    // Map to the particular port
    unsigned portIndex=packet->dest.port;
    DIRCC_LOG_PRINTF("finding port, port name index=%u", portIndex);
    DIRCC_ASSERT(ctxt, portIndex < vtable->numInputs);
    const InputPortVTable *port=vtable->inputPorts + portIndex;
    receive_handler_t handler=port->receiveHandler;

    const void *eProps=0;
    void *eState=0;

    if(port->propertiesSize || port->stateSize){

        // We have to look up the edge info associated with this edge
        DIRCC_LOG_PRINTF("finding edge info, src=%08x:%04x:%02x", packet->source.hw_node, packet->source.sw_node, packet->source.port);

        const InputPortBinding *edge=NULL;

        for (unsigned i = 0; i < dev->sources[portIndex].numSources; i++)
        {
        	edge = dev->sources[portIndex].sourceBindings + i;
        	if (edge->source.hw_node == packet->source.hw_node
        			&& edge->source.sw_node == packet->source.sw_node
        			&& edge->source.port == packet->source.port
        			)
        	{
        		DIRCC_LOG_PRINTF("found edge info %u", i);
        		break;
        	}

        }

#ifndef NDEBUG
        if(!(edge->source.hw_node==packet->source.hw_node && edge->source.sw_node==packet->source.sw_node && edge->source.port==packet->source.port))
        {
        	DIRCC_EXIT_FAILURE("Could not find edge info");
        }
#endif

        eProps=edge->edgeProperties;
        eState=edge->edgeState;
        // If an edge has properties or state, you must deliver some
        DIRCC_ASSERT(ctxt, !port->propertiesSize || eProps);
        DIRCC_ASSERT(ctxt, !port->stateSize || eState);
    }

    activeDevice = dev;

    // Call the application level handler
    DIRCC_LOG_PRINTF("begin application handler, packet=%p, payload=%p", packet, packet->payload);
    handler(
        ctxt->graphProps,
        dev->properties,
        &(((DeviceState *)dev->state)->userState),
        eProps,
        eState,
        packet->payload
    );

    activeDevice = NULL;

    dircc_unsetState(dev, DIRCC_STATE_RECEIVE);
    dircc_setState(dev, DIRCC_STATE_IDLE, NULL);

    DIRCC_LOG_PRINTF("end application handler");

    DIRCC_LOG_PRINTF("updating RTS");
    dircc_UpdateRTS(ctxt, dev);
    DIRCC_LOG_PRINTF("new rts=%x", dev->rtsFlags);

    DIRCC_LOG_PRINTF("end");
}
