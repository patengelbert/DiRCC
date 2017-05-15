


/* Altera library includes. */
//
//#include "socal/alt_l4wd.h"
//#include "socal/socal.h"
//#include "boot_support.h"

#include <stdint.h>
#include "main_rtos.h"

#include "alt_interrupt.h"
#include "alt_printf.h"
#include "alt_generalpurpose_io.h"

/* mainCREATE_SIMPLE_BLINKY_DEMO_ONLY is used to select between two demo
 * applications, as described at the top of this file.
 *
 * When mainCREATE_SIMPLE_BLINKY_DEMO_ONLY is set to 1 the simple blinky example
 * will be run.
 *
 * When mainCREATE_SIMPLE_BLINKY_DEMO_ONLY is set to 0 the comprehensive test
 * and demo application will be run.
 */
#define applicationDEFAULT_LED_BIT	ALT_GPIO_BIT24

extern void dircc_main();

/*-----------------------------------------------------------*/

/*
 * Configure the hardware as necessary to run this demo.
 */
static void prvSetupHardware( void );
/*
 * See the comments at the top of this file and above the
 * mainSELECTED_APPLICATION definition.
 */

/* Prototypes for the standard FreeRTOS callback/hook functions implemented
within this file. */
void vApplicationMallocFailedHook( void );
void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName );

/*-----------------------------------------------------------*/

/* configAPPLICATION_ALLOCATED_HEAP is set to 1 in FreeRTOSConfig.h so the
application can define the array used as the FreeRTOS heap.  This is done so the
heap can be forced into fast internal RAM - useful because the stacks used by
the tasks come from this space. */
uint8_t ucHeap[ configTOTAL_HEAP_SIZE ] __attribute__ ( ( section( ".oc_ram" ) ) );

/* FreeRTOS uses its own interrupt handler code.  This code cannot use the array
of handlers defined by the Altera drivers because the array is declared static,
and so not accessible outside of the dirver's source file.  Instead declare an
array for use by the FreeRTOS handler.  See:
http://www.freertos.org/Using-FreeRTOS-on-Cortex-A-Embedded-Processors.html. */
static INT_DISPATCH_t xISRHandlers[ ALT_INT_PROVISION_INT_COUNT ];

/*-----------------------------------------------------------*/



int main( void )
{
	ALT_PRINTF("main RTOS. %s / %s\n",__DATE__,__TIME__);

	/* Configure the hardware ready to run the demo. */
	prvSetupHardware();

	dircc_main();
	/* Don't expect to reach here. */
	return 0;
}

/*-----------------------------------------------------------*/

static void prvSetupHardware( void )
{

	ALT_PRINTF("In: prvSetupHardware()\n");
	// Initialise peripherals
	alt_int_global_init();
	alt_int_cpu_init();
	alt_gpio_init();
}
/*-----------------------------------------------------------*/

