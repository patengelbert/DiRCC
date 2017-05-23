
`define DIRCC_ADDRESS_FLAG_NONE 0

package dircc_application_pkg;

    import dircc_types_pkg::*;

    parameter int THREAD_COUNT = 1;

    parameter int DEVICE_INSTANCE_COUNT = 2;
    parameter int DEVICE_INSTANCE_COUNT_thread0 = 1;
    parameter int DEVICE_INSTANCE_COUNT_thread1 = 1;

    parameter int DEV0_OUT_PORT_NUM = 2;
    parameter int DEV0_IN_PORT_NUM = 1;
    parameter int DEV0_PORT0_OUT_ADDRESS_NUM = 2;
    parameter int DEV0_PORT0_SOURCE_BINDING_NUM = 0;

    parameter int DEV0_PORT1_OUT_ADDRESS_NUM = 1;

    parameter int INPUT_COUNT_dev = 1;
    parameter int INPUT_INDEX_dev_in = 0;
    
    parameter int OUTPUT_COUNT_dev = 1;
    parameter int OUTPUT_INDEX_dev_port0 = 0;
    parameter int OUTPUT_FLAG_dev_port0 = 1;

    parameter int OUTPUT_INDEX_dev_port1 = 1;
    parameter int OUTPUT_FLAG_dev_port1 = 2;

    parameter int THREAD0_DEVICE_CONTEXT_NUM = 1;

    parameter int MAX_SOURCE_BINDING_NUM = 1;
    parameter int MAX_OUTPUT_TARGETS = 2;
    parameter int MAX_OUTPUT_PORTS = 2;
    parameter int MAX_INPUT_PORTS = 1;
    parameter int MAX_DEVICES = 1;

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

    parameter graph_props inst_props = '{
            maxTime : 10
    };

    // fanout out
    parameter address_t dev0_port0_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 2,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            '{
                    hw_addr : 1,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            }
    };

    parameter address_t dev0_port1_out_addresses[MAX_OUTPUT_TARGETS-1:0] = '{
            '{
                    hw_addr : 0,
                    sw_addr : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : `DIRCC_ADDRESS_FLAG_NONE
            },
            NULL_ADDRESS
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
                    numTargets : DEV0_PORT1_OUT_ADDRESS_NUM,
                    targets : dev0_port1_out_addresses
            },
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


    // // Thread 1

    // graph_props inst1_props = {
    //         .maxTime = 10
    // };

    // // fanout out
    // address_t dev1_out_addresses[] = {
    //         {
    //                 .hw_node = 0,
    //                 .sw_node = 0,
    //                 .port = INPUT_INDEX_dev_in,
    //                 .flag = DIRCC_ADDRESS_FLAG_NONE
    //         }
    // };

    // InputPortSources dev1_sources[] = {
    //         {
    //                 .numSources = 0,
    //                 .sourceBindings = 0
    //         }
    // };

    // OutputPortTargets dev1_targets[] = {
    //         {
    //                 .numTargets = 1,
    //                 .targets = dev1_out_addresses
    //         }
    // };

    // DeviceContext DEVICE_INSTANCE_CONTEXTS_thread1[DEVICE_INSTANCE_COUNT_thread1] =
    //         {
    //                 {
    //                         .vtable = DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev,
    //                         .properties = 0, // no properties
    //                         .index = 0,
    //                         .targets = dev1_targets,
    //                         .sources = dev1_sources,
    //                         .rtsFlags = 0,
    //                         .rtc = false
    //                 }
    //         };

    parameter PThreadContext dircc_thread_contexts[THREAD_COUNT-1:0] = '{
            '{
                    threadId : 0,
                    graphProps : inst_props,
                    numDevices : DEVICE_INSTANCE_COUNT_thread0,
                    devices : DEVICE_INSTANCE_CONTEXTS_thread0
        //     },
        //     {
        //             .threadId = 1,
        //             .graphProps = &inst1_props,
        //             .numVTables =  DEVICE_TYPE_COUNT,
        //             .vtables = DEVICE_TYPE_VTABLES,
        //             .numDevices = DEVICE_INSTANCE_COUNT_thread1,
        //             .devices = DEVICE_INSTANCE_CONTEXTS_thread1,
        //             .lamport = 0
            }
    };

endpackage : dircc_application_pkg