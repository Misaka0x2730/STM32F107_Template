################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../STM32_ETH_Driver/src/stm32_eth.c 

OBJS += \
./STM32_ETH_Driver/src/stm32_eth.o 

C_DEPS += \
./STM32_ETH_Driver/src/stm32_eth.d 


# Each subdirectory must supply rules for building sources it contributes
STM32_ETH_Driver/src/%.o: ../STM32_ETH_Driver/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Os -ffunction-sections -flto -Wunused -Wuninitialized -Wall  -g -DUSE_STDPERIPH_DRIVER -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\ETH_Options\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include\ipv4" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\cmsis" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32_ETH_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32F107_BSP_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\port" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


