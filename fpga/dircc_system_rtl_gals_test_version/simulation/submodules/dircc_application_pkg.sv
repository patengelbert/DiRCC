
`define DIRCC_ADDRESS_FLAG_NONE 0

package dircc_application_pkg;

    import dircc_types_pkg::*;

    parameter THREAD_COUNT = 6;

    parameter DEVICE_INSTANCE_COUNT_thread0 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread3 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread4 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread7 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread8 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread11 = 1;

    parameter DEV0_OUT_PORT_NUM = 1;
    parameter DEV0_IN_PORT_NUM = 1;
    parameter DEV0_PORT0_OUT_ADDRESS_NUM = 2;
    parameter DEV0_PORT0_SOURCE_BINDING_NUM = 2;

    parameter DEV3_OUT_PORT_NUM = 1;
    parameter DEV3_IN_PORT_NUM = 1;
    parameter DEV3_PORT0_OUT_ADDRESS_NUM = 2;
    parameter DEV3_PORT0_SOURCE_BINDING_NUM = 2;

    parameter DEV4_OUT_PORT_NUM = 1;
    parameter DEV4_IN_PORT_NUM = 1;
    parameter DEV4_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV4_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV7_OUT_PORT_NUM = 1;
    parameter DEV7_IN_PORT_NUM = 1;
    parameter DEV7_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV7_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV8_OUT_PORT_NUM = 1;
    parameter DEV8_IN_PORT_NUM = 1;
    parameter DEV8_PORT0_OUT_ADDRESS_NUM = 2;
    parameter DEV8_PORT0_SOURCE_BINDING_NUM = 2;

    parameter DEV11_OUT_PORT_NUM = 1;
    parameter DEV11_IN_PORT_NUM = 1;
    parameter DEV11_PORT0_OUT_ADDRESS_NUM = 2;
    parameter DEV11_PORT0_SOURCE_BINDING_NUM = 2;

    parameter INPUT_COUNT_dev = 1;
    parameter INPUT_INDEX_dev_in = 0;
    
    parameter OUTPUT_COUNT_dev = 1;
    parameter OUTPUT_INDEX_dev_port0 = 0;
    parameter OUTPUT_FLAG_dev_port0 = 1;

    parameter OUTPUT_INDEX_dev_port1 = 1;
    parameter OUTPUT_FLAG_dev_port1 = 2;

    parameter THREAD0_DEVICE_CONTEXT_NUM = 1;
    parameter THREAD1_DEVICE_CONTEXT_NUM = 1;

    parameter MAX_SOURCE_BINDING_NUM = 4;
    parameter MAX_OUTPUT_TARGETS = 4;
    parameter MAX_OUTPUT_PORTS = 1;
    parameter MAX_INPUT_PORTS = 1;
    parameter MAX_DEVICES = 1;

    typedef struct packed {
        bit[12:0] t;
        bit[13:0] temp;
        bit[31:0] source;
        bit[31:0] count;
        bit isDesignatedPacket;
    } temp_msg_t;

    typedef struct packed {
        bit isDesignatedSender;
        bit [12:0] t;
        bit [13:0] heat;
        bit [13:0] accNow;
        bit [2:0] seenNow;
        bit [14:0] accNext;
        bit [2:0] seenNext;
    } dev_state_t;

    typedef struct {
        int maxTime;
    } GraphProperties;

    typedef struct packed {
        int weight;
    } EdgeProperties;

    typedef struct packed {
        int neighbourCount;    // How many inputs are connected to this node?
        int selfWeight;         // Weighting of self in relaxation kernel.
        int initValue;          // Value at startup
        int isDirichlet;           // Indicates cells that have a forcing condition
        int isSender;
    } DeviceProperties;

    typedef struct packed {
        address_t address;
        EdgeProperties properties;
        // edge_state
    } InputPortBinding;

    typedef struct {
        int numSources;
        InputPortBinding sourceBindings [MAX_SOURCE_BINDING_NUM-1:0];
    } InputPortSources;

    typedef struct {
        int numTargets;
        address_t targets [MAX_OUTPUT_TARGETS-1:0];
    } OutputPortTargets;

    typedef struct {
        DeviceProperties properties;
        int index;
        OutputPortTargets targets [MAX_OUTPUT_PORTS-1:0];
        InputPortSources sources [MAX_INPUT_PORTS-1:0];
    } DeviceContext;

    typedef struct {
        int threadId;
        GraphProperties properties;
        int numDevices;
        DeviceContext devices [MAX_DEVICES-1:0];
    } PThreadContext;

    parameter EdgeProperties NULL_EDGE_PROPS = '{
            weight : 0
    };
    
    parameter address_t NULL_ADDRESS = '{
            hw_addr : 0,
            sw_addr : 0,
            port : 0,
            flag : `DIRCC_ADDRESS_FLAG_NONE
    };

    parameter InputPortBinding NULL_BINDING = '{
            address : NULL_ADDRESS,
            properties : NULL_EDGE_PROPS
    };

    parameter GraphProperties inst_props = '{
            maxTime : 5000
    };

    // Thread 0 (0, 0)

    parameter address_t dev0_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            NULL_ADDRESS,
            '{
                    // Thread 3
                    hw_addr : 32'h00000006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    // Thread 4
                    hw_addr : 32'h00010001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev0_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev0_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV0_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        NULL_BINDING,
                        dev0_port0_binding,
                        dev0_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev0_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV0_PORT0_OUT_ADDRESS_NUM,
                    targets : dev0_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev0_properties = '{
            neighbourCount : 2,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1,
            isSender : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev0_properties,
                    index : 0,
                    targets : dev0_targets,
                    sources : dev0_sources
            }
    };

    // Thread 3 (0, 8)

    parameter address_t dev3_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,            
            NULL_ADDRESS,
            '{
                    // Thread 0
                    hw_addr : 32'h00010003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    // Thread 7
                    hw_addr : 32'h00020004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev3_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev3_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV3_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        NULL_BINDING,
                        dev3_port0_binding,
                        dev3_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev3_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV3_PORT0_OUT_ADDRESS_NUM,
                    targets : dev3_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev3_properties = '{
            neighbourCount : 2,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1,
            isSender : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread3[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev3_properties,
                    index : 0,
                    targets : dev3_targets,
                    sources : dev3_sources
            }
    };
    
    

    // Thread 4 (1, 0)

    parameter address_t dev4_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    // Thread 0
                    hw_addr : 32'h00010003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    // Thread 7
                    hw_addr : 32'h00020004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    // Thread 8
                    hw_addr : 32'h00010002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev4_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev4_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV4_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev4_port0_binding,
                        dev4_port0_binding,
                        dev4_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev4_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV4_PORT0_OUT_ADDRESS_NUM,
                    targets : dev4_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev4_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0,
            isSender : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread4[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev4_properties,
                    index : 0,
                    targets : dev4_targets,
                    sources : dev4_sources
            }
    };

    // Thread 7 (1, 8)

    parameter address_t dev7_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    // Thread 3
                    hw_addr : 32'h00000006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    // Thread 4
                    hw_addr : 32'h00010001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    // Thread 11 
                    hw_addr : 32'h00010004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev7_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev7_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV7_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev7_port0_binding,
                        dev7_port0_binding,
                        dev7_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev7_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV7_PORT0_OUT_ADDRESS_NUM,
                    targets : dev7_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev7_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1,
            isSender : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread7[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev7_properties,
                    index : 0,
                    targets : dev7_targets,
                    sources : dev7_sources
            }
    };

    // Thread 8 (2, 0)

    parameter address_t dev8_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            NULL_ADDRESS,
            '{
                    // Thread 4
                    hw_addr : 32'h00010001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    // Thread 11
                    hw_addr : 32'h00010004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev8_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev8_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV8_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        NULL_BINDING,
                        dev8_port0_binding,
                        dev8_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev8_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV8_PORT0_OUT_ADDRESS_NUM,
                    targets : dev8_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev8_properties = '{
            neighbourCount : 2,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1,
            isSender : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread8[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev8_properties,
                    index : 0,
                    targets : dev8_targets,
                    sources : dev8_sources
            }
    };

    // Thread 11 (2, 8)

    parameter address_t dev11_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            NULL_ADDRESS,
            '{
                    // Thread 8
                    hw_addr : 32'h00010002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    // Thread 7
                    hw_addr : 32'h00020004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev11_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev11_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV11_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        NULL_BINDING,
                        dev11_port0_binding,
                        dev11_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev11_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV11_PORT0_OUT_ADDRESS_NUM,
                    targets : dev11_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev11_properties = '{
            neighbourCount : 2,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1,
            isSender : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread11[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev11_properties,
                    index : 0,
                    targets : dev11_targets,
                    sources : dev11_sources
            }
    };

    parameter PThreadContext dircc_thread_contexts[THREAD_COUNT-1:0] = '{
            '{
                    threadId : 32'h00010003,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread0,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread0
            },
            '{
                    threadId : 32'h00000006,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread3,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread3
            },
            '{
                    threadId : 32'h00010001,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread4,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread4
            },
            '{
                    threadId : 32'h00020004,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread7,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread7
            },
            '{
                    threadId : 32'h00010002,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread8,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread8
            },
            '{
                    threadId : 32'h00010004,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread11,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread11
            }
    };

endpackage : dircc_application_pkg