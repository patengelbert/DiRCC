/*
 * dircc_main.c
 *
 *  Created on: Feb 9, 2017
 *      Author: patrick
 */

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "system.h"
#include "dircc_defines.h"
#include "dircc_fifo_interface.h"
#include "dircc.h"
#include "dircc_impl.h"

#pragma GCC diagnostic ignored "-Wformat"

dircc_err_code dircc_init_fifos() {
	dircc_err_code err_in = dircc_init_fifo(NODE_0_FIFO_IN_IN_CSR_BASE,
	DIRCC_MSG_SIZE, NODE_0_FIFO_IN_IN_CSR_FIFO_DEPTH - DIRCC_MSG_SIZE);
	dircc_err_code err_out = dircc_init_fifo(NODE_0_FIFO_OUT_IN_CSR_BASE,
	DIRCC_MSG_SIZE, NODE_0_FIFO_OUT_IN_CSR_FIFO_DEPTH - DIRCC_MSG_SIZE);
	return err_in | err_out;
}

int main() {

	uint32_t my_id = dircc_my_id();

	PThreadContext *ctxt = dircc_thread_contexts + my_id;

	fprintf(stderr, "dircc %u: init %u\n", my_id);

	// Initialise fifos
	dircc_err_code err = dircc_init_fifos();
	if (err != DIRCC_SUCCESS)
		DIRCC_LOG_AND_EXIT("Error initilizing FIFOs: 0x%08x", err);

	// Clear the input FIFO
	err = dircc_clr_fifo(NODE_0_FIFO_IN_OUT_BASE, NODE_0_FIFO_IN_IN_CSR_BASE);
	if (err != DIRCC_SUCCESS)
		DIRCC_LOG_AND_EXIT("Error clearing input FIFO: 0x%08x", err);

    const address_t *currSendAddressList=0;
    uint32_t currSendTodo=0;
    uint32_t currSize=0;

	fprintf(stderr, "dircc %u: starting loop\n", my_id);

	while (true) {
		fprintf(stderr, "dircc %u: loop top\n", my_id);

		// Only want to send if either:
		// - we are currently sending message,
		// - or at least one device wants to send one
		bool wantToSend = (currSendTodo > 0) || softswitch_IsRTSReady(ctxt);
		fprintf(stderr, "dircc %u:  wantToSend=%d\n", my_id, wantToSend ? 1 : 0);

		// Run idle if:
		// - There is nothing to receive
		// - we aren't able to send or we don't want to send
		while ((!dircc_can_recv()) && (!wantToSend || !dircc_can_send())) {
			if (!softswitch_onIdle(ctxt))
				break;
		}

		if (dircc_can_recv()) {
			fprintf(stderr, "dircc %u:   receive branch\n", my_id);

			/*! We always receive messages, even while a send is in progress (currSendTodo > 0) */

			fprintf(stderr, "dircc %u:   calling recv\n", my_id);

			auto recvBuffer = dircc_recv(); // Take the buffer from receive pool

			fprintf(stderr, "dircc %u:   calling onRecieve, recvBuffer=%p\n",
					my_id,
					recvBuffer);
			softswitch_onReceive(ctxt, (const void *) recvBuffer); // Decode and dispatch

			fprintf(stderr, "dircc %u:   giving buffer back\n", my_id);
			tinsel_mboxAlloc(recvBuffer); // Put it back in receive pool
		} else {
			fprintf(stderr, "dircc %u:   send branch\n", my_id);

			assert(wantToSend); // Only come here if we have something to do
			assert(tinsel_mboxCanSend()); // Only reason we could have got here

			/* Either we have to finish sending a previous message to more
			 addresses, or we get the chance to send a new message. */

			if (currSendTodo == 0) {
				fprintf(stderr, "dircc %u:   preparing new message\n", my_id);

				// Prepare a new packet to send
				currSize = softswitch_onSend(ctxt, (void*) sendBuffer,
						currSendTodo, currSendAddressList);
			} else {
				// We still have more addresses to deliver the last message to
				fprintf(stderr, "dircc %u:   forwarding current message\n", my_id);
			}

			fprintf(stderr,
					"dircc %u:   sending to thread %08x, device %u, port %u\n",
					my_id,
					currSendAddressList->thread, currSendAddressList->device,
					currSendAddressList->port);

			// Update the target address (including the device and pin)
			((packet_t*) sendBuffer)->dest = *currSendAddressList;

			// Send to the relevant thread
			// TODO: Shouldn't there be something like mboxForward as part of
			// the API, which only takes the address?
			fprintf(stderr, "dircc %u:   setting length\n", my_id);
			tinsel_mboxSetLen(currSize);
			fprintf(stderr, "dircc %u:   doing send\n", my_id);
			tinsel_mboxSend(currSendAddressList->thread, sendBuffer);

			// Move onto next address for next time
			currSendTodo--; // If this reaches zero, we are done with the message
			currSendAddressList++;
		}

		fprintf(stderr, "dircc %u: loop bottom\n", my_id);
	}
	fprintf(stderr, "dircc %u: exiting", my_id);

	return EXIT_SUCCESS;
}

