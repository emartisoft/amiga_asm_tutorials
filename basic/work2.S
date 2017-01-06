;beginner

NULL	EQU	0
TRUE	EQU	1
SPACE	EQU	$20

start:
	move.l #0,d0	;d0=$00000000
	move.b d0,d4	;d4=$XXXXXX00 X=herhangi bir deger
	move.l #SPACE,X	;X adresine $20 degerini long olarak kopyala
	move.l #NULL,Y	;Y adresine 0 degerini long olarak kopyala
	move.l X,Z	;X adres icerigini Z adres icerigine kopyala

	move.l #$11223344,X
	movea.w X,a0	
	move.w a0,Y
	move.w X,a1
	move.w a1,Z

	move.l #$FFFF0000,d0	;d0=$FFFF0000
	not.w d0		;d0=$FFFFFFFF d0 icin dusuk 8 bit invert
	add.l #1,d0		;d0=d0 + $00000001
				;d0=$00000000
	move.l d0,X		;X adres icerigi d0 olsun ($00000000)
	addi.l #1,X		;X icerigi $00000001
	add.l #1,X		;X icerigi $00000002

	move.l #X,a2		;a2 registerine X adres degerini yukle
	move.l #X,a3		;ayni degeri a3 e yukle	
	add.l #4,(a2)		;a2 registerinin isaret ettigi adres icerigine
				;4 ekle
				;X adres icerigi $00000006

				; bu islemler soyle de yapilabilir
	lea X,a2
	lea X,a3
	add.l #4,(a2)		;X adres icerigi $0000000a
	
	
exit:	 
	rts

X:	dc.l	$10
Y:	dc.l	$0a
Z:	dc.l	$00	
