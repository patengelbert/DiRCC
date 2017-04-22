#include <stdlib.h>
#include "dircc_system_interface.h"
#include "sys/alt_log_printf.h"

#ifdef ALT_LOG_ENABLE
// Always print filename before debug message
#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)
#define DIRCC_LOG_PRINTF(fmt, ...) ALT_LOG_PRINTF("[%s:%d] dircc_node %d: %s -> " fmt "\n", __FILENAME__, __LINE__, dircc_dev_id(),  __FUNCTION__, ##__VA_ARGS__)
#else
// Disable if logging is disabled
#define DIRCC_LOG_PRINTF(...)
#endif

#define DIRCC_EXIT_FAILURE(fmt, ...) {DIRCC_LOG_PRINTF(fmt, ##__VA_ARGS__); exit(EXIT_FAILURE); }
