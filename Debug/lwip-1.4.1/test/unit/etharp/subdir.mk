################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip-1.4.1/test/unit/etharp/test_etharp.c 

OBJS += \
./lwip-1.4.1/test/unit/etharp/test_etharp.o 

C_DEPS += \
./lwip-1.4.1/test/unit/etharp/test_etharp.d 


# Each subdirectory must supply rules for building sources it contributes
lwip-1.4.1/test/unit/etharp/%.o: ../lwip-1.4.1/test/unit/etharp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra  -g3 -DUSE_STDPERIPH_DRIVER -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/cmsis" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/inc" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


