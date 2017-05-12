#ifndef DIRCC_FIFO_INTERFACE
#define DIRCC_FIFO_INTERFACE

#include "dircc.h"

uint32_t dircc_thread_id();

dircc_err_code dircc_init_fifo(uint32_t csr_address, uint32_t almost_empty,
		uint32_t almost_full);

dircc_err_code dircc_can_send();

dircc_err_code dircc_send(uint32_t data_address, uint32_t csr_address,
		const packet_t* msg);

dircc_err_code dircc_can_recv();

dircc_err_code dircc_recv(uint32_t data_address, uint32_t csr_address,
		packet_t* msg);

dircc_err_code dircc_clr_fifo(uint32_t data_address, uint32_t csr_address);

#endif // !DIRCC_FIFO_INTERFACE
