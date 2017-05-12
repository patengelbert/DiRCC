
#ifndef DIRCC_HELPERS_H_
#define DIRCC_HELPERS_H_

#include <stdlib.h>
#include <stdio.h>
#include "dircc_system_interface.h"
#include "dircc_system_state.h"

#ifndef NDEBUG
// Always print filename before debug message
#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)

#define DIRCC_ASSERT(ctxt, _e) do {if(!(_e)) { dircc_setThreadMultiState(ctxt, DIRCC_STATE_ERROR, NULL); DIRCC_EXIT_FAILURE("Assertion Error"); }} while(0)

#define DIRCC_EXIT_FAILURE(fmt, ...) do {DIRCC_LOG_PRINTF(fmt, ##__VA_ARGS__); exit(EXIT_FAILURE); } while(0)

#define DIRCC_LOG_PRINTF(fmt, ...) 																														\
	_Pragma("GCC diagnostic ignored \"-Wformat\"") 																										\
	do {fprintf(stderr, "[%s:%d] dircc_node %lu: %s -> " fmt "\n", __FILENAME__, __LINE__, dircc_thread_id(),  __FUNCTION__, ##__VA_ARGS__);} while(0); \
	_Pragma("GCC diagnostic warning \"-Wformat\"")
#else
// Disable if logging is disabled
#define DIRCC_ASSERT(...) do {} while(0)
#define DIRCC_LOG_PRINTF(...) do {} while(0)
#define DIRCC_EXIT_FAILURE(...) do {exit(EXIT_FAILURE);} while(0)
#endif



#endif // DIRCC_HELPERS_H_
