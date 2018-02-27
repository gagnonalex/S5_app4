/******************************
Auteurs : Axel Bosco et Alexandre Gagnon
CIPs : bosa2002 et gaga2515
Date : 28 février 2018
Description : Calcul de la distance du niveaumètre en fonction d'une tension analogique en entrée.
******************************/
#include "mbed.h"

DigitalOut led(LED1);
AnalogIn ADC(p16);

const float COEFFS[6] = {6.7965, -9.5149, 11.0775, -7.0173, 2.1136, -0.2425};

int main() {
	float distance = 0.f;
	float tension = 0.f;
	uint16_t lecture = 0;
	
	int n = powf(2.f,16.f) - 1;	// Valeur maximale de 16 bits.
	
	while(1) {
		lecture = ADC.read_u16();
		tension = (lecture * 3.3f ) / n; // Conversion de la lecture 16 bits en tension entre 0 et 3.3 V
		
		distance = 	(COEFFS[5] * powf(tension, 5.f)) + (COEFFS[4] * powf(tension, 4.f)) +
								(COEFFS[3] * powf(tension, 3.f)) + (COEFFS[2] * powf(tension, 2.f)) +
								(COEFFS[1] * tension) + COEFFS[0];
		
		distance = 54.f - distance;
		
		printf("La position du bras est de : %f cm\n", distance);
		
		wait_ms(200);
	}
}
