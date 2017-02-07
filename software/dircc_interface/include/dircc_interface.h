#ifndef DIRCC_INTERFACE
#define DIRCC_INTERFACE

#include <stdint.h>

#define MAX_DATA_LEN 	8
#define DIRCC_MSG_SIZE  sizeof(dircc_msg_t)/sizeof(uint32_t)  //5 32 bit words long

#define ALMOST_EMPTY DIRCC_MSG_SIZE - 1
#define ALMOST_FULL STREAMING_0_FIFO_IN_IN_CSR_FIFO_DEPTH - DIRCC_MSG_SIZE

typedef uint32_t dircc_err_code;

typedef uint32_t device_addr_t;
typedef uint16_t port_index_t;

typedef struct{
	device_addr_t dest;  	// 32 bits
	device_addr_t source; 	// 32 bits
	port_index_t src_port; 	// 16 bits
	port_index_t dest_port;	// 16 bits
	uint8_t data[MAX_DATA_LEN];	//64 bits
} dircc_msg_t;

uint32_t dircc_my_id();

dircc_err_code dircc_init_fifo(uint32_t csr_address);

dircc_err_code dircc_can_send();

dircc_err_code dircc_send(uint32_t data_address, uint32_t csr_address,
		const dircc_msg_t* msg);

dircc_err_code dircc_can_recv();

dircc_err_code dircc_recv(uint32_t data_address, uint32_t csr_address,
		dircc_msg_t* msg);

dircc_err_code dircc_clr_fifo(uint32_t data_address, uint32_t csr_address);

uint32_t dircc_get_level(uint32_t csr_address);

#endif // !DIRCC_INTERFACE
