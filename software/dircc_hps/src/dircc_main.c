/*
 * dircc_main.c
 *
 *  Created on: 13 May 2017
 *      Author: patrick
 */

#include "dircc.h"
#include "FreeRTOS.h"
#include "alt_printf.h"
#include "task.h"
#include <string.h>

static void initialiseThreadTask(void* pvParameters);
static void watchThreadTask(void* pvParameters);
static void watchTerminalTask(void* pvParameters);

#define mainQUEUE_INIT_TASK_PRIORITY (tskIDLE_PRIORITY + 2)
#define mainQUEUE_WAIT_TASK_PRIORITY (tskIDLE_PRIORITY + 1)

#define mainQUEUE_CHECK_FREQUENCY_MS			( 10 / portTICK_PERIOD_MS )//( 1000 / portTICK_PERIOD_MS )
#define mainQUEUE_CHECKBOOTED_FREQUENCY_MS		( 100 / portTICK_PERIOD_MS )//( 1000 / portTICK_PERIOD_MS )

void dircc_main()
{

    BaseType_t rv;
    // Init
    // Get a list of all connected devices

    for (unsigned i = 0; i < num_addresses; i++) {
    	thread_address_map *thread_map = dircc_thread_addresses + i;
        // Launch task to init
        rv = xTaskCreate(
            initialiseThreadTask, // The function that implements the task.
            "InitThread", // The text name assigned to the task - for debug only as it is not used by the kernel.
            configMINIMAL_STACK_SIZE,     // The size of the stack to allocate to the task.
			thread_map,                         // The parameter passed to the task - not used in this case.
            mainQUEUE_INIT_TASK_PRIORITY, // The priority assigned to the task.
            NULL);                        // The task handle is not required, so NULL is passed.
        if (rv == pdPASS) {
            ALT_PRINTF("Init%d task created OK.\n", i);
        } else {
            ALT_PRINTF("Init%d task didn't create. ERROR.\n", i);
        }

        rv = xTaskCreate(
            watchThreadTask, // The function that implements the task.
            "WatchThread",   // The text name assigned to the task - for debug only as it is not used by the kernel.
            configMINIMAL_STACK_SIZE,     // The size of the stack to allocate to the task.
			thread_map,                         // The parameter passed to the task - not used in this case.
            mainQUEUE_WAIT_TASK_PRIORITY, // The priority assigned to the task.
            NULL);                        // The task handle is not required, so NULL is passed.
        if (rv == pdPASS) {
            ALT_PRINTF("Watch%d task created OK.\n", i);
        } else {
            ALT_PRINTF("Watch%d task didn't create. ERROR.\n", i);
        }
    }

    rv =
        xTaskCreate(watchTerminalTask, "WatchTerm", configMINIMAL_STACK_SIZE, NULL, mainQUEUE_WAIT_TASK_PRIORITY, NULL);
    if (rv == pdPASS) {
        ALT_PRINTF("WatchTerm task created OK.\n");
    } else {
        ALT_PRINTF("WatchTerm task didn't create. ERROR.\n");
    }
    // Preload data to each device for each thread
    // TODO: Wait until state = booted for each device in a thread
    // TODO: Launch thread
    // Start the tasks and timer running.
    ALT_PRINTF("Start sheduler...\n");
    vTaskStartScheduler();
}

static void dircc_print_arr(const void* x, int len)
{
    const char const* x2 = x;
    for (unsigned i = 0; i < len; i++) {
        ALT_PRINTF("%02x:", x2[i]);
    }

    if (len > 0) {
        ALT_PRINTF("%02x", x2[len - 1]);
    }
    ALT_PRINTF(" \n");
}

static void* map_thread_to_address(uint32_t thread_id)
{
    thread_address_map map;
    for (int i = 0; i < num_addresses; i++) {
        map = dircc_thread_addresses[i];
        if (map.thread_id == thread_id) {
            return map.address;
        }
    }
    ALT_PRINTF("Error: Thread address not found for thread %d\n", thread_id);
    return NULL;
}

