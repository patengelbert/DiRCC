#include "barrier.h"

#define DEVICE_INSTANCE_COUNT 3
#define DEVICE_INSTANCE_COUNT_thread0 DEVICE_INSTANCE_COUNT

graph_props inst0_props = {
		.maxTime = 100,
		.devCount = DEVICE_INSTANCE_COUNT - 1
};

dev_state dev0_state = {
		.t = 0,
		.seenNow = DEVICE_INSTANCE_COUNT - 1,
		.seenNext = 0,
		.halted = false
};

// fanout out
address_t dev0_out_addresses[] = {
		{
				.hw_node = 0,
				.sw_node = 0,
				.port = INPUT_INDEX_dev_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		},
		{
				.hw_node = 0,
				.sw_node = 1,
				.port = INPUT_INDEX_dev_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		}
};

address_t dev0_halt_addresses[] = {
		{
				.hw_node = 0,
				.sw_node = 2,
				.port = INPUT_INDEX_halt_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		}
};

InputPortSources dev0_sources[] = {
		{
				.numSources = 0,
				.sourceBindings = 0
		}
};

OutputPortTargets dev0_targets[] = {
		{
				.numTargets = 2,
				.targets = dev0_out_addresses
		},
		{
				.numTargets = 1,
				.targets = dev0_halt_addresses
		}
};

dev_state dev1_state = {
		.t = 0,
		.seenNow = DEVICE_INSTANCE_COUNT - 1,
		.seenNext = 0,
		.halted = false
};

address_t dev1_out_addresses[] = {
		{
				.hw_node = 0,
				.sw_node = 0,
				.port = INPUT_INDEX_dev_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		},
		{
				.hw_node = 0,
				.sw_node = 1,
				.port = INPUT_INDEX_dev_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		}
};

address_t dev1_halt_addresses[] = {
		{
				.hw_node = 0,
				.sw_node = 2,
				.port = INPUT_INDEX_halt_in,
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
				.numTargets = 2,
				.targets = dev1_out_addresses
		},
		{
				.numTargets = 1,
				.targets = dev1_halt_addresses
		}
};

halt_state dev2_state = {
		.seen = 0
};

InputPortSources dev2_sources[] = {
		{
				.numSources = 0,
				.sourceBindings = 0
		}
};

OutputPortTargets dev2_targets[] = {

};

DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[DEVICE_INSTANCE_COUNT_thread0] =
		{
				{
						.vtable = DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev,
						.properties = 0, // no properties
						.state = &dev0_state,
						.index = 0,
						.targets = dev0_targets,
						.sources = dev0_sources,
						.rtsFlags = 0,
						.rtc = false
				},
				{
						.vtable = DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev,
						.properties = 0, // no properties
						.state = &dev1_state,
						.index = 1,
						.targets = dev1_targets,
						.sources = dev1_sources,
						.rtsFlags = 0,
						.rtc = false
				},
				{
						.vtable = DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_halt,
						.properties = 0, // no properties
						.state = &dev2_state,
						.index = 2,
						.targets = dev2_targets,
						.sources = dev2_sources,
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
		}
};

