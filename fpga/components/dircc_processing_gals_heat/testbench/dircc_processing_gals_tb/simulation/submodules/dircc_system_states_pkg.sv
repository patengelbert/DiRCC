
`ifndef _DIRCC_SYSTEM_STATES_PKG_
`define _DIRCC_SYSTEM_STATES_PKG_

package dircc_system_states_pkg;

    import dircc_types_pkg::*; 

    localparam STATE_BIT = 16'b1;

    typedef enum dircc_state_t
    {
        DIRCC_STATE_UNKNOWN 	= 	(STATE_BIT << 0),
        DIRCC_STATE_DISABLED	=	(STATE_BIT << 1),
        DIRCC_STATE_IDLE		=	(STATE_BIT << 2),
        DIRCC_STATE_BOOTING		= 	(STATE_BIT << 3),
        DIRCC_STATE_BOOTED		=	(STATE_BIT << 4),
        DIRCC_STATE_RUNNING		=	(STATE_BIT << 5),
        DIRCC_STATE_COMPUTE		=	(STATE_BIT << 6),
        DIRCC_STATE_RECEIVE		=	(STATE_BIT << 7),
        DIRCC_STATE_SEND		=	(STATE_BIT << 8),
        DIRCC_STATE_STOPPED		=	(STATE_BIT << 9),
        DIRCC_STATE_DONE		=	(STATE_BIT << 10),


        DIRCC_STATE_ERROR		=	(STATE_BIT << 15)
    } dircc_state_e;

endpackage : dircc_system_states_pkg

`endif