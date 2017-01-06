start:
	;bcc.s <label>
	;bcc.w <label>
	;s ve w suffix
	;s (short range) -128,+127 byte
	;w (word range) -32768,+32767 byte

	;bcc.l <label> supports only 68020+

	moveq #$04,d0

loop:
	;bazi kodlar yazilabilir
	
	dbeq d0,loop	;d0 0 degilse degeri 1 azalt ve dallan
			;d0 0 ise sonraki komuta gecilir
			;islem sonucu d0=$ffff olur

	move.l d0,value
		
waitclick:
	btst #6,$bfe001		;mouse click bekler
	bne.s waitclick
	rts

value: dc.l 0	
			
