#include "counter.h"
#include "system.h"

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

edge_props dev0_in0_props = {
		.one = 1
};

edge_state dev0_in0_state = {
		.received = 0
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

DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[DEVICE_INSTANCE_COUNT_thread0] =
		{
				{
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
				.sourceBindings = DIRCC_BINDING_NONE
		}
};

OutputPortTargets dev1_targets[] = {
		{
				.numTargets = 1,
				.targets = dev1_out_addresses
		}
};

DeviceContext DEVICE_INSTANCE_CONTEXTS_thread1[DEVICE_INSTANCE_COUNT_thread1] =
		{
				{
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

uint32_t dircc_fifo_in_csr_address = NODE_0_PROCESSING_FIFO_IN_OUT_CSR_BASE;
uint32_t dircc_fifo_in_data_address = NODE_0_PROCESSING_FIFO_IN_OUT_BASE;
uint32_t dircc_fifo_in_depth = NODE_0_PROCESSING_FIFO_IN_OUT_FIFO_DEPTH;

uint32_t dircc_fifo_out_csr_address = NODE_0_PROCESSING_FIFO_OUT_IN_CSR_BASE;
uint32_t dircc_fifo_out_data_address = NODE_0_PROCESSING_FIFO_OUT_IN_BASE;
uint32_t dircc_fifo_out_depth = NODE_0_PROCESSING_FIFO_OUT_IN_FIFO_DEPTH;

uint32_t dircc_address_data_address = NODE_0_PROCESSING_ADDRESS_BASE;

