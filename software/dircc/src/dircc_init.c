#include "dircc.h"
#include "dircc_helpers.h"
#include "dircc_system_interface.h"
#include "dircc_rts.h"

inline void clear_array(uint8_t *arr, unsigned size)
{
	for (unsigned i=0; i < size; ++i)
	{
		*(arr+i) = 0;
	}
}

dircc_err_code dircc_init_fifos() {
	dircc_err_code err_in = dircc_init_fifo(dircc_fifo_in_csr_address,
	DIRCC_PACKET_SIZE - 1, dircc_fifo_in_depth - DIRCC_PACKET_SIZE);
	dircc_err_code err_out = dircc_init_fifo(dircc_fifo_out_csr_address,
	DIRCC_PACKET_SIZE - 1, dircc_fifo_out_depth - DIRCC_PACKET_SIZE);
	return err_in | err_out;
}

DeviceState devStates[MAX_VIRTUAL_ADDRESS] __attribute__((section(".shared_dev_data")));
EdgeState edgeStates[MAX_SUPPORTED_EDGES] __attribute__((section(".shared_edge_data")));


EdgeState *dircc_searchEdgeState(DeviceContext *dev, InputPortBinding *binding)
{
	for (unsigned i=0; i < MAX_SUPPORTED_EDGES; i++)
	{
		EdgeState * edge = edgeStates + i;
		if (edge->dest_sw_node == dev->index
				&& edge->src_hw_node == binding->source.hw_node
				&& edge->src_sw_node == binding->source.sw_node
				&& edge->src_port == binding->source.port)
		{
			return edge;
		}
	}
	DIRCC_EXIT_FAILURE("Could not find edge state for {%u,%u,%u,%u}", dev->index, binding->source.hw_node, binding->source.sw_node, binding->source.port);
	return NULL;
}

void dircc_LoadState(PThreadContext *pCtxt, DeviceContext *dev) {
	DeviceState *dState = devStates + dev->index;
	dState->dirccState=0;
	clear_array(dState->userState, MAX_DEVICE_USER_STATE_BYTES);
#ifndef NDEBUG
	if (pCtxt->threadId == 0 && dev->index == 0)
	{
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
		*((uint64_t *)(dState->userState)) = 0x10000;
#pragma GCC diagnostic warning "-Wstrict-aliasing"
	}
#endif
	dev->state = dState;
	DIRCC_LOG_PRINTF("Using state at address 0x%08x", dState);

	if (dev->sources->numSources > 0)
	{
		// We have edge states or properties to look at
		for (unsigned i=0; i < dev->sources->numSources; i++)
		{
			InputPortBinding *binding = dev->sources->sourceBindings + i;
			if (binding->edgeState != DIRCC_BINDING_NONE)
			{
				// We have an edge state to load
				EdgeState * eState = dircc_searchEdgeState(dev, binding);
				clear_array(eState->userState, MAX_EDGE_USER_STATE_BYTES);
				DIRCC_LOG_PRINTF("Using edge state at address 0x%08x for source {%u,%u,%u}" , eState, binding->source.hw_node, binding->source.sw_node, binding->source.port);
			}
		}
	}

}

void dircc_init(PThreadContext *ctxt) {
	dircc_err_code err;
	if ((err = dircc_init_fifos()) != DIRCC_SUCCESS)
		DIRCC_EXIT_FAILURE("Error initializing FIFOs: 0x%08x", err);

	ctxt->rtsHead = 0;
	ctxt->rtsTail = 0;

	for (uint32_t i = 0; i < ctxt->numDevices; ++i) {
		dircc_LoadState(ctxt, ctxt->devices + i);
		dircc_UpdateRTS(ctxt, ctxt->devices + i);
	}
}

