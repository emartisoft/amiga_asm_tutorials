start:
	nop
	bsr subroutine1		;subroutine1'e donmek uzere dallan
	rts

subroutine1:
	movem.l d2-d7/a2-a5,-(sp)	;preserve registers
	;bazi kodlar girilir
	movem.l (sp)+,d2-d7/a2-a5	;restore registers
	rts


