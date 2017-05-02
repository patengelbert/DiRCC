#include "dircc.h"
#include "dircc_helpers.h"
#include "dircc_system_interface.h"
#include "dircc_rts.h"

dircc_err_code dircc_init_fifos() {
	dircc_err_code err_in = dircc_init_fifo(dircc_fifo_in_csr_address,
	DIRCC_PACKET_SIZE - 1, dircc_fifo_in_depth - DIRCC_PACKET_SIZE);
	dircc_err_code err_out = dircc_init_fifo(dircc_fifo_out_csr_address,
	DIRCC_PACKET_SIZE - 1, dircc_fifo_out_depth - DIRCC_PACKET_SIZE);
	return err_in | err_out;
}

DeviceState devStates[MAX_VIRTUAL_ADDRESS] __attribute__((section(".shared")));

void dircc_LoadState(PThreadContext *pCtxt, DeviceContext *dev) {
	DeviceState *state = devStates + dev->index;
	state->dirccState=0;
	state->userState= dircc_thread_id() + dev->index == 0 ? 0x00010000 : 0;

	dev->state = state;
	DIRCC_LOG_PRINTF("Using state at address 0x%08x", state);

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

