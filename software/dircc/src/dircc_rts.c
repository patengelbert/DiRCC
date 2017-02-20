/*
 * dircc_rts.c
 *
 *  Created on: Feb 16, 2017
 *      Author: patrick
 */

#include <assert.h>
#include "dircc_defines.h"
#include "dircc_rts.h"

#ifndef NDEBUG
static void rts_sanity(PThreadContext *pCtxt) {
	// Checks that linked list is valid
	if (pCtxt->rtsHead != 0) {
	    assert(pCtxt->rtsTail != 0);

	    DeviceContext *curr = pCtxt->rtsHead;
	    while (curr)
	    {
		assert((curr->prev == 0 && pCtxt->rtsHead == curr) || curr->prev->next == curr);
		assert((curr->next == 0 && pCtxt->rtsTail == curr) || curr->next->prev == curr);
		curr = curr->next;
		}
	} else {
	    assert(pCtxt->rtsTail == 0);
	}
}
#else
#define rts_sanity(ctxt) ((void)0)
#endif

// 5 instructions
static void rts_append(PThreadContext *pCtxt, DeviceContext *dCtxt) {
	rts_sanity(pCtxt);

	dCtxt->prev = pCtxt->rtsTail; // 1
	dCtxt->next = 0;       // 1
	if (pCtxt->rtsTail == 0) {     // 1
		pCtxt->rtsHead = dCtxt;   // 1
	} else {
		pCtxt->rtsTail->next = dCtxt; // 1
	}
	pCtxt->rtsTail = dCtxt; // 1

	rts_sanity(pCtxt);
}

// 8 instructions
static void rts_remove(PThreadContext *pCtxt, DeviceContext *dCtxt) {
	rts_sanity(pCtxt);

	DIRCC_LOG_PRINTF(
			"begin, rtsHead=%p, rtsTail=%p, dCtxt->prev=%p, dCtxt->next=%p",
			pCtxt->rtsHead, pCtxt->rtsTail, dCtxt->prev, dCtxt->next);

	assert(pCtxt->rtsHead != 0);

	if (pCtxt->rtsHead == dCtxt) {          // 1
		pCtxt->rtsHead = dCtxt->next;     // 1
	} else {
		dCtxt->prev->next = dCtxt->next; // 3
	}
	if (pCtxt->rtsTail == dCtxt) {          // 1
		pCtxt->rtsTail = dCtxt->prev;     // 1
	} else {
		dCtxt->next->prev = dCtxt->prev; // 3
	}
	DIRCC_LOG_PRINTF("end");

	rts_sanity(pCtxt);
}

// 6 instructions
static DeviceContext *rts_pop(PThreadContext *pCtxt) {
	rts_sanity(pCtxt);

	DeviceContext *head = pCtxt->rtsHead;   // 1
	if (head) {            // 1
	    assert(head->prev == 0);

	    DeviceContext *next = head->next; // 1
	    if (next)
	    {			// 1
		next->prev = 0; // 1
		} else {
			pCtxt->rtsTail = 0;        // 1
		}
		pCtxt->rtsHead = next;         // 1
	}

	rts_sanity(pCtxt);

	return head;
}

void dircc_UpdateRTS(PThreadContext *pCtxt, DeviceContext *dev) {
	rts_sanity(pCtxt);

	// Find out if the handler wants to send or compute in the future
	DIRCC_LOG_PRINTF("begin");
	uint32_t flags = dev->vtable->readyToSendHandler(pCtxt->graphProps,
			dev->properties, dev->state);

	// Look at RTC flag
	uint32_t rtc = flags & 0x80000000ul;
	if (rtc) {
		pCtxt->rtcChecked = 0; // Force another complete loop
	}

	// Flags with compute stripped off - are
	bool anyReadyPrev = 0 != (dev->rtsFlags & 0x7FFFFFFFul);
	bool anyReadyNow = 0 != (flags & 0x7FFFFFFFul);

	// Check if overall output RTS status is the same (ignoring which ports)
	if (anyReadyPrev == anyReadyNow) {
		DIRCC_LOG_PRINTF("done (no change)");
		return;
	}

	if (anyReadyNow) {
		DIRCC_LOG_PRINTF("adding to RTS list");

		rts_append(pCtxt, dev);
	} else {
		DIRCC_LOG_PRINTF("removing from RTS list");
		rts_remove(pCtxt, dev);
	}
	dev->rtsFlags = flags;

	DIRCC_LOG_PRINTF("done, flags=%x", dev->rtsFlags);
}

DeviceContext *dircc_PopRTS(PThreadContext *pCtxt) {
	DeviceContext *dev = rts_pop(pCtxt);
	assert(dev);
	// These need to be recomputed
	return dev;
}

bool dircc_IsRTSReady(PThreadContext *pCtxt) {
	return pCtxt->rtsHead != 0;
}
