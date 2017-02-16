#ifndef DIRCC_INTERFACE
#define DIRCC_INTERFACE

#include "dircc_defines.h"

uint32_t dircc_my_id();

dircc_err_code dircc_init_fifo(uint32_t csr_address, uint16_t almost_empty, uint16_t almost_full);

dircc_err_code dircc_can_send();

dircc_err_code dircc_send(uint32_t data_address, uint32_t csr_address, const dircc_msg_t* msg);

dircc_err_code dircc_can_recv();

dircc_err_code dircc_recv(uint32_t data_address, uint32_t csr_address, dircc_msg_t* msg);

dircc_err_code dircc_clr_fifo(uint32_t data_address, uint32_t csr_address);

uint32_t dircc_get_level(uint32_t csr_address);

#endif // !DIRCC_INTERFACE
