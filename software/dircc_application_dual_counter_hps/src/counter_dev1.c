#include "counter.h"
#include "hps_soc_system.h"

#define DEVICE_INSTANCE_COUNT 2
#define DEVICE_INSTANCE_COUNT_thread0 1
#define DEVICE_INSTANCE_COUNT_thread1 1

// Thread 0

graph_props inst0_props = {
		.maxTime = 10
};

// fanout out
address_t dev0_out_addresses[] = {
		{
				.hw_node = 1,
				.sw_node = 0,
				.port = INPUT_INDEX_dev_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		}
};

InputPortSources dev0_sources[] = {
		{
				.numSources = 0,
				.sourceBindings = DIRCC_BINDING_NONE
		}
};

OutputPortTargets dev0_targets[] = {
		{
				.numTargets = 1,
				.targets = dev0_out_addresses
		}
};

dev_state thread0_user_states[] = {
		{
				.count = 0,
				.rts = 1
		}
};

DeviceState thread0_states[] = {
		{
				.userState = thread0_user_states + 0
		}
};

DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[DEVICE_INSTANCE_COUNT_thread0] =
		{
				{
						.state = thread0_states + 0,
						.vtable = DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev,
						.properties = 0, // no properties
						.index = 0,
						.targets = dev0_targets,
						.sources = dev0_sources,
						.rtsFlags = 0,
						.rtc = false
				}
		};


// Thread 1

graph_props inst1_props = {
		.maxTime = 10
};

// fanout out
address_t dev1_out_addresses[] = {
		{
				.hw_node = 0,
				.sw_node = 0,
				.port = INPUT_INDEX_dev_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		}
};

InputPortSources dev1_sources[] = {
		{
				.numSources = 0,
				.sourceBindings = 0
		}
};

OutputPortTargets dev1_targets[] = {
		{
				.numTargets = 1,
				.targets = dev1_out_addresses
		}
};

dev_state thread1_user_states[] = {
		{
				.count = 0,
				.rts = 0
		}
};

DeviceState thread1_states[] = {
		{
				.userState = thread1_user_states + 0
		}
};

DeviceContext DEVICE_INSTANCE_CONTEXTS_thread1[DEVICE_INSTANCE_COUNT_thread1] =
		{
				{
						.state = thread1_states + 0,
						.vtable = DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev,
						.properties = 0, // no properties
						.index = 0,
						.targets = dev1_targets,
						.sources = dev1_sources,
						.rtsFlags = 0,
						.rtc = false
				}
		};

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

uint32_t dircc_thread_count = THREAD_COUNT;

