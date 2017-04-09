################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip-1.4.1/src/core/ipv4/autoip.c \
../lwip-1.4.1/src/core/ipv4/icmp.c \
../lwip-1.4.1/src/core/ipv4/igmp.c \
../lwip-1.4.1/src/core/ipv4/inet.c \
../lwip-1.4.1/src/core/ipv4/inet_chksum.c \
../lwip-1.4.1/src/core/ipv4/ip.c \
../lwip-1.4.1/src/core/ipv4/ip_addr.c \
../lwip-1.4.1/src/core/ipv4/ip_frag.c 

OBJS += \
./lwip-1.4.1/src/core/ipv4/autoip.o \
./lwip-1.4.1/src/core/ipv4/icmp.o \
./lwip-1.4.1/src/core/ipv4/igmp.o \
./lwip-1.4.1/src/core/ipv4/inet.o \
./lwip-1.4.1/src/core/ipv4/inet_chksum.o \
./lwip-1.4.1/src/core/ipv4/ip.o \
./lwip-1.4.1/src/core/ipv4/ip_addr.o \
./lwip-1.4.1/src/core/ipv4/ip_frag.o 

C_DEPS += \
./lwip-1.4.1/src/core/ipv4/autoip.d \
./lwip-1.4.1/src/core/ipv4/icmp.d \
./lwip-1.4.1/src/core/ipv4/igmp.d \
./lwip-1.4.1/src/core/ipv4/inet.d \
./lwip-1.4.1/src/core/ipv4/inet_chksum.d \
./lwip-1.4.1/src/core/ipv4/ip.d \
./lwip-1.4.1/src/core/ipv4/ip_addr.d \
./lwip-1.4.1/src/core/ipv4/ip_frag.d 


# Each subdirectory must supply rules for building sources it contributes
lwip-1.4.1/src/core/ipv4/%.o: ../lwip-1.4.1/src/core/ipv4/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -ffunction-sections -Wunused -Wuninitialized -Wall  -g3 -ggdb -DUSE_STDPERIPH_DRIVER -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\ETH_Options\inc" -I/home/misaka10032/eclipse/arm-none-eabi/arm-none-eabi/include -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include\ipv4" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\cmsis" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32_ETH_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32F107_BSP_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\port" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include" -std=c99 -Wa,-adhlns="$@.lst" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


