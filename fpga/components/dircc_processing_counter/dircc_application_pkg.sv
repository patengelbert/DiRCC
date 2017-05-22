
`define DIRCC_BINDING_NONE 0

package dircc_application_pkg;

    import dircc_types_pkg::*; 

    int THREAD_COUNT = 2;

    int DEVICE_INSTANCE_COUNT = 2;
    int DEVICE_INSTANCE_COUNT_thread0 = 1;
    int DEVICE_INSTANCE_COUNT_thread1 = 1;

    int DEV0_OUT_PORT_NUM = 1;
    int DEV0_IN_PORT_NUM = 1;
    int DEV0_PORT0_OUT_ADDRESS_NUM = 1;
    int DEV0_PORT0_SOURCE_BINDING_NUM = 0;

    struct packed {
        int maxTime;
    } graph_props;

    struct packed {
        int numSources;
        
    } InputPortSources;

    graph_props inst0_props = '{
            maxTime : 10
    };

    // fanout out
    address_t dev0_out_addresses[DEV0_PORT0_OUT_ADDRESS_NUM] = '{
            '{
                    hw_node : 1,
                    sw_node : 0,
                    port : INPUT_INDEX_dev_in,
                    flag : DIRCC_ADDRESS_FLAG_NONE
            }
    };

    InputPortSources dev0_sources[DEV0_IN_PORT_NUM] = '{
            '{
                    numSources : DEV0_PORT0_SOURCE_BINDING_NUM,
                    sourceBindings : DIRCC_BINDING_NONE
            }
    };

    OutputPortTargets dev0_targets[DEV0_OUT_PORT_NUM] = '{
            '{
                    numTargets : DEV0_PORT0_OUT_ADDRESS_NUM,
                    targets : dev0_out_addresses
            }
    };

    DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[DEVICE_INSTANCE_COUNT_thread0] =
            '{
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

    PThreadContext dircc_thread_contexts[THREAD_COUNT] = {
            {
                    .threadId = 0,
                    .graphProps = &inst0_props,
                    .numVTables =  DEVICE_TYPE_COUNT,
                    .vtables = DEVICE_TYPE_VTABLES,
                    .numDevices = DEVICE_INSTANCE_COUNT_thread0,
                    .devices = DEVICE_INSTANCE_CONTEXTS_thread0,
                    .lamport = 0
            },
            {
                    .threadId = 1,
                    .graphProps = &inst1_props,
                    .numVTables =  DEVICE_TYPE_COUNT,
                    .vtables = DEVICE_TYPE_VTABLES,
                    .numDevices = DEVICE_INSTANCE_COUNT_thread1,
                    .devices = DEVICE_INSTANCE_CONTEXTS_thread1,
                    .lamport = 0
            }
    };

    int dircc_thread_count = THREAD_COUNT;

endpackage : dircc_application_pkg