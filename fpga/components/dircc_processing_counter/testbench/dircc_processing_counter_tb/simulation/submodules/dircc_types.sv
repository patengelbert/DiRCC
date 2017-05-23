
`ifndef _DIRCC_TYPES_PKG_
`define _DIRCC_TYPES_PKG_

package dircc_types_pkg;

    parameter int MAX_DEVICE_USER_STATE_BYTES = 8;
    parameter int MAX_EDGE_USER_STATE_BYTES = 5;

    typedef enum { FALSE, TRUE } bool;

    typedef struct packed {
        bit [31:0] hw_addr;
        bit [7:0] sw_addr;
        bit [7:0] port;
        bit [7:0] flag;
    } address_t;
    
    typedef struct packed {
        address_t dest_addr;
        address_t src_addr;
        bit [31:0] lamport;
        bit [95:0] data;
    } packet_t;

    typedef struct packed {
        bit [15:0] dircc_state;
        bit [15:0] dircc_state_extra;
        bit [(8*MAX_DEVICE_USER_STATE_BYTES)-1:0] user_state;
    } device_state_t;
    
    typedef struct packed {
	    bit [31:0] src_hw_node;
	    bit [7:0]  dest_sw_node;
	    bit [7:0] src_sw_node;
	    bit [7:0] src_port;
	    bit [(8*MAX_EDGE_USER_STATE_BYTES)-1:0] user_state;
    } edge_state_t;

endpackage : dircc_types_pkg

`endif