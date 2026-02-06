#ifndef _xpt2046_H
#define _xpt2046_H

#include "public.h"

//pin definition
sbit DOUT = P3^7;	  //output
sbit CLK  = P3^6;	  //clock
sbit DIN  = P3^4;	  //input
sbit CS   = P3^5;	  //chip select


//function declaration
u16 xpt2046_read_adc_value(u8 cmd);

#endif