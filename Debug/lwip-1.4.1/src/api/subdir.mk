################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip-1.4.1/src/api/api_lib.c \
../lwip-1.4.1/src/api/api_msg.c \
../lwip-1.4.1/src/api/err.c \
../lwip-1.4.1/src/api/netbuf.c \
../lwip-1.4.1/src/api/netdb.c \
../lwip-1.4.1/src/api/netifapi.c \
../lwip-1.4.1/src/api/sockets.c \
../lwip-1.4.1/src/api/tcpip.c 

OBJS += \
./lwip-1.4.1/src/api/api_lib.o \
./lwip-1.4.1/src/api/api_msg.o \
./lwip-1.4.1/src/api/err.o \
./lwip-1.4.1/src/api/netbuf.o \
./lwip-1.4.1/src/api/netdb.o \
./lwip-1.4.1/src/api/netifapi.o \
./lwip-1.4.1/src/api/sockets.o \
./lwip-1.4.1/src/api/tcpip.o 

C_DEPS += \
./lwip-1.4.1/src/api/api_lib.d \
./lwip-1.4.1/src/api/api_msg.d \
./lwip-1.4.1/src/api/err.d \
./lwip-1.4.1/src/api/netbuf.d \
./lwip-1.4.1/src/api/netdb.d \
./lwip-1.4.1/src/api/netifapi.d \
./lwip-1.4.1/src/api/sockets.d \
./lwip-1.4.1/src/api/tcpip.d 


# Each subdirectory must supply rules for building sources it contributes
lwip-1.4.1/src/api/%.o: ../lwip-1.4.1/src/api/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -ffunction-sections -Wunused -Wuninitialized -Wall  -g3 -ggdb -DUSE_STDPERIPH_DRIVER -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\ETH_Options\inc" -I/home/misaka10032/eclipse/arm-none-eabi/arm-none-eabi/include -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include\ipv4" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\cmsis" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32_ETH_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32F107_BSP_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\port" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include" -std=c99 -Wa,-adhlns="$@.lst" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


