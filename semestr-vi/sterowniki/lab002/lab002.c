#define F_CPU 16000000L

#include <stdlib.h>
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

#define SET(port, pin) port |= _BV(pin)
#define CLR(port, pin) port &= ~_BV(pin)
#define NEG(port, pin) port ^= _BV(pin)

// inicjacja timera
void timer_init(void){
    TCCR1B |= _BV(CS12); // | _BV(CS10);
}

void led_init(void){
    // Ustawienie DDRB jako wejscie
    DDRB = 0xFF;
}

// miganie diody
void led_toggle(void){
    NEG(PORTB, PB5);
}

// zad1ie czasu za pomoca zwyklego porownania if
void timer1_example(void){
    while(1){
        if(TCNT1 > 65000){
            led_toggle();
            TCNT1 = 0;
        }
    }
}
// zad2 odmieranie czasu za pomoca operacji AND
void timer2_example(void){
    while(1){
        if(TIFR1 & _BV(TOV1)){
            led_toggle();
            TCNT1 = 0;
            SET(TIFR1, TOV1);
        }
    }
}

// zad3 Odmierzanie czasu za pomoca porownan z wartociami OCR
void timer3_example(void){
    TCCR1A |= _BV(COM1A1) | _BV(COM1A0);

    OCR1A = 0xFFFF / 8;
    OCR1B = 0xFFFF / 4;

    while(1){
        if(TIFR1 & _BV(TOV1)){
            led_toggle();
            TCNT1 = 0;
            SET(TIFR1, TOV1);
        }

        if(TIFR1 & _BV(OCF1A)){
            led_toggle();
            SET(TIFR1, OCF1A);
            SET(TIFR1, TOV1);
        }
    }
}

ISR (TIMER1_OVF_vect){
    led_toggle();
}

// zad4 Odmierzanie czasu za pomoca przerwan
void timer4_example(void){
    SET(TIMSK1, TOIE1);
}


int main(void){
    led_init();
    timer_init();

    timer4_example();

    sei();
    while(1){};
}
