start:
	nop
	nop
	nop

waitclick:

	btst #6,$bfe001		;mouse sol tusa basana kadar bekle
	bne.s waitclick
	rts
		
