

#ifndef _DIRCC_HW_H_
#define _DIRCC_HW_H_

#include <stdint.h>

// setting for the HPS2FPGA AXI Bridge
#define ALT_AXI_FPGASLVS_OFST (0xC0000000) // axi_master
#define HW_FPGA_AXI_SPAN (0x40000000)      // Bridge span 1GB
#define HW_FPGA_AXI_MASK (HW_FPGA_AXI_SPAN - 1)

#define DIRCC_DEVICE_STATE_OFFSET 0x0000
#define DIRCC_EDGE_STATE_OFFSET 0x0C00

// Assorted addresses to allow for interface to the hardware
#define THREAD_PTR(x) ((void*) (ALT_AXI_FPGASLVS_OFST + x))

typedef struct _thread_address_map
{
    uint32_t thread_id;
    void*    address;
} thread_address_map;

extern uint32_t num_addresses;
extern uint32_t num_terminals;

extern thread_address_map dircc_thread_addresses[];
extern void*              dircc_terminal_addresses[];
#endif