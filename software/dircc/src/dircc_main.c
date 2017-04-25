/*
 * dircc_main.c
 *
 *  Created on: Feb 9, 2017
 *      Author: patrick
 */

#include <assert.h>
#include <stdint.h>
#include <stdio.h>

#include "dircc.h"
#include "dircc_defines.h"
#include "dircc_system_interface.h"
#include "dircc_helpers.h"
#include "dircc_impl.h"

PThreadContext *get_thread_context(int id)
{
	// Could probably do with a filter function use
	for(unsigned i = 0; i < dircc_thread_count; i++)
	{
		if ((dircc_thread_contexts + i)->threadId == id)
			return dircc_thread_contexts + i;
	}
	DIRCC_EXIT_FAILURE("Cannot initialize context for thread %u. No such context available", id);

}

int main() {
	PThreadContext *ctxt = get_thread_context(dircc_thread_id());

	DIRCC_LOG_PRINTF("init");

	// Initialise the system
	dircc_init(ctxt);

	// Clear the input FIFO
	dircc_err_code err;
	if ((err = dircc_clr_fifo(dircc_fifo_in_data_address, dircc_fifo_in_csr_address)) != DIRCC_SUCCESS)
		DIRCC_EXIT_FAILURE("Error clearing input FIFO: 0x%08x", err);

	packet_t sendBuffer;
	const address_t *currSendAddressList = 0;
	uint32_t currSendTodo = 0;

	if (ctxt->numDevices == 0)
		DIRCC_EXIT_FAILURE("Number of devices is 0");

	DIRCC_LOG_PRINTF("starting loop");

	while (true) {
		DIRCC_LOG_PRINTF("loop top");

		// Only want to send if either:
		// - we are currently sending message,
		// - or at least one device wants to send one
		bool wantToSend = (currSendTodo > 0) || dircc_IsRTSReady(ctxt);
		DIRCC_LOG_PRINTF("wantToSend=%d", wantToSend ? 1 : 0);

		// Run idle if:
		// - There is nothing to receive
		// - we aren't able to send or we don't want to send
		bool wantRTC = true;
		while ((dircc_can_recv(dircc_fifo_in_csr_address) != DIRCC_SUCCESS)
				&&(!wantToSend || dircc_can_send(dircc_fifo_out_csr_address) != DIRCC_SUCCESS)) {
			// DIRCC_LOG_PRINTF("calling onIdle");
			if (wantRTC) {
				wantRTC = dircc_onIdle(ctxt);
			}
		}
		DIRCC_LOG_PRINTF("Finishing onIdle");


		if (dircc_can_recv(dircc_fifo_in_csr_address) == DIRCC_SUCCESS) {
			DIRCC_LOG_PRINTF("receive branch");

			/*! We always receive messages, even while a send is in progress (currSendTodo > 0) */

			DIRCC_LOG_PRINTF("calling recv");

			packet_t recvBuffer;

			err = dircc_recv(dircc_fifo_in_data_address, dircc_fifo_in_csr_address, &recvBuffer); // Take the buffer from receive pool
			if (err != DIRCC_SUCCESS)
				DIRCC_EXIT_FAILURE("Error receiving: 0x%08x", err);

			DIRCC_LOG_PRINTF("calling onRecieve, recvBuffer=%p", &recvBuffer);
			dircc_onReceive(ctxt, (const void *) &recvBuffer); // Decode and dispatch

		} else {
			DIRCC_LOG_PRINTF("send branch");

			assert(wantToSend); // Only come here if we have something to do
			assert(dircc_can_send(dircc_fifo_out_csr_address) == DIRCC_SUCCESS); // Only reason we could have got here

			/* Either we have to finish sending a previous message to more
			 addresses, or we get the chance to send a new message. */

			if (currSendTodo == 0) {
				DIRCC_LOG_PRINTF("preparing new message");

				// Prepare a new packet to send
				dircc_onSend(ctxt, (void*) &sendBuffer,
						&currSendTodo, &currSendAddressList);
			} else {
				// We still have more addresses to deliver the last message to
				DIRCC_LOG_PRINTF("forwarding current message");
			}

			DIRCC_LOG_PRINTF("sending to thread %08x, device %u, port %u",
					currSendAddressList->hw_node, currSendAddressList->sw_node,
					currSendAddressList->port);

			// Update the target address (including the device and pin)
			sendBuffer.dest = *currSendAddressList;

			// Send to the relevant thread
			// TODO: Shouldn't there be something like mboxForward as part of
			// the API, which only takes the address?
			DIRCC_LOG_PRINTF("doing send");
			err = dircc_send(dircc_fifo_out_data_address, dircc_fifo_out_csr_address, &sendBuffer);
			if (err != DIRCC_SUCCESS)
				DIRCC_EXIT_FAILURE("Error sending: 0x%08x", err);
			// Move onto next address for next time
			currSendTodo--; // If this reaches zero, we are done with the message
			currSendAddressList++;
		}

		DIRCC_LOG_PRINTF("loop bottom");
	}
	DIRCC_LOG_PRINTF("exiting");

	return EXIT_SUCCESS;
}

