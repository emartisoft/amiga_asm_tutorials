start:

	move.l #$11223344,d0	;d0=$11223344
	clr.w d0		;d0=$11220000
	swap d0			;d0=$00001122

	moveq #$11,d2		;d2=$00000011	
	sub.l d2,d0		;d0=$00001111

	move.l d0,a1		;a1=$00001111	

	move.l (adres),d1 	;d1=$55667788
	move.l (adres)+2,d3	;d3=$778899aa
	

	move.l #adres,a0	;a0=adres
	move.l (a0),d0		;d0=$55667788, a0=adres
	move.l (a0)+,d0		;d0=$55667788, a0=adres+4
	move.l -(a0),d0		;d0=$55667788, a0=adres

	clr.l d0		;d0=$00000000
	move.b 3(a0),d0		;d0=$00000088

	moveq #1,d5		;d5=$00000001
	move.l 2(a0,d5.l),d0	;d0=$8899aaff

	rts

	EVEN			;gerekirse 1 byte atla ve
				;sonraki adresi cift yap
	
adres:
	dc.l $55667788
	dc.w $99aa
	dc.b $ff
