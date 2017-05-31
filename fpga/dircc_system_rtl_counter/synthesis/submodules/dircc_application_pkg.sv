
`define DIRCC_ADDRESS_FLAG_NONE 0

package dircc_application_pkg;

    import dircc_types_pkg::*;

    parameter THREAD_COUNT = 2;

    parameter DEVICE_INSTANCE_COUNT = 2;
    parameter DEVICE_INSTANCE_COUNT_thread0 = 1;
    parameter DEVICE_INSTANCE_COUNT_thread1 = 1;

    parameter DEV0_OUT_PORT_NUM = 1;
    parameter DEV0_IN_PORT_NUM = 1;
    parameter DEV0_PORT0_OUT_ADDRESS_NUM = 1;
    parameter DEV0_PORT0_SOURCE_BINDING_NUM = 0;

    parameter DEV1_OUT_PORT_NUM = 1;
    parameter DEV1_IN_PORT_NUM = 1;
    parameter DEV1_PORT0_OUT_ADDRESS_NUM = 1;
    parameter DEV1_PORT0_SOURCE_BINDING_NUM = 0;

    parameter INPUT_COUNT_dev = 1;
    parameter INPUT_INDEX_dev_in = 0;
    
    parameter OUTPUT_COUNT_dev = 1;
    parameter OUTPUT_INDEX_dev_port0 = 0;
    parameter OUTPUT_FLAG_dev_port0 = 1;

    parameter OUTPUT_INDEX_dev_port1 = 1;
    parameter OUTPUT_FLAG_dev_port1 = 2;

    parameter THREAD0_DEVICE_CONTEXT_NUM = 1;
    parameter THREAD1_DEVICE_CONTEXT_NUM = 1;

    parameter MAX_SOURCE_BINDING_NUM = 1;
    parameter MAX_OUTPUT_TARGETS = 1;
    parameter MAX_OUTPUT_PORTS = 1;
    parameter MAX_INPUT_PORTS = 1;
    parameter MAX_DEVICES = 1;

    typedef struct {
        int maxTime;
    } graph_props;

    typedef struct {
        int numSources;
        address_t sourceBindings [MAX_SOURCE_BINDING_NUM-1:0];
    } InputPortSources;

    typedef struct {
        int numTargets;
        address_t targets [MAX_OUTPUT_TARGETS-1:0];
    } OutputPortTargets;

    typedef struct {
        int properties;
        int index;
        OutputPortTargets targets [MAX_OUTPUT_PORTS-1:0];
        InputPortSources sources [MAX_INPUT_PORTS-1:0];
        int rtsFlags;
        bool rtc;
    } DeviceContext;

    typedef struct {
        int threadId;
        graph_props graphProps;
        int numDevices;
        DeviceContext devices [MAX_DEVICES-1:0];
    } PThreadContext;
    
    parameter address_t NULL_ADDRESS = '{
            hw_addr : 0,
            sw_addr : 0,
            port : 0,
            flag : `DIRCC_ADDRESS_FLAG_NONE
    };

    // Thread 0

    parameter graph_props inst_0_props = '{
            maxTime : 10
    };

    // fanout out
    parameter address_t dev0_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00010001,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortSources dev0_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV0_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_ADDRESS
                    }
            }
    };

    parameter OutputPortTargets dev0_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV0_PORT0_OUT_ADDRESS_NUM,
                    targets : dev0_port0_out_addresses 
            }
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[MAX_DEVICES-1:0] = '{
            '{
                    properties : 0,
                    index : 0,
                    targets : dev0_targets,
                    sources : dev0_sources,
                    rtsFlags : 0,
                    rtc : FALSE
            }
    };

    // Thread 1

    parameter graph_props inst_1_props = '{
            maxTime : 10
    };

    // fanout out
    parameter address_t dev1_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 32'h00000000,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter InputPortSources dev1_sources[MAX_INPUT_PORTS-1:0] = '{
            '{
                    numSources : DEV1_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : '{
                        NULL_ADDRESS
                    }
            }
    };

    parameter OutputPortTargets dev1_targets[MAX_OUTPUT_PORTS-1:0] = '{
            '{
                    numTargets : DEV1_PORT0_OUT_ADDRESS_NUM,
                    targets : dev1_port0_out_addresses 
            }
    };

    parameter DeviceContext DEVICE_INSTANCE_CONTEXTS_thread1[MAX_DEVICES-1:0] = '{
            '{
                    properties : 0,
                    index : 0,
                    targets : dev1_targets,
                    sources : dev1_sources,
                    rtsFlags : 0,
                    rtc : FALSE
            }
    };

    parameter PThreadContext dircc_thread_contexts[THREAD_COUNT-1:0] = '{
            '{
                    threadId : 32'h00000000,
                    graphProps : inst_0_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread0,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread0
            },
            '{
                    threadId : 32'h00010001,
                    graphProps : inst_1_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread1,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread1
            }
    };

endpackage : dircc_application_pkg