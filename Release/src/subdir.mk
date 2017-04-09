################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/misc.c \
../src/stm32f107.c \
../src/stm32f10x_adc.c \
../src/stm32f10x_bkp.c \
../src/stm32f10x_can.c \
../src/stm32f10x_cec.c \
../src/stm32f10x_crc.c \
../src/stm32f10x_dac.c \
../src/stm32f10x_dbgmcu.c \
../src/stm32f10x_dma.c \
../src/stm32f10x_exti.c \
../src/stm32f10x_flash.c \
../src/stm32f10x_fsmc.c \
../src/stm32f10x_gpio.c \
../src/stm32f10x_i2c.c \
../src/stm32f10x_iwdg.c \
../src/stm32f10x_pwr.c \
../src/stm32f10x_rcc.c \
../src/stm32f10x_rtc.c \
../src/stm32f10x_sdio.c \
../src/stm32f10x_spi.c \
../src/stm32f10x_tim.c \
../src/stm32f10x_usart.c \
../src/stm32f10x_wwdg.c 

OBJS += \
./src/misc.o \
./src/stm32f107.o \
./src/stm32f10x_adc.o \
./src/stm32f10x_bkp.o \
./src/stm32f10x_can.o \
./src/stm32f10x_cec.o \
./src/stm32f10x_crc.o \
./src/stm32f10x_dac.o \
./src/stm32f10x_dbgmcu.o \
./src/stm32f10x_dma.o \
./src/stm32f10x_exti.o \
./src/stm32f10x_flash.o \
./src/stm32f10x_fsmc.o \
./src/stm32f10x_gpio.o \
./src/stm32f10x_i2c.o \
./src/stm32f10x_iwdg.o \
./src/stm32f10x_pwr.o \
./src/stm32f10x_rcc.o \
./src/stm32f10x_rtc.o \
./src/stm32f10x_sdio.o \
./src/stm32f10x_spi.o \
./src/stm32f10x_tim.o \
./src/stm32f10x_usart.o \
./src/stm32f10x_wwdg.o 

C_DEPS += \
./src/misc.d \
./src/stm32f107.d \
./src/stm32f10x_adc.d \
./src/stm32f10x_bkp.d \
./src/stm32f10x_can.d \
./src/stm32f10x_cec.d \
./src/stm32f10x_crc.d \
./src/stm32f10x_dac.d \
./src/stm32f10x_dbgmcu.d \
./src/stm32f10x_dma.d \
./src/stm32f10x_exti.d \
./src/stm32f10x_flash.d \
./src/stm32f10x_fsmc.d \
./src/stm32f10x_gpio.d \
./src/stm32f10x_i2c.d \
./src/stm32f10x_iwdg.d \
./src/stm32f10x_pwr.d \
./src/stm32f10x_rcc.d \
./src/stm32f10x_rtc.d \
./src/stm32f10x_sdio.d \
./src/stm32f10x_spi.d \
./src/stm32f10x_tim.d \
./src/stm32f10x_usart.d \
./src/stm32f10x_wwdg.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Os -ffunction-sections -flto -Wunused -Wuninitialized -Wall  -g -DUSE_STDPERIPH_DRIVER -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\ETH_Options\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include\ipv4" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\cmsis" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32_ETH_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\STM32F107_BSP_Driver\inc" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\port" -I"F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\lwip-1.4.1\src\include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


