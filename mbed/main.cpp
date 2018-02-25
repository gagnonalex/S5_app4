#include "mbed.h"

DigitalOut led(LED1);

int main() {

	while(1) {
		led = 1;
		wait(1);
		led = 0;
		wait(1);
	}
}
