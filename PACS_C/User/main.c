#ifndef __DELAY_H__
#define __DELAY_H__
#ifndef __MATRIX_LED_H__
#define __MATRIX_LED_H__

#include "public.h"
#include "smg.h"
#include "xpt2046.h"
#include <reg52.h>
#include <stdio.h>
#include <math.h>

#define sound_velocity 34300  	/* sound velocity in cm per second */

#define period_in_us pow(10,-6)
#define Clock_period 1.085*period_in_us		/* period for clock cycle of 8051*/

void Delay(unsigned int xms);
void MatrixLED_Init();
void MatrixLED_ShowColumn(unsigned char Column,Data);

void Delay(unsigned int xms)
{
	unsigned char i, j;
	while(xms--)
	{
		i = 2;
		j = 239;
		do
		{
			while (--j);
		} while (--i);
	}
}



sbit Trigger_pin=P3^5;        	/* Trigger pin */
sbit Echo_pin=P3^3;		/* Echo pin */

sbit SCK=P3^6;		//SRCLK
sbit SER=P3^4;		//SER
sbit motor = P1^0;
sbit k3 = P3^2;

#define MATRIX_LED_PORT		P0

void _74HC595_WriteByte(unsigned char Byte)
{
	unsigned char i;
	for(i=0;i<8;i++)
	{
		SER=Byte&(0x80>>i);
		SCK=1;
		SCK=0;
	}
	Trigger_pin=1;
	Trigger_pin=0;
}

void MatrixLED_Init()
{
	SCK=0;
	Trigger_pin=0;
}

void MatrixLED_ShowColumn(unsigned char Column,Data)
{
	_74HC595_WriteByte(Data);
	MATRIX_LED_PORT=~(0x80>>Column);
	Delay(1);
	MATRIX_LED_PORT=0xFF;
}

void Delay_us()
{
	TL0=0xF5;
	TH0=0xFF;
	TR0=1;
	while (TF0==0);
	TR0=0;
	TF0=0;
}

void init_timer(){
	TMOD=0x01;										/*initialize Timer*/
	TF0=0;
	TR0 = 0;
}

void send_trigger_pulse(){
	Trigger_pin= 1;           	/* pull trigger pin HIGH */
	Delay_us();               	/* provide 10uS Delay*/
	Trigger_pin = 0;          	/* pull trigger pin LOW*/
}

unsigned char code Animation[]={
	0xE7,0xE7,0xE7,0xFF,0xFF,0xE7,0xE7,0xE7,
	0xFE,0xC1,0xC1,0xFE,0xFE,0xC1,0xC1,0xFE,
	0xC3,0xC6,0xCC,0xF8,0xF8,0xCC,0xC6,0xC3,
	0xFF,0xFF,0xFF,0xE7,0xE7,0xE7,0xE7,0xE7,
	0xFF,0xFF,0x18,0xFF,0xFF,0x18,0xFF,0xFF,
	0x84,0xBF,0x9F,0x95,0x9F,0xC4,0xBF,0x84,
};

void main()
{
	float value;
	unsigned char distance_in_cm[10];
	u16 distance_measurement=0;
	u8 buf[4];
	u16 i=0;
	u16 j=0;
	u16 Offset=0;
	u16 Count=0;
	MatrixLED_Init();
	motor = 0;
	for(j=0;j<700;j++) {
		for(i=0;i<8;i++)
		{
			MatrixLED_ShowColumn(i,Animation[i+Offset]);
		}
		Count++;
		if(Count>39)
		{
			Count=0;
			Offset+=8;
			if(Offset>41)
			{
				Offset=0;
			}
		}
	}
	init_timer();			/* Initialize Timer*/
	while(1)
	{		
		
		for(j=0;j<65535;j++) {
		send_trigger_pulse();			/* send trigger pulse of 10us */
    
		while(!Echo_pin);           		/* Waiting for Echo */
		TR0 = 1;                    		/* Timer Starts */
    		while(Echo_pin && !TF0);    		/* Waiting for Echo goes LOW */
    		TR0 = 0;                    		/* Stop the timer */
	  
		/* calculate distance using timer */
		value = Clock_period * sound_velocity; 
		distance_measurement = (TL0|(TH0<<8));	/* read timer register for time count */
		distance_measurement = (distance_measurement*value)/2.0;  /* find distance(in cm) */
			if (distance_measurement < 5) {
				motor = 1;
			}
				
	
		buf[0]=gsmg_code[distance_measurement/1000];
		buf[1]=gsmg_code[distance_measurement%1000/100];
		buf[2]=gsmg_code[distance_measurement%1000%100/10];
		buf[3]=gsmg_code[distance_measurement%1000%100%10];
		smg_display(buf,5);
		}
}
}

//void Int0() interrupt 0
//{
    //motor = ~motor;
//}