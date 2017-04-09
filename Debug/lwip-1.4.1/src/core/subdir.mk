################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip-1.4.1/src/core/def.c \
../lwip-1.4.1/src/core/dhcp.c \
../lwip-1.4.1/src/core/dns.c \
../lwip-1.4.1/src/core/init.c \
../lwip-1.4.1/src/core/mem.c \
../lwip-1.4.1/src/core/memp.c \
../lwip-1.4.1/src/core/netif.c \
../lwip-1.4.1/src/core/pbuf.c \
../lwip-1.4.1/src/core/raw.c \
../lwip-1.4.1/src/core/stats.c \
../lwip-1.4.1/src/core/sys.c \
../lwip-1.4.1/src/core/tcp.c \
../lwip-1.4.1/src/core/tcp_in.c \
../lwip-1.4.1/src/core/tcp_out.c \
../lwip-1.4.1/src/core/timers.c \
../lwip-1.4.1/src/core/udp.c 

OBJS += \
./lwip-1.4.1/src/core/def.o \
./lwip-1.4.1/src/core/dhcp.o \
./lwip-1.4.1/src/core/dns.o \
./lwip-1.4.1/src/core/init.o \
./lwip-1.4.1/src/core/mem.o \
./lwip-1.4.1/src/core/memp.o \
./lwip-1.4.1/src/core/netif.o \
./lwip-1.4.1/src/core/pbuf.o \
./lwip-1.4.1/src/core/raw.o \
./lwip-1.4.1/src/core/stats.o \
./lwip-1.4.1/src/core/sys.o \
./lwip-1.4.1/src/core/tcp.o \
./lwip-1.4.1/src/core/tcp_in.o \
./lwip-1.4.1/src/core/tcp_out.o \
./lwip-1.4.1/src/core/timers.o \
./lwip-1.4.1/src/core/udp.o 

C_DEPS += \
./lwip-1.4.1/src/core/def.d \
./lwip-1.4.1/src/core/dhcp.d \
./lwip-1.4.1/src/core/dns.d \
./lwip-1.4.1/src/core/init.d \
./lwip-1.4.1/src/core/mem.d \
./lwip-1.4.1/src/core/memp.d \
./lwip-1.4.1/src/core/netif.d \
./lwip-1.4.1/src/core/pbuf.d \
./lwip-1.4.1/src/core/raw.d \
./lwip-1.4.1/src/core/stats.d \
./lwip-1.4.1/src/core/sys.d \
./lwip-1.4.1/src/core/tcp.d \
./lwip-1.4.1/src/core/tcp_in.d \
./lwip-1.4.1/src/core/tcp_out.d \
./lwip-1.4.1/src/core/timers.d \
./lwip-1.4.1/src/core/udp.d 


# Each subdirectory must supply rules for building sources it contributes
lwip-1.4.1/src/core/%.o: ../lwip-1.4.1/src/core/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -ffunction-sections -Wunused -Wuninitialized -Wall  -g3 -ggdb -DUSE_STDPERIPH_DRIVER -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\ETH_Options\inc" -I/home/misaka10032/eclipse/arm-none-eabi/arm-none-eabi/include -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include\ipv4" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\cmsis" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32_ETH_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32F107_BSP_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\port" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include" -std=c99 -Wa,-adhlns="$@.lst" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


