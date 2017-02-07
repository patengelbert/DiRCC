#ifndef DIRCC_INTERFACE
#define DIRCC_INTERFACE

#include <stdint.h>

#define MAX_DATA_LEN 	6
#define DIRCC_MSG_SIZE 	4  //4 32 bit words long

#define ALMOST_EMPTY DIRCC_MSG_SIZE + 1
#define ALMOST_FULL STREAMING_0_FIFO_IN_IN_CSR_FIFO_DEPTH - DIRCC_MSG_SIZE

typedef uint32_t dircc_err_code;

typedef uint32_t device_addr_t;
typedef uint8_t port_index_t;

typedef struct{
	device_addr_t dest;  	// 32 bits
	device_addr_t source; 	// 32 bits
	port_index_t srcPort; 	// 8 bits
	port_index_t destPort;	// 8 bits
	uint8_t data[MAX_DATA_LEN];	//48 bits
} dircc_msg_t;

uint32_t dircc_myId();

dircc_err_code dircc_init_fifo(uint32_t csr_address);

dircc_err_code dircc_canSend();

dircc_err_code dircc_send(uint32_t data_address, uint32_t csr_address,
		const dircc_msg_t* msg);

dircc_err_code dircc_canRecv();

dircc_err_code dircc_recv(uint32_t data_address, uint32_t csr_address,
		dircc_msg_t* msg);

dircc_err_code dircc_clr_fifo(uint32_t data_address, uint32_t csr_address);

uint32_t dircc_get_level(uint32_t csr_address);

#endif // !DIRCC_INTERFACE
