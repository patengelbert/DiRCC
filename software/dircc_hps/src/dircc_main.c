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

#define mainQUEUE_CHECK_FREQUENCY_MS			( 100 / portTICK_PERIOD_MS )//( 1000 / portTICK_PERIOD_MS )
#define mainQUEUE_CHECKBOOTED_FREQUENCY_MS		( 100 / portTICK_PERIOD_MS )//( 1000 / portTICK_PERIOD_MS )

void dircc_main()
{

    BaseType_t rv;
    // Init
    // Get a list of all connected devices

    for (unsigned i = 0; i < dircc_thread_count; i++) {
        PThreadContext* ctxt = dircc_thread_contexts + i;
        // Launch task to init
        rv = xTaskCreate(
            initialiseThreadTask, // The function that implements the task.
            "InitThread", // The text name assigned to the task - for debug only as it is not used by the kernel.
            configMINIMAL_STACK_SIZE,     // The size of the stack to allocate to the task.
            ctxt,                         // The parameter passed to the task - not used in this case.
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
            ctxt,                         // The parameter passed to the task - not used in this case.
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
    for (unsigned i = 0; i < len - 1; i++) {
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

static void initialiseThreadTask(void* pvParameters)
{
    TickType_t      nextWakeTime = xTaskGetTickCount();
    PThreadContext* ctxt         = pvParameters;
    ALT_PRINTF("Starting task initialiseThreadTask for thread %d\n", ctxt->threadId);

    void* threadAddress = map_thread_to_address(ctxt->threadId);
    ALT_PRINTF("Thread Address: 0x%08x\n", threadAddress);

    DeviceState* threadStates = threadAddress + DIRCC_DEVICE_STATE_OFFSET;
    ALT_PRINTF("Device States: 0x%08x\n", threadStates);

    for (unsigned i = 0; i < ctxt->numDevices; i++) {
        DeviceContext* dCtxt        = ctxt->devices + i;
        DeviceState*   dState       = dCtxt->state;
        DeviceState*   dThreadState = threadStates + dCtxt->index;
        while (!(dThreadState->dirccState & DIRCC_STATE_BOOTED)) {
            vTaskDelayUntil(&nextWakeTime, mainQUEUE_CHECKBOOTED_FREQUENCY_MS);
        }

        ALT_PRINTF("Copying data for %d:%d\n", ctxt->threadId, dCtxt->index);

        ALT_PRINTF("Old Data: ");
        dircc_print_arr(&(dThreadState->userState), MAX_DEVICE_USER_STATE_BYTES);

        memcpy(&(dThreadState->userState), dState->userState, sizeof(uint8_t) * MAX_DEVICE_USER_STATE_BYTES);

        ALT_PRINTF("New Data: ");
        dircc_print_arr(&(dThreadState->userState), MAX_DEVICE_USER_STATE_BYTES);

        // TODO: Copy edge state
        ALT_PRINTF("Launching %d:%d\n", ctxt->threadId, dCtxt->index);
        dThreadState->dirccState = DIRCC_STATE_RUNNING;
    }

    ALT_PRINTF("Finished task initialiseThreadTask for thread %d\n", ctxt->threadId);

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
    PThreadContext* ctxt         = pvParameters;
    uint16_t        oldDirccStates[ctxt->numDevices];

    // Clear array
    memset(&oldDirccStates[0], 0, sizeof(uint16_t) * ctxt->numDevices);

    ALT_PRINTF("%s: Starting task watchThreadTask for thread %d\n", __FUNCTION__, ctxt->threadId);

    void* threadAddress = map_thread_to_address(ctxt->threadId);
    ALT_PRINTF("%s: Thread Address: 0x%08x\n", __FUNCTION__, threadAddress);

    DeviceState* threadStates = threadAddress + DIRCC_DEVICE_STATE_OFFSET;
    ALT_PRINTF("%s: Device States: 0x%08x\n", __FUNCTION__, threadStates);

    while (true) {
        unsigned cnt = 0;
        vTaskDelayUntil(&nextWakeTime, mainQUEUE_CHECK_FREQUENCY_MS);
        for (unsigned i = 0; i < ctxt->numDevices; i++) {
            if (!(oldDirccStates[i] & DIRCC_STATE_STOPPED)) {
                cnt++;
                DeviceContext* dCtxt        = ctxt->devices + i;
                DeviceState*   dThreadState = threadStates + dCtxt->index;
                if (dThreadState->dirccState != oldDirccStates[i]) {
                    char translated[80] = "";
                    translate_state(dThreadState->dirccState, translated);
                    ALT_PRINTF("State of %d:%d = %s\n", ctxt->threadId, dCtxt->index, translated);
                    oldDirccStates[i] = dThreadState->dirccState;
                }
            }
        }
        ALT_PRINTF("Thread %d: %d devices running\n", ctxt->threadId, cnt);
        if (cnt == 0) {
            // All done
            ALT_PRINTF("Thread %d: All devices done\n", ctxt->threadId);
            break;
        }
    }

    ALT_PRINTF("Finished task watchThreadTask for thread %d\n", ctxt->threadId);

    // We can now unload the data from the thread

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

    // Clear array
    memset(&oldDirccStates[0], 0, sizeof(uint16_t) * num_terminals);

    ALT_PRINTF("%s: Starting task watchTerminalTask\n", __FUNCTION__);

    while (true) {
        vTaskDelayUntil(&nextWakeTime, mainQUEUE_CHECK_FREQUENCY_MS);
        for (unsigned i = 0; i < num_terminals; i++) {
            uint16_t* dTermState = dircc_terminal_addresses[i];
            if (*dTermState != 0) {
                char translated[80] = "";
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
