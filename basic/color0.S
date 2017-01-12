start:
	move.w #$ffff,d0		;sayaç içn d0=65535
loop:
	move.w $dff006,$dff180	;dff180'e dff006'daki değeri ata
	dbra d0,loop			;d0 0 olana kadar 1 azalt ve loop'a dallan
	rts						;program sonu

