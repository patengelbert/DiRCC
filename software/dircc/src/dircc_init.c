#include "dircc.h"
#include "dircc_fifo_interface.h"
#include "dircc_rts.h"

dircc_err_code dircc_init_fifos() {
	dircc_err_code err_in = dircc_init_fifo(dircc_fifo_in_csr_address,
	DIRCC_PACKET_SIZE-1, dircc_fifo_in_depth - DIRCC_PACKET_SIZE);
	dircc_err_code err_out = dircc_init_fifo(dircc_fifo_out_csr_address,
	DIRCC_PACKET_SIZE-1, dircc_fifo_out_depth - DIRCC_PACKET_SIZE);
	return err_in | err_out;
}

void dircc_init(PThreadContext *ctxt)
{
	dircc_err_code err;
    if ((err = dircc_init_fifos()) != DIRCC_SUCCESS)
		DIRCC_LOG_AND_EXIT("Error initilizing FIFOs: 0x%08x", err);

    ctxt->rtsHead = 0;
    ctxt->rtsTail=0;
    
    for(uint32_t i=0; i<ctxt->numDevices; i++){        
        dircc_UpdateRTS(ctxt, ctxt->devices+i);
    }
}


