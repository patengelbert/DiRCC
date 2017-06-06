
`define DIRCC_ADDRESS_FLAG_NONE 0

package dircc_application_pkg;

    import dircc_types_pkg::*;

    parameter THREAD_COUNT = 27;

    parameter DEVICE_INSTANCE_COUNT_thread0 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread1 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread2 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread3 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread4 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread5 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread6 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread7 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread8 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread9 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread10 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread11 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread12 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread13 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread14 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread15 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread16 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread17 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread18 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread19 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread20 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread21 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread22 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread23 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread24 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread25 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread26 = 1;

    parameter DEV0_OUT_PORT_NUM = 1;
    parameter DEV0_IN_PORT_NUM = 1;
    parameter DEV0_PORT0_OUT_ADDRESS_NUM = 2;
    parameter DEV0_PORT0_SOURCE_BINDING_NUM = 2;

    parameter DEV1_OUT_PORT_NUM = 1;
    parameter DEV1_IN_PORT_NUM = 1;
    parameter DEV1_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV1_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV2_OUT_PORT_NUM = 1;
    parameter DEV2_IN_PORT_NUM = 1;
    parameter DEV2_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV2_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV3_OUT_PORT_NUM = 1;
    parameter DEV3_IN_PORT_NUM = 1;
    parameter DEV3_PORT0_OUT_ADDRESS_NUM = 2;
    parameter DEV3_PORT0_SOURCE_BINDING_NUM = 2;

    parameter DEV4_OUT_PORT_NUM = 1;
    parameter DEV4_IN_PORT_NUM = 1;
    parameter DEV4_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV4_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV5_OUT_PORT_NUM = 1;
    parameter DEV5_IN_PORT_NUM = 1;
    parameter DEV5_PORT0_OUT_ADDRESS_NUM = 4;
    parameter DEV5_PORT0_SOURCE_BINDING_NUM = 4;

    parameter DEV6_OUT_PORT_NUM = 1;
    parameter DEV6_IN_PORT_NUM = 1;
    parameter DEV6_PORT0_OUT_ADDRESS_NUM = 4;
    parameter DEV6_PORT0_SOURCE_BINDING_NUM = 4;

    parameter DEV7_OUT_PORT_NUM = 1;
    parameter DEV7_IN_PORT_NUM = 1;
    parameter DEV7_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV7_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV8_OUT_PORT_NUM = 1;
    parameter DEV8_IN_PORT_NUM = 1;
    parameter DEV8_PORT0_OUT_ADDRESS_NUM = 2;
    parameter DEV8_PORT0_SOURCE_BINDING_NUM = 2;

    parameter DEV9_OUT_PORT_NUM = 1;
    parameter DEV9_IN_PORT_NUM = 1;
    parameter DEV9_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV9_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV10_OUT_PORT_NUM = 1;
    parameter DEV10_IN_PORT_NUM = 1;
    parameter DEV10_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV10_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV11_OUT_PORT_NUM = 1;
    parameter DEV11_IN_PORT_NUM = 1;
    parameter DEV11_PORT0_OUT_ADDRESS_NUM = 2;
    parameter DEV11_PORT0_SOURCE_BINDING_NUM = 2;

    parameter DEV12_OUT_PORT_NUM = 1;
    parameter DEV12_IN_PORT_NUM = 1;
    parameter DEV12_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV12_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV13_OUT_PORT_NUM = 1;
    parameter DEV13_IN_PORT_NUM = 1;
    parameter DEV13_PORT0_OUT_ADDRESS_NUM = 4;
    parameter DEV13_PORT0_SOURCE_BINDING_NUM = 4;

    parameter DEV14_OUT_PORT_NUM = 1;
    parameter DEV14_IN_PORT_NUM = 1;
    parameter DEV14_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV14_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV15_OUT_PORT_NUM = 1;
    parameter DEV15_IN_PORT_NUM = 1;
    parameter DEV15_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV15_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV16_OUT_PORT_NUM = 1;
    parameter DEV16_IN_PORT_NUM = 1;
    parameter DEV16_PORT0_OUT_ADDRESS_NUM = 4;
    parameter DEV16_PORT0_SOURCE_BINDING_NUM = 4;

    parameter DEV17_OUT_PORT_NUM = 1;
    parameter DEV17_IN_PORT_NUM = 1;
    parameter DEV17_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV17_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV18_OUT_PORT_NUM = 1;
    parameter DEV18_IN_PORT_NUM = 1;
    parameter DEV18_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV18_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV19_OUT_PORT_NUM = 1;
    parameter DEV19_IN_PORT_NUM = 1;
    parameter DEV19_PORT0_OUT_ADDRESS_NUM = 4;
    parameter DEV19_PORT0_SOURCE_BINDING_NUM = 4;

    parameter DEV20_OUT_PORT_NUM = 1;
    parameter DEV20_IN_PORT_NUM = 1;
    parameter DEV20_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV20_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV21_OUT_PORT_NUM = 1;
    parameter DEV21_IN_PORT_NUM = 1;
    parameter DEV21_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV21_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV22_OUT_PORT_NUM = 1;
    parameter DEV22_IN_PORT_NUM = 1;
    parameter DEV22_PORT0_OUT_ADDRESS_NUM = 4;
    parameter DEV22_PORT0_SOURCE_BINDING_NUM = 4;

    parameter DEV23_OUT_PORT_NUM = 1;
    parameter DEV23_IN_PORT_NUM = 1;
    parameter DEV23_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV23_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV24_OUT_PORT_NUM = 1;
    parameter DEV24_IN_PORT_NUM = 1;
    parameter DEV24_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV24_PORT0_SOURCE_BINDING_NUM = 3;

    parameter DEV25_OUT_PORT_NUM = 1;
    parameter DEV25_IN_PORT_NUM = 1;
    parameter DEV25_PORT0_OUT_ADDRESS_NUM = 4;
    parameter DEV25_PORT0_SOURCE_BINDING_NUM = 4;

    parameter DEV26_OUT_PORT_NUM = 1;
    parameter DEV26_IN_PORT_NUM = 1;
    parameter DEV26_PORT0_OUT_ADDRESS_NUM = 3;
    parameter DEV26_PORT0_SOURCE_BINDING_NUM = 3;


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
        bit[14:0] temp;
    } temp_msg_t;

    typedef struct packed {
        bit [12:0] t;
        bit [14:0] heat;
        bit [14:0] accNow;
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
                    hw_addr : 32'h00000001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010000,
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
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev0_properties,
                    index : 0,
                    targets : dev0_targets,
                    sources : dev0_sources
            }
    };

    // Thread 1 (0, 1)

    parameter address_t dev1_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,            
            '{
                    hw_addr : 32'h00000002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00000000,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev1_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev1_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV1_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev1_port0_binding,
                        dev1_port0_binding,
                        dev1_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev1_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV1_PORT0_OUT_ADDRESS_NUM,
                    targets : dev1_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev1_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread1[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev1_properties,
                    index : 0,
                    targets : dev1_targets,
                    sources : dev1_sources
            }
    };


    // Thread 2 (0, 2)

    parameter address_t dev2_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,            
            '{
                    hw_addr : 32'h00000003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00000001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev2_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev2_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV2_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev2_port0_binding,
                        dev2_port0_binding,
                        dev2_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev2_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV2_PORT0_OUT_ADDRESS_NUM,
                    targets : dev2_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev2_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread2[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev2_properties,
                    index : 0,
                    targets : dev2_targets,
                    sources : dev2_sources
            }
    };


    // Thread 3 (0, 8)

    parameter address_t dev3_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,            
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00000007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010008,
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
            isDirichlet : 1
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
                    hw_addr : 32'h00000000,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020000,
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
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread4[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev4_properties,
                    index : 0,
                    targets : dev4_targets,
                    sources : dev4_sources
            }
    };

    // Thread 5 (1, 1)

    parameter address_t dev5_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00000001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010000,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev5_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev5_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV5_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        dev5_port0_binding,
                        dev5_port0_binding,
                        dev5_port0_binding,
                        dev5_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev5_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV5_PORT0_OUT_ADDRESS_NUM,
                    targets : dev5_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev5_properties = '{
            neighbourCount : 4,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread5[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev5_properties,
                    index : 0,
                    targets : dev5_targets,
                    sources : dev5_sources
            }
    };

    // Thread 6 (1, 2)

    parameter address_t dev6_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00000002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev6_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev6_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV6_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        dev6_port0_binding,
                        dev6_port0_binding,
                        dev6_port0_binding,
                        dev6_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev6_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV6_PORT0_OUT_ADDRESS_NUM,
                    targets : dev6_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev6_properties = '{
            neighbourCount : 4,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread6[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev6_properties,
                    index : 0,
                    targets : dev6_targets,
                    sources : dev6_sources
            }
    };

    // Thread 7 (1, 8)

    parameter address_t dev7_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00000008,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020008,
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
            isDirichlet : 1
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
                    hw_addr : 32'h00010000,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020001,
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
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread8[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev8_properties,
                    index : 0,
                    targets : dev8_targets,
                    sources : dev8_sources
            }
    };

    // Thread 9 (2, 1)

    parameter address_t dev9_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00010001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020000,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev9_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev9_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV9_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev9_port0_binding,
                        dev9_port0_binding,
                        dev9_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev9_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV9_PORT0_OUT_ADDRESS_NUM,
                    targets : dev9_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev9_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread9[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev9_properties,
                    index : 0,
                    targets : dev9_targets,
                    sources : dev9_sources
            }
    };

    // Thread 10 (2, 2)

    parameter address_t dev10_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00010002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev10_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev10_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV10_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev10_port0_binding,
                        dev10_port0_binding,
                        dev10_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev10_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV10_PORT0_OUT_ADDRESS_NUM,
                    targets : dev10_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev10_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread10[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev10_properties,
                    index : 0,
                    targets : dev10_targets,
                    sources : dev10_sources
            }
    };

    // Thread 11 (2, 8)

    parameter address_t dev11_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00020007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010008,
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
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread11[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev11_properties,
                    index : 0,
                    targets : dev11_targets,
                    sources : dev11_sources
            }
    };

    // Thread 12 (0, 3)

    parameter address_t dev12_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00000002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00000004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev12_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev12_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV12_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev12_port0_binding,
                        dev12_port0_binding,
                        dev12_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev12_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV12_PORT0_OUT_ADDRESS_NUM,
                    targets : dev12_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev12_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread12[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev12_properties,
                    index : 0,
                    targets : dev12_targets,
                    sources : dev12_sources
            }
    };

    // Thread 13 (1, 3)

    parameter address_t dev13_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00000003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev13_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev13_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV13_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        dev13_port0_binding,
                        dev13_port0_binding,
                        dev13_port0_binding,
                        dev13_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev13_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV13_PORT0_OUT_ADDRESS_NUM,
                    targets : dev13_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev13_properties = '{
            neighbourCount : 4,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread13[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev13_properties,
                    index : 0,
                    targets : dev13_targets,
                    sources : dev13_sources
            }
    };

    // Thread 14 (2, 3)

    parameter address_t dev14_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00010003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020002,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev14_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev14_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV14_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev14_port0_binding,
                        dev14_port0_binding,
                        dev14_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev14_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV14_PORT0_OUT_ADDRESS_NUM,
                    targets : dev14_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev14_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread14[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev14_properties,
                    index : 0,
                    targets : dev14_targets,
                    sources : dev14_sources
            }
    };

    // Thread 15 (0, 4)

    parameter address_t dev15_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00000003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00000005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev15_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev15_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV15_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev15_port0_binding,
                        dev15_port0_binding,
                        dev15_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev15_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV15_PORT0_OUT_ADDRESS_NUM,
                    targets : dev15_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev15_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread15[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev15_properties,
                    index : 0,
                    targets : dev15_targets,
                    sources : dev15_sources
            }
    };

    // Thread 16 (1, 4)

    parameter address_t dev16_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00000004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev16_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev16_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV16_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        dev16_port0_binding,
                        dev16_port0_binding,
                        dev16_port0_binding,
                        dev16_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev16_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV16_PORT0_OUT_ADDRESS_NUM,
                    targets : dev16_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev16_properties = '{
            neighbourCount : 4,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread16[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev16_properties,
                    index : 0,
                    targets : dev16_targets,
                    sources : dev16_sources
            }
    };

    // Thread 17 (2, 4)

    parameter address_t dev17_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00010004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020003,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev17_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev17_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV17_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev17_port0_binding,
                        dev17_port0_binding,
                        dev17_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev17_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV17_PORT0_OUT_ADDRESS_NUM,
                    targets : dev17_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev17_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread17[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev17_properties,
                    index : 0,
                    targets : dev17_targets,
                    sources : dev17_sources
            }
    };

    // Thread 18 (0, 5)

    parameter address_t dev18_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00000004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00000006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev18_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev18_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV18_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev18_port0_binding,
                        dev18_port0_binding,
                        dev18_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev18_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV18_PORT0_OUT_ADDRESS_NUM,
                    targets : dev18_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev18_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread18[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev18_properties,
                    index : 0,
                    targets : dev18_targets,
                    sources : dev18_sources
            }
    };

    // Thread 19 (1, 5)

    parameter address_t dev19_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00000005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev19_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev19_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV19_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        dev19_port0_binding,
                        dev19_port0_binding,
                        dev19_port0_binding,
                        dev19_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev19_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV19_PORT0_OUT_ADDRESS_NUM,
                    targets : dev19_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev19_properties = '{
            neighbourCount : 4,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread19[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev19_properties,
                    index : 0,
                    targets : dev19_targets,
                    sources : dev19_sources
            }
    };

    // Thread 20 (2, 5)

    parameter address_t dev20_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00010005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020004,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev20_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev20_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV20_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev20_port0_binding,
                        dev20_port0_binding,
                        dev20_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev20_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV20_PORT0_OUT_ADDRESS_NUM,
                    targets : dev20_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev20_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread20[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev20_properties,
                    index : 0,
                    targets : dev20_targets,
                    sources : dev20_sources
            }
    };

    // Thread 21 (0, 6)

    parameter address_t dev21_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00000005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00000007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev21_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev21_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV21_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev21_port0_binding,
                        dev21_port0_binding,
                        dev21_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev21_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV21_PORT0_OUT_ADDRESS_NUM,
                    targets : dev21_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev21_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread21[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev21_properties,
                    index : 0,
                    targets : dev21_targets,
                    sources : dev21_sources
            }
    };

    // Thread 22 (1, 6)

    parameter address_t dev22_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00000006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev22_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev22_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV22_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        dev22_port0_binding,
                        dev22_port0_binding,
                        dev22_port0_binding,
                        dev22_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev22_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV22_PORT0_OUT_ADDRESS_NUM,
                    targets : dev22_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev22_properties = '{
            neighbourCount : 4,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread22[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev22_properties,
                    index : 0,
                    targets : dev22_targets,
                    sources : dev22_sources
            }
    };

    // Thread 23 (2, 6)

    parameter address_t dev23_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00010006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020005,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev23_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev23_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV23_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev23_port0_binding,
                        dev23_port0_binding,
                        dev23_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev23_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV23_PORT0_OUT_ADDRESS_NUM,
                    targets : dev23_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev23_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread23[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev23_properties,
                    index : 0,
                    targets : dev23_targets,
                    sources : dev23_sources
            }
    };

    // Thread 24 (0, 7)

    parameter address_t dev24_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00000006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00000008,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev24_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev24_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV24_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev24_port0_binding,
                        dev24_port0_binding,
                        dev24_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev24_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV24_PORT0_OUT_ADDRESS_NUM,
                    targets : dev24_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev24_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 1,
            isDirichlet : 1
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread24[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev24_properties,
                    index : 0,
                    targets : dev24_targets,
                    sources : dev24_sources
            }
    };

    // Thread 25 (1, 7)

    parameter address_t dev25_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00000007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00010008,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev25_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev25_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV25_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        dev25_port0_binding,
                        dev25_port0_binding,
                        dev25_port0_binding,
                        dev25_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev25_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV25_PORT0_OUT_ADDRESS_NUM,
                    targets : dev25_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev25_properties = '{
            neighbourCount : 4,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread25[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev25_properties,
                    index : 0,
                    targets : dev25_targets,
                    sources : dev25_sources
            }
    };

    // Thread 26 (2, 7)

    parameter address_t dev26_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            NULL_ADDRESS,
            '{
                    hw_addr : 32'h00010007,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020008,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 32'h00020006,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortBinding dev26_port0_binding = '{
        address : NULL_ADDRESS,
        properties : '{
                    weight : 1
        }
    };

    parameter InputPortSources dev26_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV26_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_BINDING,
                        dev26_port0_binding,
                        dev26_port0_binding,
                        dev26_port0_binding
                    }
            }
    };

    parameter OutputPortTargets dev26_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV26_PORT0_OUT_ADDRESS_NUM,
                    targets : dev26_port0_out_addresses 
            }
    };

    parameter DeviceProperties dev26_properties = '{
            neighbourCount : 3,
            selfWeight : 1,
            initValue : 0,
            isDirichlet : 0
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread26[MAX_DEVICES-1:0] = '{
            '{
                    properties : dev26_properties,
                    index : 0,
                    targets : dev26_targets,
                    sources : dev26_sources
            }
    };

    parameter PThreadContext dircc_thread_contexts[THREAD_COUNT-1:0] = '{
            '{
                    threadId : 32'h00000000,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread0,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread0
            },
            '{
                    threadId : 32'h00000001,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread1,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread1
            },
            '{
                    threadId : 32'h00000002,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread2,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread2
            },
            '{
                    threadId : 32'h00000008,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread3,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread3
            },
            '{
                    threadId : 32'h00010000,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread4,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread4
            },
            '{
                    threadId : 32'h00010001,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread5,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread5
            },
            '{
                    threadId : 32'h00010002,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread6,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread6
            },
            '{
                    threadId : 32'h00010008,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread7,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread7
            },
            '{
                    threadId : 32'h00020000,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread8,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread8
            },
            '{
                    threadId : 32'h00020001,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread9,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread9
            },
            '{
                    threadId : 32'h00020002,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread10,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread10
            },
            '{
                    threadId : 32'h00020008,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread11,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread11
            },
            '{
                    threadId : 32'h00000003,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread12,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread12
            },
            '{
                    threadId : 32'h00010003,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread13,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread13
            },
            '{
                    threadId : 32'h00020003,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread14,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread14
            },
            '{
                    threadId : 32'h00000004,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread15,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread15
            },
            '{
                    threadId : 32'h00010004,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread16,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread16
            },
            '{
                    threadId : 32'h00020004,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread17,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread17
            },
            '{
                    threadId : 32'h00000005,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread18,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread18
            },
            '{
                    threadId : 32'h00010005,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread19,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread19
            },
            '{
                    threadId : 32'h00020005,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread20,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread20
            },
            '{
                    threadId : 32'h00000006,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread21,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread21
            },
            '{
                    threadId : 32'h00010006,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread22,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread22
            },
            '{
                    threadId : 32'h00020006,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread23,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread23
            },
            '{
                    threadId : 32'h00000007,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread24,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread24
            },
            '{
                    threadId : 32'h00010007,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread25,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread25
            },
            '{
                    threadId : 32'h00020007,
                    properties : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread26,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread26
            }
    };

endpackage : dircc_application_pkg