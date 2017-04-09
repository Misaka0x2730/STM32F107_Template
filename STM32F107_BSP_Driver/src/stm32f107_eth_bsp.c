#include "stm32f107.h"
#include "stm32_eth.h"
#include "stm32f107_eth_bsp.h"

__IO uint32_t EthInitStatus = 0;

u32 ETH_BSP_Config(void)
{
  ETH_GPIO_Config();
  ETH_NVIC_Config();
  ETH_MACDMA_Config();
  ETH_WaitLink();
  return EthInitStatus;
}

void ETH_GPIO_Config(void)
{
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOC | RCC_APB2Periph_AFIO, ENABLE);

	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_12 | GPIO_Pin_13;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_Init(GPIOC, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_14;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_7;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4 | GPIO_Pin_5;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOC, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_14;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	GPIO_ResetBits(GPIOB, GPIO_Pin_14);
	delay_ms(100);
	GPIO_SetBits(GPIOB, GPIO_Pin_14);
	delay_ms(100);
}

void ETH_MACDMA_Config(void)
{
	ETH_InitTypeDef ETH_InitStructure;
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_ETH_MAC | RCC_AHBPeriph_ETH_MAC_Tx | RCC_AHBPeriph_ETH_MAC_Rx, ENABLE);

	GPIO_ETH_MediaInterfaceConfig(GPIO_ETH_MediaInterface_RMII);

	ETH_DeInit();                                                 /* Reset ETHERNET on AHB Bus */
	ETH_SoftwareReset();                                          /* Software reset */
	while (ETH_GetSoftwareResetStatus() == SET);                  /* Wait for software reset */

	/* ETHERNET Configuration ------------------------------------------------------*/
	ETH_StructInit(&ETH_InitStructure);

	/* Fill ETH_InitStructure parameters */
	/*------------------------   MAC   -----------------------------------*/
	ETH_InitStructure.ETH_AutoNegotiation = ETH_AutoNegotiation_Enable;
	ETH_InitStructure.ETH_LoopbackMode = ETH_LoopbackMode_Disable;
	ETH_InitStructure.ETH_RetryTransmission = ETH_RetryTransmission_Disable;
	ETH_InitStructure.ETH_AutomaticPadCRCStrip = ETH_AutomaticPadCRCStrip_Disable;
	ETH_InitStructure.ETH_ReceiveAll = ETH_ReceiveAll_Disable;
	ETH_InitStructure.ETH_BroadcastFramesReception = ETH_BroadcastFramesReception_Enable;
	ETH_InitStructure.ETH_PromiscuousMode = ETH_PromiscuousMode_Disable;
	ETH_InitStructure.ETH_MulticastFramesFilter = ETH_MulticastFramesFilter_Perfect;
	ETH_InitStructure.ETH_UnicastFramesFilter = ETH_UnicastFramesFilter_Perfect;
	#ifdef CHECKSUM_BY_HARDWARE
	ETH_InitStructure.ETH_ChecksumOffload = ETH_ChecksumOffload_Enable;
	#endif

	/*------------------------   DMA   -----------------------------------*/

	/* When we use the Checksum offload feature, we need to enable the Store and Forward mode:
	the store and forward guarantee that a whole frame is stored in the FIFO, so the MAC can insert/verify the checksum,
	if the checksum is OK the DMA can handle the frame otherwise the frame is dropped */
	ETH_InitStructure.ETH_DropTCPIPChecksumErrorFrame = ETH_DropTCPIPChecksumErrorFrame_Enable;
	ETH_InitStructure.ETH_ReceiveStoreForward = ETH_ReceiveStoreForward_Enable;
	ETH_InitStructure.ETH_TransmitStoreForward = ETH_TransmitStoreForward_Enable;

	ETH_InitStructure.ETH_ForwardErrorFrames = ETH_ForwardErrorFrames_Disable;
	ETH_InitStructure.ETH_ForwardUndersizedGoodFrames = ETH_ForwardUndersizedGoodFrames_Disable;
	ETH_InitStructure.ETH_SecondFrameOperate = ETH_SecondFrameOperate_Enable;
	ETH_InitStructure.ETH_AddressAlignedBeats = ETH_AddressAlignedBeats_Enable;
	ETH_InitStructure.ETH_FixedBurst = ETH_FixedBurst_Enable;
	ETH_InitStructure.ETH_RxDMABurstLength = ETH_RxDMABurstLength_32Beat;
	ETH_InitStructure.ETH_TxDMABurstLength = ETH_TxDMABurstLength_32Beat;
	ETH_InitStructure.ETH_DMAArbitration = ETH_DMAArbitration_RoundRobin_RxTx_2_1;

	EthInitStatus = ETH_Init(&ETH_InitStructure, PHY_ADDRESS);

	ETH_DMAITConfig(ETH_DMA_IT_NIS | ETH_DMA_IT_R, ENABLE);
}

void ETH_NVIC_Config(void)
{
  NVIC_InitTypeDef   NVIC_InitStructure;

  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
  
  NVIC_InitStructure.NVIC_IRQChannel = ETH_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 2;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);    
}

u8_t ETH_WaitLink(void)
{
	unsigned int timeout = 0;
	unsigned int RegValue = 0;
	unsigned int tmp = 0;
	ETH_InitTypeDef ETH_InitStruct;
	ETH_InitStruct.ETH_AutoNegotiation = ETH_AutoNegotiation_Enable;
	ETH_InitStruct.ETH_Mode  = ETH_Mode_HalfDuplex;
	ETH_InitStruct.ETH_Speed = ETH_Speed_10M;
	if(ETH_InitStruct.ETH_AutoNegotiation != ETH_AutoNegotiation_Disable)
	{
		do
		{
			timeout++;
		} while ((!(ETH_ReadPHYRegister(PHY_ADDRESS, PHY_BSR) & PHY_Linked_Status)) && (timeout < PHY_READ_TO));

	if(timeout == PHY_READ_TO)
		return ETH_ERROR;

	timeout = 0;

	if(!(ETH_WritePHYRegister(PHY_ADDRESS, PHY_BCR, PHY_AutoNegotiation)))
		return 0;

	do
	{
		timeout++;
	} while ((!(ETH_ReadPHYRegister(PHY_ADDRESS, PHY_BSR) & PHY_AutoNego_Complete)) && (timeout < PHY_READ_TO));

	if(timeout == PHY_READ_TO)
		return ETH_ERROR;

	timeout = 0;

	RegValue = ETH_ReadPHYRegister(PHY_ADDRESS, PHY_SR);

	if(RegValue & PHY_Duplex_Status)
		ETH_InitStruct.ETH_Mode = ETH_Mode_FullDuplex;
	else
		ETH_InitStruct.ETH_Mode = ETH_Mode_HalfDuplex;

	if(RegValue & PHY_Speed_Status)
		ETH_InitStruct.ETH_Speed = ETH_Speed_10M;
	else
		ETH_InitStruct.ETH_Speed = ETH_Speed_100M;

	}
	else
	{
		if(!ETH_WritePHYRegister(PHY_ADDRESS, PHY_BCR, ((ETH_InitStruct.ETH_Mode >> 3)|(ETH_InitStruct.ETH_Speed >> 1))))
			return ETH_ERROR;
		delay_ms(100);
	}
	tmp = ETH->MACCR;
	tmp |= (ETH_InitStruct.ETH_Speed | ETH_InitStruct.ETH_Mode);
	ETH->MACCR = tmp;
	return ETH_SUCCESS;
}

