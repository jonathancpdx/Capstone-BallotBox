#ifndef F_CPU
#define F_CPU 16000000UL // or whatever may be your frequency
#endif

#include <avr/io.h>                    // adding header files
#include <util/delay.h>                // for _delay_ms()

int main(void)
{
   DDRB = 0xFF;                       // setting DDR of PORT C
   while(1)
   {
       // LED on
       PORTB = 0b00100000;            // PC0 = High = LED attached on PC0 is ON
       _delay_ms(500);                // wait 500 milliseconds

       //LED off
       PORTB = 0b00000000;            // PC0 = Low = LED attached on PC0 is OFF
       _delay_ms(500);                // wait 500 milliseconds
   }
}
