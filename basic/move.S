start:
	move.l #12,d0		;d0=$0000000c
	move.w #$ffff,d1	;d1=$0000ffff

	;d3 registerindeki degisime  dikkat et
	move.l #$11223344,d3	;d3=$11223344
	move.w #$5566,d3	;d3=$11225566
	move.b #$77,d3		;d3=$11225577

	move.l src1,d2		;d2 ye src1 adresindeki degeri yukle
	add.w src2,d2		;d2=d2+src2 adres degeri
	move.b d2,src3		;src3 adresine d2 yi byte olarak yaz		
	rts

src1: dc.l $01
src2: dc.w $02
src3: dc.b $ff

