CALLSYS		MACRO
		move.l a6,-(a7)
		move.l \2,a6
		jsr \1(a6)
		move.l (a7)+,a6
		ENDM