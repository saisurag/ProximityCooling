#include "xpt2046.h"
#include "intrins.h"

void xpt2046_wirte_data(u8 dat)
{
	u8 i;

	CLK = 0;
	_nop_();
	for(i=0;i<8;i++)//repeat 8 times for a byte
	{
		DIN = dat >> 7;//MSB first
		dat <<= 1;//shift after one transfer
		CLK = 0;//generate a rising edge on CLK to write data_
		_nop_();	
		CLK = 1;
		_nop_();
	}
}

/*******************************************************************************
*: xpt2046_read_data
*******************************************************************************/
u16	xpt2046_read_data(void)
{
	u8 i;
	u16 dat=0;

	CLK = 0;
	_nop_();
	for(i=0;i<12;i++)//repeat for 12 times for 12-bit_ data_ reading
	{
		dat <<= 1;
		CLK = 1;
		_nop_();
		CLK = 0; //generate a falling edge on CLK to read data_
		_nop_();
		dat |= DOUT;//read MSB first
	}
	return dat;	
}

/*******************************************************************************
*xpt2046_read_adc_value
********************************************************************************/
u16 xpt2046_read_adc_value(u8 cmd)
{
	u8 i;
	u16 adc_value=0;

	CLK = 0;//clock low
	CS  = 0;//chip select
	xpt2046_wirte_data(cmd);//send a command
	for(i=6; i>0; i--);//delay for a while for the conversion
	CLK = 1;
	_nop_();
	CLK = 0;//clear the busy flag
	_nop_();
	adc_value=xpt2046_read_data();
	CS = 1;//deselect the chip
	return adc_value;
}
