#include "barrier.h"

static const unsigned DEVICE_INSTANCE_COUNT = 3;

static const unsigned DEVICE_INSTANCE_COUNT_thread0 = DEVICE_INSTANCE_COUNT;

graph_props inst0_props = {
		100, // maxTime
		DEVICE_INSTANCE_COUNT - 1 // devCount
};

dev_state dev0_state = {
		0, // currT
		DEVICE_INSTANCE_COUNT - 1, // seenNow
		0, // seenNext
		false // halted
};

// fanout out
address_t dev0_out_addresses[] = {
		{
				0, // thread
				0, // device
				INPUT_INDEX_dev_in,
				DIRCC_ADDRESS_FLAG_NONE
		},
		{
				0, // thread
				1, // device
				INPUT_INDEX_dev_in,
				DIRCC_ADDRESS_FLAG_NONE
		}
};

address_t dev0_halt_addresses[] = {
		{
				0, // thread
				2, // device
				INPUT_INDEX_halt_in,
				DIRCC_ADDRESS_FLAG_NONE
		}
};

InputPortSources dev0_sources[] = {
		{
				0,
				0
		}
};

OutputPortTargets dev0_targets[] = {
		{
				2,
				dev0_out_addresses
		},
		{
				1,
				dev0_halt_addresses
		}
};

dev_state dev1_state = {
		0, // currTime
		DEVICE_INSTANCE_COUNT - 1, // seenNow
		0, // seenNext
		false // haltd
};

address_t dev1_out_addresses[] = {
		{
				0, // thread 0
				0, // device
				INPUT_INDEX_dev_in,
				DIRCC_ADDRESS_FLAG_NONE
		},
		{
				0, // thread
				1, // device
				INPUT_INDEX_dev_in,
				DIRCC_ADDRESS_FLAG_NONE
		}
};

address_t dev1_halt_addresses[] = {
		{
				0, // thread
				2, // device
				INPUT_INDEX_halt_in,
				DIRCC_ADDRESS_FLAG_NONE
		}
};

InputPortSources dev1_sources[] = {
		{
				0,
				0
		}
};

OutputPortTargets dev1_targets[] = {
		{
				2,
				dev1_out_addresses
		},
		{
				1,
				dev1_halt_addresses
		}
};

halt_state dev2_state = {
		0 // seen
};

InputPortSources dev2_sources[] = {
		{
				0,
				0
		}
};

OutputPortTargets dev2_targets[] = {

};

DeviceContext DEVICE_INSTANCE_CONTEXTS_thread0[DEVICE_INSTANCE_COUNT_thread0] =
		{
				{
						DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev, // vtable
						0, // no properties
						&dev0_state,
						0, // device index
						dev0_targets, // address lists for ports
						dev0_sources, // source list for inputs
						0, // rtsFlags
						false // rtc
				},
				{
						DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_dev, // vtable
						0, // no properties
						&dev1_state,
						0, // device index
						dev1_targets, // address lists for ports
						dev1_sources,
						0, // rtsFlags
						false // rtc
				},
				{
						DEVICE_TYPE_VTABLES + DEVICE_TYPE_INDEX_halt, // vtable
						0, // no properties
						&dev2_state,
						1, // device index
						dev2_targets, // address lists for ports
						dev2_sources,
						0, // rtsFlags
						false // rtc
				}
		};

PThreadContext dircc_thread_contexts[THREAD_COUNT] = {
		{
				0,
				&inst0_props,
				DEVICE_TYPE_COUNT,
				DEVICE_TYPE_VTABLES,
				DEVICE_INSTANCE_COUNT_thread0,
				DEVICE_INSTANCE_CONTEXTS_thread0
		}
};

