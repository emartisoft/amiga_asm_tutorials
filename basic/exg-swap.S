start:
	move.l #$00001122,d0
	move.l #$33440000,d1

	exg d0,d1	;d0 ve d1 degerlerini birbirine degistir
	swap d0		;d0=$00003344 olur
			;swap sadece data register ile kullanilir	

	rts

