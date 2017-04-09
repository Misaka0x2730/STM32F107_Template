################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ETH_Options/src/netconf.c 

OBJS += \
./ETH_Options/src/netconf.o 

C_DEPS += \
./ETH_Options/src/netconf.d 


# Each subdirectory must supply rules for building sources it contributes
ETH_Options/src/%.o: ../ETH_Options/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -ffunction-sections -Wunused -Wuninitialized -Wall  -g3 -ggdb -DUSE_STDPERIPH_DRIVER -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\ETH_Options\inc" -I/home/misaka10032/eclipse/arm-none-eabi/arm-none-eabi/include -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include\ipv4" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\cmsis" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32_ETH_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32F107_BSP_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\port" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include" -std=c99 -Wa,-adhlns="$@.lst" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


