#ifndef TESTBENCH_H
#define TESTBENCH_H

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

#include "dircc.h"

///////////////////////////////////////////////
// Graph type stuff

#define DEVICE_TYPE_COUNT 1
#define DEVICE_TYPE_INDEX_dev 0

#define INPUT_COUNT_dev 1
#define INPUT_INDEX_dev_in 0

#define OUTPUT_COUNT_dev 1
#define OUTPUT_INDEX_dev_out 0
#define OUTPUT_FLAG_dev_out 1

#define THREAD_COUNT 1

typedef struct _graph_props{
} graph_props;

typedef struct _tick_msg{
	uint32_t t;
} tick_msg;

// No properties
typedef struct _dev_props{
} dev_props;

typedef struct _dev_state{
	uint32_t t;
	bool rts;
} dev_state;

PThreadContext dircc_thread_contexts[THREAD_COUNT];
DeviceTypeVTable DEVICE_TYPE_VTABLES[DEVICE_TYPE_COUNT];

#endif // TESTBENCH_H