static PThreadContext* map_address_to_thread(uint32_t thread_id)
{
    PThreadContext *ctxt;
    for (int i = 0; i < dircc_thread_count; i++) {
        ctxt = dircc_thread_contexts + i;
        if (ctxt->threadId == thread_id) {
            return ctxt;
        }
    }
    ALT_PRINTF("INFO: Thread not used for thread id %d\n", thread_id);
    return NULL;
}

static DeviceContext* map_index_to_device(const PThreadContext *pCtxt, uint32_t index)
{
	DeviceContext *ctxt;
	if(pCtxt != NULL)
		{
		for (int i = 0; i < pCtxt->numDevices; i++) {
			ctxt = pCtxt->devices + i;
			if (ctxt->index == index) {
				return ctxt;
			}
		}
		ALT_PRINTF("INFO: Device %d not used for thread id %d\n", index, pCtxt->threadId);
	}
    return NULL;
}

static void initialiseThreadTask(void* pvParameters)
{
    TickType_t      nextWakeTime = xTaskGetTickCount();
    thread_address_map* thread_data         = pvParameters;
	ALT_PRINTF("Starting task initialiseThreadTask for thread %d\n", thread_data->thread_id);
    PThreadContext *ctxt = map_address_to_thread(thread_data->thread_id);
	unsigned thread_in_use = ctxt != NULL;

    ALT_PRINTF("Thread Address: 0x%08x\n", thread_data->address);

    DeviceState* threadStates = thread_data->address + DIRCC_DEVICE_STATE_OFFSET;
    ALT_PRINTF("Device States: 0x%08x\n", threadStates);

	if(!thread_in_use)
	{
		ALT_PRINTF("Thread %d not used. Disabling all devices.\n", thread_data->thread_id);
	}

    for (unsigned i = 0; i < MAX_DEVICES_PER_THREAD; i++) {
		DeviceContext* dCtxt        = map_index_to_device(ctxt, i);
		DeviceState*   dState       = dCtxt != NULL && thread_in_use ? dCtxt->state : NULL;
        DeviceState*   dThreadState = threadStates + i;

        while (!(dThreadState->dirccState & DIRCC_STATE_BOOTED)) {
            vTaskDelayUntil(&nextWakeTime, mainQUEUE_CHECKBOOTED_FREQUENCY_MS);
        }

        if(dState != NULL)
        {
            ALT_PRINTF("Thread %d : Initialising device %d.\n", thread_data->thread_id, i);
			ALT_PRINTF("Thread %d : Copying data for device %d\n", thread_data->thread_id, i);

			ALT_PRINTF("Old Data: ");
			dircc_print_arr(&(dThreadState->userState), MAX_DEVICE_USER_STATE_BYTES);

			memcpy(&(dThreadState->userState), dState->userState, sizeof(uint8_t) * MAX_DEVICE_USER_STATE_BYTES);

			ALT_PRINTF("New Data: ");
			dircc_print_arr(&(dThreadState->userState), MAX_DEVICE_USER_STATE_BYTES);

			// TODO: Copy edge state
			ALT_PRINTF("Thread %d : Launching device %d\n", thread_data->thread_id, i);
			dThreadState->dirccState = DIRCC_STATE_RUNNING;
        }
        else
        {
			ALT_PRINTF("Thread %d : Disabling device %d\n", thread_data->thread_id, i);
			dThreadState->dirccState = DIRCC_STATE_DISABLED;
        }
    }

    ALT_PRINTF("Finished task initialiseThreadTask for thread %d\n", thread_data->thread_id);

    /* Tasks must not attempt to return from their implementing
    function or otherwise exit.  In newer FreeRTOS port
    attempting to do so will result in an configASSERT() being
    called if it is defined.  If it is necessary for a task to
    exit then have the task call vTaskDelete( NULL ) to ensure
    its exit is clean. */
    vTaskDelete(NULL);
}

