#include "stm32f10x_conf.h"
#include "stm32f107.h"
#include "stm32f107_eth_bsp.h"
#include "modbus.h"
#include "lwip/tcp.h"
#include "netif/etharp.h"

int main()
{
	unsigned int i = 0;
	__enable_irq();

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD, ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);

	ETH_BSP_Config();
	LwIP_Init();

	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12|GPIO_Pin_13;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_Init(GPIOD, &GPIO_InitStructure);

	while(1)
	{
		GPIO_SetBits(GPIOD, GPIO_Pin_13);
		delay_ms(500);
		GPIO_SetBits(GPIOD, GPIO_Pin_12);
		delay_ms(500);
		GPIO_ResetBits(GPIOD, GPIO_Pin_13);
		delay_ms(500);
		GPIO_ResetBits(GPIOD, GPIO_Pin_12);
		delay_ms(500);
		tcp_tmr();
		etharp_tmr();
	}
}

void HardFault_Handler(void)
{
  /* Go into an infinite loop. */
	GPIO_ResetBits(GPIOD, GPIO_Pin_13);
  while (1)
  {
  }
}
