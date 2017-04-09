################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip-1.4.1/src/core/snmp/asn1_dec.c \
../lwip-1.4.1/src/core/snmp/asn1_enc.c \
../lwip-1.4.1/src/core/snmp/mib2.c \
../lwip-1.4.1/src/core/snmp/mib_structs.c \
../lwip-1.4.1/src/core/snmp/msg_in.c \
../lwip-1.4.1/src/core/snmp/msg_out.c 

OBJS += \
./lwip-1.4.1/src/core/snmp/asn1_dec.o \
./lwip-1.4.1/src/core/snmp/asn1_enc.o \
./lwip-1.4.1/src/core/snmp/mib2.o \
./lwip-1.4.1/src/core/snmp/mib_structs.o \
./lwip-1.4.1/src/core/snmp/msg_in.o \
./lwip-1.4.1/src/core/snmp/msg_out.o 

C_DEPS += \
./lwip-1.4.1/src/core/snmp/asn1_dec.d \
./lwip-1.4.1/src/core/snmp/asn1_enc.d \
./lwip-1.4.1/src/core/snmp/mib2.d \
./lwip-1.4.1/src/core/snmp/mib_structs.d \
./lwip-1.4.1/src/core/snmp/msg_in.d \
./lwip-1.4.1/src/core/snmp/msg_out.d 


# Each subdirectory must supply rules for building sources it contributes
lwip-1.4.1/src/core/snmp/%.o: ../lwip-1.4.1/src/core/snmp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Os -ffunction-sections -flto -Wunused -Wuninitialized -Wall  -g -DUSE_STDPERIPH_DRIVER -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\ETH_Options\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include\ipv4" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\cmsis" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32_ETH_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32F107_BSP_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\port" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


