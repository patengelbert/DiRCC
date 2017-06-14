#include "heat.h"
#include "system.h"

#define DEVICE_INSTANCE_COUNT 2
#define DEVICE_INSTANCE_COUNT_thread0 2

// Thread 0

graph_props inst_props = {
		.maxTime = 10
};

// fanout out
address_t dev0_out0_addresses[] = {
		{
				.hw_node = 0x00000000,
				.sw_node = 0x0001,
				.port = INPUT_INDEX_dev_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		}
};

edge_props dev0_edge_props[] = {
		{
			.weight = 1
	}
};

InputPortBinding dev0_bindings[] = {
		{
				.source = {
						.hw_node = 0x00000000,
						.sw_node = 0x0001,
						.port = INPUT_INDEX_dev_in,
						.flag = DIRCC_ADDRESS_FLAG_NONE
				},
				.edgeState = 0,
				.edgeProperties = dev0_edge_props + 0
		}
};

InputPortSources dev0_sources[] = {
		{
				.numSources = 1,
				.sourceBindings = dev0_bindings
		}
};

OutputPortTargets dev0_targets[] = {
		{
				.numTargets = 1,
				.targets = dev0_out0_addresses
		}
};

dev_props dev0_props = {
		.neighbourCount = 1,
		.selfWeight = 0,
		.initValue = 1,
		.isDirichlet = 1,
		.isSender = 1
};

// Device 1

// fanout out
address_t dev1_out_addresses[] = {
		{
				.hw_node = 0x00000000,
				.sw_node = 0x0000,
				.port = INPUT_INDEX_dev_in,
				.flag = DIRCC_ADDRESS_FLAG_NONE
		}
};

edge_props dev1_edge_props[] = {
		{
				.weight = 1
		}
};


InputPortBinding dev1_bindings[] = {
		{
				.source = {
						.hw_node = 0x00000000,
						.sw_node = 0x0000,
						.port = INPUT_INDEX_dev_in,
						.flag = DIRCC_ADDRESS_FLAG_NONE
				},
				.edgeState = 0,
				.edgeProperties = dev1_edge_props + 0
		}
};

InputPortSources dev1_sources[] = {
		{
				.numSources = 1,
				.sourceBindings = dev1_bindings
		}
};

OutputPortTargets dev1_targets[] = {
		{
				.numTargets = 1,
				.targets = dev1_out_addresses
		}
};

dev_props dev1_props = {
		.neighbourCount = 1,
		.selfWeight = 0,
		.initValue = 1,
		.isDirichlet = 1,
		.isSender = 0
};

DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[DEVICE_INSTANCE_COUNT_thread0] =
		{
				{
						.vtable = DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev,
						.properties = &dev0_props,
						.index = 0,
						.targets = dev0_targets,
						.sources = dev0_sources,
						.rtsFlags = 0,
						.rtc = false
				},
				{
						.vtable = DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev,
						.properties = &dev1_props,
						.index = 1,
						.targets = dev1_targets,
						.sources = dev1_sources,
						.rtsFlags = 0,
						.rtc = false
				}
		};


PThreadContext dircc_thread_contexts[THREAD_COUNT] = {
		{
				.threadId = 0,
				.graphProps = &inst_props,
				.numVTables =  DEVICE_TYPE_COUNT,
				.vtables = DEVICE_TYPE_VTABLES,
				.numDevices = DEVICE_INSTANCE_COUNT_thread0,
				.devices = DEVICE_INSTANCE_CONTEXTS_thread0,
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

