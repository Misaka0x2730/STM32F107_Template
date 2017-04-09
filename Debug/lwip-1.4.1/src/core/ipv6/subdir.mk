################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip-1.4.1/src/core/ipv6/icmp6.c \
../lwip-1.4.1/src/core/ipv6/inet6.c \
../lwip-1.4.1/src/core/ipv6/ip6.c \
../lwip-1.4.1/src/core/ipv6/ip6_addr.c 

OBJS += \
./lwip-1.4.1/src/core/ipv6/icmp6.o \
./lwip-1.4.1/src/core/ipv6/inet6.o \
./lwip-1.4.1/src/core/ipv6/ip6.o \
./lwip-1.4.1/src/core/ipv6/ip6_addr.o 

C_DEPS += \
./lwip-1.4.1/src/core/ipv6/icmp6.d \
./lwip-1.4.1/src/core/ipv6/inet6.d \
./lwip-1.4.1/src/core/ipv6/ip6.d \
./lwip-1.4.1/src/core/ipv6/ip6_addr.d 


# Each subdirectory must supply rules for building sources it contributes
lwip-1.4.1/src/core/ipv6/%.o: ../lwip-1.4.1/src/core/ipv6/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra  -g3 -DUSE_STDPERIPH_DRIVER -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/cmsis" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/lwip-1.4.1/src/include/ipv4" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/ETH_Options/inc" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/lwip-1.4.1/src/netif" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/lwip-1.4.1/port" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/STM32_ETH_Driver/inc" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/STM32F107_BSP_Driver/inc" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/lwip-1.4.1/src/include" -I"/media/misaka10032/Work/ARM/STM32 Eclipse Firmware/STM32F107_Template/inc" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


