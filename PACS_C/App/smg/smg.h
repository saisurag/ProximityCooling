#ifndef _smg_H
#define _smg_H

#include "public.h"


#define SMG_A_DP_PORT	P0	//port for the 7-segment display

//select control
sbit LSA=P2^2;
sbit LSB=P2^3;
sbit LSC=P2^4;

extern u8 gsmg_code[17];

void smg_display(u8 dat[],u8 pos);

#endif