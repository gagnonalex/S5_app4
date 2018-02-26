#include "mbed.h"

DigitalOut led(LED1);
AnalogIn ADC(p16);

const float COEFFS[6] = {6.7965, -9.5149, 11.0775, -7.0173, 2.1136, -0.2425};

int main() {
	float distance = 0.f;
	float tension = 0.0f;
	
	while(1) {
		
		tension = ADC.read();		
		tension *= 3.3;
		
		distance = 	(COEFFS[5] * powf(tension, 5.f)) + (COEFFS[4] * powf(tension, 4.f)) +
								(COEFFS[3] * powf(tension, 3.f)) + (COEFFS[2] * powf(tension, 2.f)) +
								(COEFFS[1] * tension) + COEFFS[0];
		
		distance = 54.f - distance;
		
		printf("La position du bras est de : %f cm\n", distance);
		
		wait_ms(500);
	}
}
