.include "m328pdef.inc"

	.cseg
	.org 	0x00
	.def	numA = r16
	.def	numB = r17
	.def	mask = r18

	ldi	mask,0xFF
	out     DDRD,mask
	ldi	mask,0x00
        out     DDRC,mask
	ldi	mask,0x00
        out     DDRB,mask

loop:	in	numA, PINB
	ldi	mask, 0x0F
	and	numA, mask
	in	numB, PINC
	ldi	mask, 0x0F
	and	numB, mask
	add	numA, numB
	call	zero

zero:	ldi	mask, 0x00
	cp	numA, mask
	brne	one
	ldi	mask,0x40
	out	PORTD,mask
	rjmp	loop


one:	ldi	mask, 0x01
	cp	numA, mask
	brne	two
	ldi	mask,0xF9
	out	PORTD,mask
	rjmp	loop


two:	ldi	mask, 0x02
	cp	numA, mask
	brne	three
	ldi	mask,0xA4
	out	PORTD,mask
	rjmp	loop


three:	ldi	mask, 0x03
	cp	numA, mask
	brne	four
	ldi	mask,0xB0
	out	PORTD,mask
	rjmp	loop


four:	ldi	mask, 0x04
	cp	numA, mask
	brne	five
	ldi	mask,0x99
	out	PORTD,mask
	rjmp	loop


five:	ldi	mask, 0x05
	cp	numA, mask
	brne	six
	ldi	mask,0x92
	out	PORTD,mask
	rjmp	loop


six:	ldi	mask, 0x06
	cp	numA, mask
	brne	seven
	ldi	mask,0x82
	out	PORTD,mask
	rjmp	loop


seven:	ldi	mask, 0x07
	cp	numA, mask
	brne	eight
	ldi	mask,0xF8
	out	PORTD,mask
	rjmp	loop


eight:	ldi	mask, 0x08
	cp	numA, mask
	brne	nine
	ldi	mask,0x00
	out	PORTD,mask
	rjmp	loop


nine:	ldi	mask, 0x09
	cp	numA, mask
	brne	ten
	ldi	mask,0x90
	out	PORTD,mask
	rjmp	loop


ten:	ldi	mask, 0x0A
	cp	numA, mask
	brne	eleven
	ldi	mask,0x88
	out	PORTD,mask
	rjmp	loop


eleven:	ldi	mask, 0x0B
	cp	numA, mask
	brne	twelve
	ldi	mask,0x83
	out	PORTD,mask
	rjmp	loop


twelve:	ldi	mask, 0x0C
	cp	numA, mask
	brne	thirteen
	ldi	mask,0xC6
	out	PORTD,mask
	rjmp	loop


thirteen:   ldi	    mask, 0x0D
	    cp	    numA, mask
	    brne    fourteen
	    ldi	    mask,0xA1
	    out	    PORTD,mask
	    rjmp    loop


fourteen:   ldi	    mask, 0x0E
	    cp	    numA, mask
	    brne    fifteen
	    ldi	    mask,0x86
	    out	    PORTD,mask
	    rjmp    loop


fifteen:    ldi	    mask, 0x0F
	    cp	    numA, mask
	    brne    carry
	    ldi	    mask,0x8E
	    out	    PORTD,mask
	    rjmp    loop
	
carry:	ldi	mask, 0xB6
	out	PORTD,mask
	rjmp	loop