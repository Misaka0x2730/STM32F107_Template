################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../cmsis/core_cm3.c \
../cmsis/system_stm32f10x.c 

OBJS += \
./cmsis/core_cm3.o \
./cmsis/system_stm32f10x.o 

C_DEPS += \
./cmsis/core_cm3.d \
./cmsis/system_stm32f10x.d 


# Each subdirectory must supply rules for building sources it contributes
cmsis/%.o: ../cmsis/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Os -ffunction-sections -flto -Wunused -Wuninitialized -Wall  -g -DUSE_STDPERIPH_DRIVER -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\ETH_Options\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include\ipv4" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\cmsis" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32_ETH_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32F107_BSP_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\port" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


