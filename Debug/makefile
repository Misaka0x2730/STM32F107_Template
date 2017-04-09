################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include startup/subdir.mk
-include src/subdir.mk
-include lwip-1.4.1/src/netif/ppp/subdir.mk
-include lwip-1.4.1/src/netif/subdir.mk
-include lwip-1.4.1/src/core/snmp/subdir.mk
-include lwip-1.4.1/src/core/ipv4/subdir.mk
-include lwip-1.4.1/src/core/subdir.mk
-include lwip-1.4.1/src/api/subdir.mk
-include lwip-1.4.1/port/subdir.mk
-include cmsis/subdir.mk
-include STM32_ETH_Driver/src/subdir.mk
-include STM32F107_BSP_Driver/src/subdir.mk
-include ETH_Options/src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
STM32F107_Template.hex \

SECONDARY_SIZE += \
STM32F107_Template.siz \


# All Target
all: STM32F107_Template.elf secondary-outputs

# Tool invocations
STM32F107_Template.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross ARM C Linker'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -ffunction-sections -Wunused -Wuninitialized -Wall  -g3 -ggdb -T "F:\ARM\STM32 Eclipse Firmware\STM32F107_Template\startup\gcc_arm.ld" -nostartfiles -Xlinker --gc-sections -Wl,-Map,"STM32F107_Template.map" -o "STM32F107_Template.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

STM32F107_Template.hex: STM32F107_Template.elf
	@echo 'Invoking: Cross ARM GNU Create Flash Image'
	arm-none-eabi-objcopy -O ihex "STM32F107_Template.elf"  "STM32F107_Template.hex"
	@echo 'Finished building: $@'
	@echo ' '

STM32F107_Template.siz: STM32F107_Template.elf
	@echo 'Invoking: Cross ARM GNU Print Size'
	arm-none-eabi-size --format=berkeley "STM32F107_Template.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) STM32F107_Template.elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_SIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
