/*
 * dircc.h
 *
 *  Created on: Feb 14, 2017
 *      Author: patrick
 */

#ifndef DIRCC_H_
#define DIRCC_H_

//#include <stdbool.h>
#include "dircc_defines.h"

typedef struct _address {
	uint32_t hw_node;    // hardware
	uint16_t sw_node;    // software
	uint8_t port;       // software
	uint8_t flag; //=0; // software
} address_t;

typedef struct _packet_t {
	address_t dest;
	address_t source;
	uint32_t lamport; // lamport clock
	uint8_t payload[MAX_DATA_LEN];
} packet_t;

typedef uint32_t (*ready_to_send_handler_t)(const void *graphProps,
		const void *devProps, void *devState);

typedef bool (*send_handler_t)(const void *graphProps, const void *devProps,
		void *devState, void *message);

typedef void (*receive_handler_t)(const void *graphProps, const void *devProps,
		void *devState, const void *edgeProps, void *edgeState,
		const void *message);

typedef void (*compute_handler_t)(const void *graphProps, const void *devProps,
		void *devState);

typedef struct _InputPortVTable {
	receive_handler_t receiveHandler;
	unsigned messageSize;
	// If both properties and state are zero, we never have to look
	// them up...
	uint16_t propertiesSize;
	uint16_t stateSize;
} InputPortVTable;

typedef struct _OutputPortVTable {
	send_handler_t sendHandler;
	unsigned messageSize;
} OutputPortVTable;

// Gives access to the code associated with each device
typedef struct _DeviceTypeVTable {
	ready_to_send_handler_t readyToSendHandler;
	unsigned numOutputs;
	OutputPortVTable *outputPorts;
	unsigned numInputs;
	InputPortVTable *inputPorts;
	compute_handler_t computeHandler;
} DeviceTypeVTable;

// Gives the distribution list when sending from a particular port
// Read-only. This is likely to be unique to each port, but it may be possible
// to share.
typedef struct _OutputPortTargets {
	unsigned numTargets;
	address_t *targets;
} OutputPortTargets;

typedef struct _InputPortBinding {
	address_t source;
	const void *edgeProperties;
	void *edgeState;
} InputPortBinding;

// Allows us to bind incoming messages to the appropriate edge properties
/* The properties will be stored in order of address then port. This would
 be much better done by a hash-table or something. Or possibly embedding
 the destination properties into the message?
 */
typedef struct _InputPortSources {
	unsigned numSources;  // This will be null if the input has properties/state
	InputPortBinding *sourceBindings; // This will be null if the input had no properties or state
} InputPortSources;

//! Context is fixed size. Points to varying size properties and state
typedef struct _DeviceContext {
	// These parts are fixed, and will never change
	DeviceTypeVTable *vtable;
	const void *properties;
	void *state;
	unsigned index;
	OutputPortTargets *targets;  // One entry per output port
	InputPortSources *sources;   // One entry per input port

	uint32_t rtsFlags;
	bool rtc;

	struct _DeviceContext *prev;
	struct _DeviceContext *next;

} DeviceContext;

/*! Contains information about what this thread is managing.
 Some parts are read-only and can be shared (e.g. device vtables, graph properties)
 Other parts are read-only but probably not shared (device properties, address lists)
 Some parts are read-write, and so must be private (e.g. the devices array, rtsHead, ...)
 */
typedef struct _PThreadContext {
	// Read-only parts

	unsigned threadId;

	const void *graphProps; // Application-specific graph properties (read-only)

	unsigned numVTables;      // Number of distinct device types available
	DeviceTypeVTable *vtables; // VTable structure for each device type (read-only, could be shared with other pthread contexts)

	unsigned numDevices;    // Number of devices this thread is managing
	DeviceContext *devices; // Fixed-size contexs for each device (must be private to thread)

	// Mutable parts
	uint32_t lamport; // clock

	DeviceContext *rtsHead;
	DeviceContext *rtsTail;

    uint32_t rtcChecked; // How many we have checked through since last seeing an RTC
                         // If rtcChecked >= numDevices, we know there is no-one who wants to compute
    uint32_t rtcOffset;  // Where we are in the checking list (to make things somewhat fair)

} PThreadContext;

extern PThreadContext dircc_thread_contexts[];

// TODO: Check how to get corerct values for the node
extern uint32_t dircc_fifo_in_csr_address;
extern uint32_t dircc_fifo_in_data_address;

extern uint32_t dircc_fifo_out_csr_address;
extern uint32_t dircc_fifo_out_data_address;

#endif /* DIRCC_H_ */
