#include <stdlib.h>
#include <stdio.h>
#include "dircc_system_interface.h"

#ifndef NDEBUG
// Always print filename before debug message
#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)
#define DIRCC_LOG_PRINTF(fmt, ...) fprintf(stderr, "[%s:%d] dircc_node %d: %s -> " fmt "\n", __FILENAME__, __LINE__, dircc_thread_id(),  __FUNCTION__, ##__VA_ARGS__)
#else
// Disable if logging is disabled
#define DIRCC_LOG_PRINTF(...) do {} while(0);
#endif

#define DIRCC_EXIT_FAILURE(fmt, ...) {DIRCC_LOG_PRINTF(fmt, ##__VA_ARGS__); exit(EXIT_FAILURE); }
