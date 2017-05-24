
`ifndef _DIRCC_TYPES_PKG_
`define _DIRCC_TYPES_PKG_

package dircc_types_pkg;

    parameter DEVICE_USER_STATE_BYTES = 8;
    parameter EDGE_USER_STATE_BYTES = 5;
    parameter LAMPORT_WIDTH = 32;
    parameter PACKET_DATA_WIDTH = 96;

    parameter HW_ADDR_WIDTH = 32;
    parameter SW_ADDR_WIDTH = 8;
    parameter PORT_WIDTH = 8;
    parameter FLAG_WIDTH = 8;

    parameter DIRCC_STATE_WIDTH = 16;
    parameter DIRCC_STATE_EXTRA_WIDTH = 16;

    localparam BYTE_WIDTH = 8;
    localparam DEVICE_USER_STATE_WIDTH = BYTE_WIDTH*DEVICE_USER_STATE_BYTES;
    localparam EDGE_USER_STATE_WIDTH = BYTE_WIDTH*EDGE_USER_STATE_BYTES;

    typedef enum { FALSE, TRUE } bool;

    typedef bit [LAMPORT_WIDTH-1:0] lamport_t;
    typedef bit [PACKET_DATA_WIDTH-1:0] packet_data_t;
    typedef bit [HW_ADDR_WIDTH-1:0] hw_addr_t;
    typedef bit [SW_ADDR_WIDTH-1:0] sw_addr_t;
    typedef bit [PORT_WIDTH-1:0] port_t;
    typedef bit [FLAG_WIDTH-1:0] flag_t;

    typedef bit [DIRCC_STATE_WIDTH-1:0] dircc_state_t;
    typedef bit [DIRCC_STATE_EXTRA_WIDTH-1:0] dircc_state_extra_t;
    typedef bit [DEVICE_USER_STATE_WIDTH-1:0] device_user_state_t;
    typedef bit [EDGE_USER_STATE_WIDTH-1:0] edge_user_state_t;


    typedef struct packed {
        hw_addr_t hw_addr;
        sw_addr_t sw_addr;
        port_t port;
        flag_t flag;
    } address_t;
    
    typedef struct packed {
        address_t dest_addr;
        address_t src_addr;
        lamport_t lamport;
        packet_data_t data;
    } packet_t;

    typedef struct packed {
        dircc_state_t dircc_state;
        dircc_state_extra_t dircc_state_extra;
        device_user_state_t user_state;
    } device_state_t;
    
    typedef struct packed {
	    hw_addr_t src_hw_node;
	    sw_addr_t  dest_sw_node;
	    sw_addr_t src_sw_node;
	    port_t src_port;
	    edge_user_state_t user_state;
    } edge_state_t;

endpackage : dircc_types_pkg

`endif