#include <stdio.h>
#include <avr/io.h>

#include "ltc1257.h"

#define MAX_DAC_VALUE 4095

// TODO define pins with DEFINEs
void heaterInit(void){
	/* IO setup: */
  DDRC = (1 << PC3) | (1 << PC4) | (1 << PC5);  /* LTC1257 pins (output) */
  
  /* Low-level init of DAC: */
  ltc1257_ll_init();
}

void setHeater(uint8_t percent){
	if(percent == 0){
		ltc1257_ll_write(0);
	} else if(percent > 99){
		ltc1257_ll_write(MAX_DAC_VALUE);
	} else {
		uint8_t value = (uint8_t)(((float)MAX_DAC_VALUE * (float)percent)/100.0);
		ltc1257_ll_write(value);
	}
}