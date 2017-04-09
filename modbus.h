/*
* modbus.h
 *
 *  Created on: 17 янв. 2017 г.
 *      Author: misaka10032
 */

#ifndef MODBUS_H_
#define MODBUS_H_

#include "modbus_types.h"

typedef enum
{
	MODBUS_RTU 				= 0x01,
	MODBUS_TCP 				= 0x02,
	MODBUS_TCP_MAX_ADU_SIZE = 260,
	MODBUS_RTU_MAX_ADU_SIZE = 256,
	MODBUS_MAX_ADU_SIZE 	= 260,
	MODBUS_MAX_DATA_SIZE 	= 253,
	MODBUS_USER_FUNCTION_FIRST_MIN = 65,
	MODBUS_USER_FUNCTION_FIRST_MAX = 72,
	MODBUS_USER_FUNCTION_SECOND_MIN = 100,
	MODBUS_USER_FUNCTION_SECOND_MAX = 110,
} ModbusCommonParam;

typedef enum
{
	MODBUS_RTU_PARITY_NONE,
	MODBUS_RTU_PARITY_EVEN,
	MODBUS_RTU_PARITY_ODD,
	MODBUS_RTU_STOP_ONE,
	MODBUS_RTU_STOP_ONE_POINT_FIVE,
	MODBUS_RTU_STOP_TWO,
} ModbusRTUParam;


typedef enum
{
	MODBUS_READ_COILS 					 = 0x01,
	MODBUS_READ_DISCRETE_INPUTS 		 = 0x02,
	MODBUS_READ_HOLDING_REGISTERS 		 = 0x03,
	MODBUS_READ_INPUT_REGISTERS 		 = 0x04,
	MODBUS_WRITE_SINGLE_COIL 			 = 0x05,
	MODBUS_WRITE_SINGLE_REGISTERS 		 = 0x06,
	MODBUS_WRITE_MULTIPLE_COILS 		 = 0x0F,
	MODBUS_WRITE_MULTIPLE_REGISTERS 	 = 0x10,
	MODBUS_REPORT_SERVER_ID 			 = 0x11,		//Serial Line only
	MODBUS_READ_WRITE_MULTIPLE_REGISTERS = 0x17
} ModbusStandartFunction;

typedef enum
{
	MODBUS_ILLEGAL_FUNCTION 						= 0x01,
	MODBUS_ILLEGAL_DATA_ADDRESS 					= 0x02,
	MODBUS_ILLEGAL_DATA_VALUE 						= 0x03,
	MODBUS_SEVER_DEVICE_FAILURE 					= 0x04,
	MODBUS_ACKNOWLEDGE								= 0x05,
	MODBUS_SERVER_DEVICE_BUSY 						= 0x06,
	MODBUS_MEMORY_PARITY_ERROR 						= 0x08,
	MODBUS_GATEWAY_PATH_UNAVAILABLE 			    = 0x0A,
	MODBUS_GATEWAY_TARGET_DEVICE_FAILED_TO_RESPOND  = 0x0B,
} ModbusErrorCode;

typedef enum
{
	MODBUS_COIL_MAX_READ 		  = 0x07D0,
	MODBUS_COIL_MAX_WRITE 		  = 0x07B0,
	MODBUS_COIL_MIN_START_ADDRESS = 0x0000,
	MODBUS_COIL_MAX_START_ADDRESS = 0xFFFF,
} ModbusCoilParam;

typedef enum
{
	MODBUS_HOLDING_REGISTER_MAX_READ		  = 0x007D,
	MODBUS_HOLDING_REGISTER_MAX_WRITE 		  = 0x007B,
	MODBUS_HOLDING_REGISTER_MIN_START_ADDRESS = 0x0000,
	MODBUS_HOLDING_REGISTER_MAX_START_ADDRESS = 0xFFFF,
} ModbusHoldingRegisterParam;

typedef enum
{
	MODBUS_DISCRETE_INPUT_MAX_READ 		    = 0x07D0,
	MODBUS_DISCRETE_INPUT_MIN_START_ADDRESS = 0x0000,
	MODBUS_DISCRETE_INPUT_MAX_START_ADDRESS = 0xFFFF,
} ModbusDiscreteInputParam;

typedef enum
{
	MODBUS_INPUT_REGISTER_MAX_READ 			= 0x007D,
	MODBUS_INPUT_REGISTER_MIN_START_ADDRESS = 0x0000,
	MODBUS_INPUT_REGISTER_MAX_START_ADDRESS = 0xFFFF,
} ModbusInputRegisterParam;

typedef struct
{
	u8_t  data[MODBUS_MAX_ADU_SIZE];
	u16_t length;
	u8_t  protocol;
} ModbusADU;

typedef struct
{
	u8_t  protocol;
	u8_t  functionCode;
	u16_t startAddress;
	u16_t quantityOfCoils;
	u16_t quantityOfInputs;
	u16_t quantityOfRegister;
	u16_t byteCount;
	u8_t  data[MODBUS_MAX_DATA_SIZE];
} ModbusPDU;

typedef struct
{
	u16_t transactionID;
	u16_t protocolID;
	u16_t length;
	u8_t slaveAddress;
} ModbusMBAP;

typedef struct
{
	u8_t  slaveAddress;
	u32_t baudrate;
	u8_t  stop;
	u8_t  parity;
} ModbusRTU_InitTypeDef;

typedef int (*modbus_user_func_process)(ModbusPDU* pdu);

typedef struct
{
	u8_t functionCode;
	modbus_user_func_process processFunction;
} ModbusFunction;

/*typedef struct
{
	ModbusUserFunction ModbusUserFunction_List[4];
	u16_t lengthList;
} ModbusFunction_ListTypeDef;*/


ModbusFunction ModbusFunction_List[4];
ModbusRTU_InitTypeDef ModbusRTU_InitStructure;


#endif /* MODBUS_H_ */
