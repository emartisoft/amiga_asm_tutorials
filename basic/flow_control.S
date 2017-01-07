*
*Flags
*=====
*X N Z V C
*- - - - -*
*
*Flow Control Instructions*
*		Branch is taken if the ...
*bcc		carry (c) bit is 0 (carry clear)
*bcs		carry (c) bit is 1 (carry set)
*beq		zero (Z) bit 1 (equal)
*bne 		zero (Z) bit 0 (not equal)
*bpl		negative (N) bit is 0 (plus)
*bmi		negative (N) bit is 1 (minus)
*bvc		Overflow (V) bit is 0 (Overflow Clear)
*bvs		Overflow (V) bit is 1 (Overflow Set)
*bge		N and V bits same value, N=V (greater or equal)
*bgt		N=1 V=1 and Z=0 or N=V=Z=0 (greater than)
*ble		Z=1 or N and V bits contains different (lower equal)
*blt		N and V bit different (less than)
*bhi		N and V bit same values (higher)
*bls		C and Z bit different (lower same)
*bra		branch always
*bsr 		branch subroutine (like jsr)
*

start:
	clr.l	d2
	clr.l	d3
	clr.l	d1
	clr.l	d5
	moveq	#$05,d1
	moveq	#$02,d2
	moveq	#$03,d3
	cmp.l	d2,d3
	ble	L1
	beq	L2
	bge	L3
	rts
		
L1:
	move.l 	#$01,d5
	bra	exit
L2:
	move.l 	#$02,d5
	bra	exit
L3:
	move.l	#$03,d5
	bra	exit
exit:
	rts
