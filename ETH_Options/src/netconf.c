/**
  ******************************************************************************
  * @file    netconf.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    31-October-2011
  * @brief   Network connection configuration
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; Portions COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include "lwip/memp.h"
#include "ethernetif.h"
#include "lwip/tcp.h"
#include "netif/etharp.h"
#include "netconf.h"
#include "stm32f107_eth_bsp.h"
#include "stm32_eth.h"
#include "lwip/tcp_impl.h"

void ETH_CheckLink()
{
	u16_t link = ETH_ReadPHYRegister(PHY_ADDRESS, PHY_BSR);
	if(link != ETH_ERROR)
	{
		if(!(link & PHY_Linked_Status))
		  netif_set_link_down(&xnetif);
		if((link & PHY_Linked_Status) && (!netif_is_link_up(&xnetif)))
		{
			ETH_WaitLink();
		   netif_set_link_up(&xnetif);
		}
	}
}

void ETH_Timers()
{
	static u8_t i = 0;
	tcp_tmr();

	if(i == (ARP_TMR_INTERVAL/TCP_TMR_INTERVAL))
	{
		etharp_tmr();
		i = 0;
	}
	delay_ms(TCP_TMR_INTERVAL);
	i++;
}
/**
  * @brief  Initializes the lwIP stack
  * @param  None
  * @retval None
  */
void LwIP_Pkt_Handle(void)
{
  /* Read a received packet from the Ethernet buffers and send it to the lwIP for handling */
  ethernetif_input(&xnetif);
}

void lwip_link_callback(struct netif *netif )
{
	 if (netif_is_link_up(netif))
	 {
		 ETH_WaitLink();
		 netif_set_up(netif);
	 }
	 else
		 netif_set_down(netif);
}

void LwIP_Init()
{
	struct ip_addr ipaddr;
	struct ip_addr netmask;
	struct ip_addr gw;
	uint8_t macaddress[6]={0x00, 0x24, 0xB5, 0x86, 0x79, 0x53};
	/* Initializes the dynamic memory heap defined by MEM_SIZE.*/
	mem_init();

	/* Initializes the memory pools defined by MEMP_NUM_x.*/
	memp_init();

	Set_MAC_Address(macaddress);

	IP4_ADDR(&ipaddr,  192, 168,   0,  88);
	IP4_ADDR(&netmask, 255, 255, 255,   0);
	IP4_ADDR(&gw,      192, 168,   0,   1);

	/*
	Adds your network interface to the netif_list. Allocate a struct
	netif and pass a pointer to this structure as the first argument.
	Give pointers to cleared ip_addr structures when using DHCP,
	or fill them with sane numbers otherwise. The state pointer may be NULL.

	The init function pointer must point to a initialization function for
	your ethernet netif interface. The following code illustrates it's use.*/

	netif_add(&xnetif, &ipaddr, &netmask, &gw, NULL, &ethernetif_init, &ethernet_input);
	/*  Registers the default network interface. */
	netif_set_default(&xnetif);
	//netif_set_link_callback(&xnetif, lwip_link_callback);
}

