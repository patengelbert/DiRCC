#include "counter.h"
#include "system.h"

#define DEVICE_INSTANCE_COUNT 1
#define DEVICE_INSTANCE_COUNT_thread0 DEVICE_INSTANCE_COUNT

graph_props inst0_props = {
		.maxTime = 10
};

dev_state dev0_state = {
		.count = 0,
		.rts = true
};

// fanout out
address_t dev0_out_addresses[] = {
		{
				.hw_node = 0,
				.sw_node = 0,
				.port = INPUT_INDEX_dev_in,
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
				.numTargets = 1,
				.targets = dev0_out_addresses
		}
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

uint32_t dircc_fifo_in_csr_address = NODE_0_PROCESSING_FIFO_IN_OUT_CSR_BASE;
uint32_t dircc_fifo_in_data_address = NODE_0_PROCESSING_FIFO_IN_OUT_BASE;
uint32_t dircc_fifo_in_depth = NODE_0_PROCESSING_FIFO_IN_OUT_FIFO_DEPTH;

uint32_t dircc_fifo_out_csr_address = NODE_0_PROCESSING_FIFO_OUT_IN_CSR_BASE;
uint32_t dircc_fifo_out_data_address = NODE_0_PROCESSING_FIFO_OUT_IN_BASE;
uint32_t dircc_fifo_out_depth = NODE_0_PROCESSING_FIFO_OUT_IN_FIFO_DEPTH;

uint32_t dircc_address_data_address = NODE_0_PROCESSING_ADDRESS_BASE;

