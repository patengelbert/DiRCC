
#include <string.h>
#include <stdint.h>
#include "dircc_system_state.h"

static dircc_state_map dircc_state_translation[] = {
	{DIRCC_STATE_UNKNOWN, 	"DIRCC_STATE_UNKNOWN"},
	{DIRCC_STATE_DISABLED, 	"DIRCC_STATE_DISABLED"},
	{DIRCC_STATE_IDLE, 		"DIRCC_STATE_IDLE"},
	{DIRCC_STATE_BOOTING, 	"DIRCC_STATE_BOOTED"},
	{DIRCC_STATE_RUNNING, 	"DIRCC_STATE_RUNNING"},
	{DIRCC_STATE_COMPUTE, 	"DIRCC_STATE_COMPUTE"},
	{DIRCC_STATE_RECEIVE, 	"DIRCC_STATE_RECEIVE"},
	{DIRCC_STATE_SEND, 		"DIRCC_STATE_SEND"},
	{DIRCC_STATE_STOPPED, 	"DIRCC_STATE_STOPPED"},
	{DIRCC_STATE_DONE, 		"DIRCC_STATE_DONE"},
	{(1 << 11), 			"DIRCC_STATE_11"},
	{(1 << 12), 			"DIRCC_STATE_12"},
	{(1 << 13), 			"DIRCC_STATE_13"},
	{(1 << 13), 			"DIRCC_STATE_14"},
	{DIRCC_STATE_ERROR, 	"DIRCC_STATE_ERROR"}
};

void translate_state(uint16_t state, char* rv)
{
    dircc_state_map map;
    strcpy(rv, "");
    for (unsigned i = 0; i < DIRCC_STATE_NUM; i++) {
        map = dircc_state_translation[i];
        if (state & map.state)
        {
        	sprintf(rv, "%s%s,", rv, map.state_name);
        }
    }
    rv[strlen(rv)-1] = 0;
}