void vApplicationMallocFailedHook( void )
{
	/* Called if a call to pvPortMalloc() fails because there is insufficient
	free memory available in the FreeRTOS heap.  pvPortMalloc() is called
	internally by FreeRTOS API functions that create tasks, queues, software
	timers, and semaphores.  The size of the FreeRTOS heap is set by the
	configTOTAL_HEAP_SIZE configuration constant in FreeRTOSConfig.h. */

	ALT_PRINTF("In: vApplicationMallocFailedHook()\n");

	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	ALT_PRINTF("vApplicationStackOverflowHook()-->Task is-->%s\n",pcTaskName);

	/* Run time stack overflow checking is performed if
	configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
	function is called if a stack overflow is detected. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}

/*-----------------------------------------------------------*/

/*-----------------------------------------------------------*/
//The macro configSETUP_TICK_INTERRUPT() is called by the RTOS kernel port layer.
//configSETUP_TICK_INTERRUPT() must be #defined in FreeRTOSConfig.h to configure
//a peripheral to generate a periodic interrupt at the frequency set by
//the configTICK_RATE_HZ FreeRTOSConfig.h setting. FreeRTOS_Tick_Handler() must
//then be installed as the interrupt's handler function.
//http://www.freertos.org/Using-FreeRTOS-on-Cortex-A-Embedded-Processors.html#example_irq_handler
void vConfigureTickInterrupt( void )
{
	ALT_STATUS_CODE status = ALT_E_SUCCESS;
	alt_freq_t ulTempFrequency;
	const alt_freq_t ulMicroSecondsPerSecond = 1000000UL;

	ALT_PRINTF("In: vConfigureTickInterrupt()\n");

	/* Initialise the general purpose timer modules. */
	status|=alt_gpt_all_tmr_init();
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_gpt_all_tmr_init ERROR\n");

	/* ALT_CLK_MPU_PERIPH = mpu_periph_clk */
	status |= alt_clk_freq_get(ALT_CLK_MPU_PERIPH, &ulTempFrequency);
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_clk_freq_get ERROR\n");
	ALT_PRINTF("ALT_GPT_CPU_PRIVATE_TMR freq is %d Hz\n",(int)ulTempFrequency);

	/* Use the local private timer. */
	status|=alt_gpt_counter_set( ALT_GPT_CPU_PRIVATE_TMR, ulTempFrequency / configTICK_RATE_HZ );
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_gpt_counter_set ERROR\n");

	/* Sanity check. */
	configASSERT( alt_gpt_time_microsecs_get( ALT_GPT_CPU_PRIVATE_TMR ) == ( ulMicroSecondsPerSecond / configTICK_RATE_HZ ) );

	/* Set to periodic mode. */
	status|=alt_gpt_mode_set( ALT_GPT_CPU_PRIVATE_TMR, ALT_GPT_RESTART_MODE_PERIODIC );
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_gpt_mode_set ERROR\n");

	status |= alt_gpt_prescaler_set(ALT_GPT_CPU_PRIVATE_TMR, 0);
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_gpt_prescaler_set ERROR\n");

	/* The timer can be started here as interrupts are disabled. */
	status|=alt_gpt_tmr_start( ALT_GPT_CPU_PRIVATE_TMR );
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_gpt_tmr_start ERROR\n");

	/* Register the standard FreeRTOS Cortex-A tick handler as the timer's
	interrupt handler.  The handler clears the interrupt using the
	configCLEAR_TICK_INTERRUPT() macro, which is defined in FreeRTOSConfig.h. */
	vRegisterIRQHandler( ALT_INT_INTERRUPT_PPI_TIMER_PRIVATE, ( alt_int_callback_t ) FreeRTOS_Tick_Handler, NULL );

	/* This tick interrupt must run at the lowest priority. */
	status|=alt_int_dist_priority_set( ALT_INT_INTERRUPT_PPI_TIMER_PRIVATE, portLOWEST_USABLE_INTERRUPT_PRIORITY << portPRIORITY_SHIFT );
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_int_dist_priority_set ERROR\n");

	/* Ensure the interrupt is forwarded to the CPU. */
	status|=alt_int_dist_enable( ALT_INT_INTERRUPT_PPI_TIMER_PRIVATE );
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_int_dist_enable ERROR\n");

	/* Ensure the interrupt is forwarded to the CPU. */
	status|=alt_int_cpu_enable();
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_int_cpu_enable ERROR\n");

    /* Finally, enable the interrupt. */
	status|=alt_gpt_int_if_pending_clear( ALT_GPT_CPU_PRIVATE_TMR );
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_gpt_int_clear_pending ERROR\n");

	status|=alt_gpt_int_enable( ALT_GPT_CPU_PRIVATE_TMR );
	if(status!=ALT_E_SUCCESS) ALT_PRINTF("alt_gpt_int_enable ERROR\n");

	status|=alt_int_global_enable();

	if(status==ALT_E_SUCCESS){
		ALT_PRINTF("vConfigureTickInterrupt() DONE OK!\n");
	}else{
		ALT_PRINTF("vConfigureTickInterrupt() ERROR!\n");
	}
}
/*-----------------------------------------------------------*/

void vRegisterIRQHandler( uint32_t ulID, alt_int_callback_t pxHandlerFunction, void *pvContext )
{
	ALT_PRINTF("In: vRegisterIRQHandler(). ulID=%d pxHandlerFunction=0x%X\n",ulID,pxHandlerFunction);

	if( ulID < ALT_INT_PROVISION_INT_COUNT )
	{
		xISRHandlers[ ulID ].pxISR = pxHandlerFunction;
		xISRHandlers[ ulID ].pvContext = pvContext;
	}
}
/*-----------------------------------------------------------*/
//  FreeRTOS_IRQ_Handler  portASM.s
// --defsym=__cs3_isr_irq=FreeRTOS_IRQ_Handler
void vApplicationIRQHandler( uint32_t ulICCIAR )
{
	uint32_t ulInterruptID;
	void *pvContext;
	alt_int_callback_t pxISR;

//	ALT_PRINTF("In: vApplicationIRQHandler()\n");

	/* Re-enable interrupts. */
    __asm ( "cpsie i" );

	/* The ID of the interrupt is obtained by bitwise anding the ICCIAR value
	with 0x3FF. */
	ulInterruptID = ulICCIAR & 0x3FFUL;

	if( ulInterruptID < ALT_INT_PROVISION_INT_COUNT )
	{
		/* Call the function installed in the array of installed handler
		functions. */
		pxISR = xISRHandlers[ ulInterruptID ].pxISR;
		pvContext = xISRHandlers[ ulInterruptID ].pvContext;
		pxISR( ulICCIAR, pvContext );
	}
}

void vConfigureProcessingLED( void )
{
	alt_gpio_port_datadir_set(ALT_GPIO_PORTB, applicationDEFAULT_LED_BIT, applicationDEFAULT_LED_BIT);
	alt_gpio_port_data_write(ALT_GPIO_PORTB, applicationDEFAULT_LED_BIT, 0x0);
}

void vTraceSetProcessingLED( UBaseType_t xValue )
{
	alt_gpio_port_data_write(ALT_GPIO_PORTB, applicationDEFAULT_LED_BIT, xValue ? applicationDEFAULT_LED_BIT : 0x0);
}

