#define F_CPU 16000000L

#include <stdlib.h>
#include <avr/io.h>
#include <util/delay.h>

#define SET(port, pin) port |= _BV(pin)
#define CLR(port, pin) port &= ~_BV(pin)
#define RANDSET(port, pin) (rand() > RAND_MAX / 2) ? (SET(port, pin)) : (CLR(port, pin))

int main(void){
    // Ustawienie DDRD jako wyjscie
    DDRD |= _BV(PD2) | _BV(PD3) | _BV(PD4) | _BV(PD5);

    // Ustawienie DDRB jako wejscie
    DDRB = 0x00;
    SET(PORTB, PB0); // pull-up na PB0

    while(1){
        if((PINB & _BV(PB0)) != 0) { // sprawdzenie stanu wejscia PB0
            RANDSET(PORTD, PD2);
            RANDSET(PORTD, PD3);
            RANDSET(PORTD, PD4);
            RANDSET(PORTD, PD5);
            _delay_ms(200);
        }
    }
}
