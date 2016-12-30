;checksum hesaplama
start:
	move.l #0,d0	;d0=0
	move.l #0,d1	;d1=0
	lea data(pc),a0	;datanin adresini a0 a al

loop:
	move.b (a0)+,d1	;a0in gostedigi adresten byte olarak oku ve d1e esitle 
	add.l d1,d0	;d0=d0+d1
	cmp.b #0,d1	;d1 ile 0 karsilastir
	bne.s loop	;d1 0 degilse loopa git

	move.l d0,checksum	;checksum adresine d0 degerini yaz
	rts			;cikis

data:
	dc.b 'emarti',0,$BB,$BB,$BB
	even		;bir sonraki adresi cift yap

checksum:
	dc.l 0,$BBBBBBBB
		