static void watchThreadTask(void* pvParameters)
{
    TickType_t      nextWakeTime = xTaskGetTickCount();
    thread_address_map* thread_data         = pvParameters;
    ALT_PRINTF("%s: Starting task watchThreadTask for thread %d\n", __FUNCTION__, thread_data->thread_id);

    uint16_t        oldDirccStates[MAX_DEVICES_PER_THREAD];
    char 			translated[80];

    // Clear array
    memset(&oldDirccStates[0], 0, sizeof(uint16_t) * MAX_DEVICES_PER_THREAD);

    ALT_PRINTF("%s: Thread Address: 0x%08x\n", __FUNCTION__, thread_data->address);

    DeviceState* threadStates = thread_data->address + DIRCC_DEVICE_STATE_OFFSET;
    ALT_PRINTF("%s: Device States: 0x%08x\n", __FUNCTION__, threadStates);

    while (true) {
        unsigned completed = 0;
        for (unsigned i = 0; i < MAX_DEVICES_PER_THREAD; i++) {

            DeviceState*   dThreadState = threadStates + i;
            vTaskDelayUntil(&nextWakeTime, mainQUEUE_CHECK_FREQUENCY_MS);

            if (!(oldDirccStates[i] & DIRCC_STATE_STOPPED)) {
                if (dThreadState->dirccState != oldDirccStates[i]) {
                    translate_state(dThreadState->dirccState, translated);
                    ALT_PRINTF("Thread %d : State of device %d = %s\n", thread_data->thread_id, i, translated);
                    oldDirccStates[i] = dThreadState->dirccState;
                }
            } else if (!(oldDirccStates[i] & DIRCC_STATE_DISABLED)){
            	// Unload the data
				ALT_PRINTF("Thread %d : Device %d : Completed\n", thread_data->thread_id, i);
				data_format(&(dThreadState->userState), translated);
				ALT_PRINTF("Thread %d : Device %d : State ->\n%s\n", thread_data->thread_id, i, translated);
				completed++;
            }
        }
//        ALT_PRINTF("Thread %d: %d devices completed\n", thread_data->thread_id, completed);
        if (completed == MAX_DEVICES_PER_THREAD) {
            // All done
            ALT_PRINTF("Thread %d: All devices done\n", thread_data->thread_id);
            break;
        }
    }

    ALT_PRINTF("Finished task watchThreadTask for thread %d\n", thread_data->thread_id);


    /* Tasks must not attempt to return from their implementing
    function or otherwise exit.  In newer FreeRTOS port
    attempting to do so will result in an configASSERT() being
    called if it is defined.  If it is necessary for a task to
    exit then have the task call vTaskDelete( NULL ) to ensure
    its exit is clean. */
    vTaskDelete(NULL);
}

static void watchTerminalTask(void* pvParameters)
{
    TickType_t nextWakeTime = xTaskGetTickCount();
    uint16_t   oldDirccStates[num_terminals];
    char 	   translated[80];

    // Clear array
    memset(&oldDirccStates[0], 0, sizeof(uint16_t) * num_terminals);

    ALT_PRINTF("%s: Starting task watchTerminalTask\n", __FUNCTION__);

    while (true) {
        vTaskDelayUntil(&nextWakeTime, mainQUEUE_CHECK_FREQUENCY_MS);
        for (unsigned i = 0; i < num_terminals; i++) {
            uint16_t* dTermState = dircc_terminal_addresses[i];
            if (*dTermState != 0) {
                translate_state(*dTermState, translated);
                ALT_PRINTF("State of terminal %d = %s\n", i, translated);
            }
        }
    }

    ALT_PRINTF("Finished task watchTerminalTask\n");

    /* Tasks must not attempt to return from their implementing
    function or otherwise exit.  In newer FreeRTOS port
    attempting to do so will result in an configASSERT() being
    called if it is defined.  If it is necessary for a task to
    exit then have the task call vTaskDelete( NULL ) to ensure
    its exit is clean. */
    vTaskDelete(NULL);
}
