################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/croutine.c \
../src/list.c \
../src/queue.c \
../src/tasks.c \
../src/timers.c 

OBJS += \
./src/croutine.o \
./src/list.o \
./src/queue.o \
./src/tasks.o \
./src/timers.o 

C_DEPS += \
./src/croutine.d \
./src/list.d \
./src/queue.d \
./src/tasks.d \
./src/timers.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	arm-altera-eabi-g++ -march=armv7-a -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=softfp -Dsoc_cv_av -DportREMOVE_STATIC_QUALIFIER -DINCLUDE_xTaskGetIdleTaskHandle -I"/home/patrick/Documents/Coursework/DiRCC/software/FreeRTOS/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/FreeRTOS/portable/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/hwlib/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/hwlib/include/soc_cv_av" -O0 -g -Wall --std=c++11 -mtune=cortex-a9 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


