#ifndef DIRCC_ON_SEND_H
#define DIRCC_ON_SEND_H

#include "dircc.h"

unsigned dircc_onSend(PThreadContext *ctxt, void *message, uint32_t numTargets, const address_t *pTargets);

#endif /* DIRCC_ON_SEND_H */
