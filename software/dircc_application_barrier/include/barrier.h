#ifndef application_barrier_h
#define application_barrier_h

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

#include "dircc.h"

///////////////////////////////////////////////
// Graph type stuff

#define DEVICE_TYPE_COUNT 2
#define DEVICE_TYPE_INDEX_dev 0
#define DEVICE_TYPE_INDEX_halt 1

#define INPUT_COUNT_dev 1
#define INPUT_INDEX_dev_in 0

#define OUTPUT_COUNT_dev 2
#define OUTPUT_INDEX_dev_out 0
#define OUTPUT_FLAG_dev_out 1
#define OUTPUT_INDEX_halt_out 1
#define OUTPUT_FLAG_halt_out 2

#define INPUT_COUNT_halt 1
#define INPUT_INDEX_halt_in 0

#define OUTPUT_COUNT_halt 0

#define THREAD_COUNT 1

typedef struct _graph_props{
	uint32_t maxTime;
	uint32_t devCount;
} graph_props;

typedef struct _tick_msg{
	uint32_t t;
} tick_msg;

typedef struct _done_msg{
} done_msg;

// No properties
typedef struct _dev_props{
} dev_props;

typedef struct _dev_state{
	uint32_t t;
	uint32_t seenNow;
	uint32_t seenNext;
	bool halted;
} dev_state;

// No properties
typedef struct _halt_props{
} halt_props;

typedef struct _halt_state{
	uint32_t seen;
} halt_state;

PThreadContext dircc_thread_contexts[THREAD_COUNT];

#endif
