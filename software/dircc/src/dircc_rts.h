/*
 * dircc_rts.h
 *
 *  Created on: Feb 16, 2017
 *      Author: patrick
 */

#ifndef DIRCC_RTS_H_
#define DIRCC_RTS_H_

#include "dircc.h"

void dircc_UpdateRTS(PThreadContext *pCtxt, DeviceContext *dev);
DeviceContext *dircc_PopRTS(PThreadContext *pCtxt);
bool dircc_IsRTSReady(PThreadContext *pCtxt);

#endif /* DIRCC_RTS_H_ */
