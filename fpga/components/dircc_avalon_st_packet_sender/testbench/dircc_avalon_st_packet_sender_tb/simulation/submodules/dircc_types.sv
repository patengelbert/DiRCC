
`ifndef _DIRCC_TYPES_PKG_
`define _DIRCC_TYPES_PKG_

package dircc_types_pkg;

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

endpackage : dircc_types_pkg

`endif