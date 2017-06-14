#ifndef application_gals_heat_h
#define application_gals_heat_h

#include <stdint.h>
#include <stdio.h>

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

#define state_seenNext_WIDTH 3
#define state_seenNext_MASK 0x00000007
#define state_seenNext_OFFSET 0

#define state_accNext_WIDTH 15
#define state_accNext_MASK 0x00007FFF
#define state_accNext_OFFSET state_seenNext_OFFSET + state_seenNext_WIDTH

#define state_seenNow_WIDTH 3
#define state_seenNow_MASK 0x00000007
#define state_seenNow_OFFSET state_accNext_OFFSET + state_seenNow_WIDTH

#define state_accNow_WIDTH 15
#define state_accNow_MASK 0x00007FFF
#define state_accNow_OFFSET state_seenNow_OFFSET + state_seenNow_WIDTH

#define state_heat_WIDTH 15
#define state_heat_MASK 0x00007FFF
#define state_heat_OFFSET state_accNow_OFFSET + state_accNow_WIDTH

#define state_t_WIDTH 13
#define state_t_MASK 0x00001FFF
#define state_t_OFFSET state_heat_OFFSET + state_heat_WIDTH

typedef struct _temp_message {
	uint32_t t;
	uint32_t temp;
} temp_msg;

typedef struct _dev_state {
	uint8_t data[8];
//	bit [12:0] t;
//	bit [14:0] heat;
//	bit [14:0] accNow;
//	bit [2:0] seenNow;
//	bit [14:0] accNext;
//	bit [2:0] seenNext;
} dev_state;

typedef struct _graph_props{
	uint32_t maxTime;
} graph_props;

// No properties
typedef struct _dev_props{
    int neighbourCount;    // How many inputs are connected to this node?
    int selfWeight;         // Weighting of self in relaxation kernel.
    int initValue;          // Value at startup
    int isDirichlet;           // Indicates cells that have a forcing condition
    int isSender;
} dev_props;

typedef struct _edge_props{
	uint32_t weight;
} edge_props;

typedef struct _edge_state{
} edge_state;


#define DIRCC_STATE_GET_DATA(state, name) \
	(((*((state->data)+0) & (((uint64_t)name##_MASK) << ((uint64_t)name##_OFFSET))) >> ((uint64_t)name##_OFFSET)))

#define DIRCC_STATE_SET_DATA(state, name, value) \
	(*((state->data)+0) &= ((uint64_t)((0xFFFFFFFFFFFFFFFF ^ (((uint64_t)name##_MASK) << ((uint64_t)name##_OFFSET))) | ((((uint64_t)value) & ((uint64_t)name##_WIDTH)) << ((uint64_t)name##_OFFSET)))))

PThreadContext dircc_thread_contexts[THREAD_COUNT];
DeviceTypeVTable DEVICE_TYPE_VTABLES[DEVICE_TYPE_COUNT];

#endif /* application_gals_heat_h */
