start:
	move.l	#$00,d0		;d0=$00000000
	move.l	#$04,d1		;d1=$00000004
	lea.l	list,a0		;a0'a list adresini atar

loop:
	add.w	(a0)+,d0	;d0'a a0'in isaret ettigi adres icerigini
				;word olarak ekle
	dbra	d1,loop		;d1 0 olana dek loop'a dallan
				;d1 her dongude 1 azaltilir

	lea.l	sonuc,a0	;a0'a sonuc adresini atar
	move.l	d0,(a0)		;a0'in isaret ettigi adres icerigini d0 yap

	rts			;program sonu

sonuc:
	blk.l	1,0		;1 adres longword olarak 0 blokla
				;ya da 4 byte'lik $00 demek

list:
	dc.w	$2,$4,$6,$8,$a

