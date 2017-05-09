################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../portable/portASM.s 

C_SRCS += \
../portable/heap_4.c \
../portable/port.c 

OBJS += \
./portable/heap_4.o \
./portable/port.o \
./portable/portASM.o 

C_DEPS += \
./portable/heap_4.d \
./portable/port.d 


# Each subdirectory must supply rules for building sources it contributes
portable/%.o: ../portable/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	arm-altera-eabi-g++ -march=armv7-a -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=softfp -Dsoc_cv_av -DportREMOVE_STATIC_QUALIFIER -DINCLUDE_xTaskGetIdleTaskHandle -I"/home/patrick/Documents/Coursework/DiRCC/software/FreeRTOS/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/FreeRTOS/portable/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/hwlib/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/hwlib/include/soc_cv_av" -O0 -g -Wall --std=c++11 -mtune=cortex-a9 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

portable/%.o: ../portable/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	arm-altera-eabi-gcc -march=armv7-a -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=softfp -Dsoc_cv_av -DportREMOVE_STATIC_QUALIFIER -DportREMOVE_STATIC_QUALIFIER -I"/home/patrick/Documents/Coursework/DiRCC/software/FreeRTOS/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/FreeRTOS/portable/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/hwlib/include" -I"/home/patrick/Documents/Coursework/DiRCC/software/hwlib/include/soc_cv_av" -g -mtune=cortex-a9 -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


