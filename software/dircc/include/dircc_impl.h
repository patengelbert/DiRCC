/*
 * dircc_impl.h
 *
 *  Created on: Feb 14, 2017
 *      Author: patrick
 */

#ifndef DIRCC_IMPL_H_
#define DIRCC_IMPL_H_

#include "dircc.h"
#include "dircc_rts.h"
#include "dircc_init.h"

extern DeviceContext *activeDevice;

bool dircc_onIdle(PThreadContext *ctxt);

void dircc_onReceive(PThreadContext *ctxt, const void *message);

unsigned dircc_onSend(PThreadContext *ctxt, void *message, uint32_t *numTargets, const address_t **pTargets);


#endif /* DIRCC_IMPL_H_ */
