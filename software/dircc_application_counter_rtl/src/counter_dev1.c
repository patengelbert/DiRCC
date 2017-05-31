#include "counter.h"
#include "HPS.h"

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
				.hw_node = 0x00010001,
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
						.index = 0x00000000,
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
						.index = 0x00000000,
						.targets = dev1_targets,
						.sources = dev1_sources,
						.rtsFlags = 0,
						.rtc = false
				}
		};

PThreadContext dircc_thread_contexts[THREAD_COUNT] = {
		{
				.threadId = 0x00000000,
				.graphProps = &inst0_props,
				.numVTables =  DEVICE_TYPE_COUNT,
				.vtables = DEVICE_TYPE_VTABLES,
				.numDevices = DEVICE_INSTANCE_COUNT_thread0,
				.devices = DEVICE_INSTANCE_CONTEXTS_thread0,
				.lamport = 0
		},
		{
				.threadId = 0x00010001,
				.graphProps = &inst1_props,
				.numVTables =  DEVICE_TYPE_COUNT,
				.vtables = DEVICE_TYPE_VTABLES,
				.numDevices = DEVICE_INSTANCE_COUNT_thread1,
				.devices = DEVICE_INSTANCE_CONTEXTS_thread1,
				.lamport = 0
		}
};

uint32_t dircc_thread_count = THREAD_COUNT;

uint32_t           num_addresses            = 4;
thread_address_map dircc_thread_addresses[] = {{0x00000000, THREAD_PTR(NODE_0_DIRCC_PROCESSING_COUNTER_BASE)},
                                               {0x00000001, THREAD_PTR(NODE_1_DIRCC_PROCESSING_COUNTER_BASE)},
                                               {0x00010000, THREAD_PTR(NODE_65536_DIRCC_PROCESSING_COUNTER_BASE)},
                                               {0x00010001, THREAD_PTR(NODE_65537_DIRCC_PROCESSING_COUNTER_BASE)}};

uint32_t num_terminals              = 8;
void*    dircc_terminal_addresses[] = {THREAD_PTR(TERMINAL_NORTH_0_BASE), THREAD_PTR(TERMINAL_NORTH_1_BASE),
                                       THREAD_PTR(TERMINAL_EAST_0_BASE),  THREAD_PTR(TERMINAL_EAST_1_BASE),
                                       THREAD_PTR(TERMINAL_SOUTH_0_BASE), THREAD_PTR(TERMINAL_SOUTH_1_BASE),
                                       THREAD_PTR(TERMINAL_WEST_1_BASE),  THREAD_PTR(TERMINAL_WEST_1_BASE)};

void data_format(const void *data_in, char *formatted)
{
	sprintf(formatted, "Count: %d", ((dev_state *)data_in)->count);
}
