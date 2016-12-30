start:
			;load effective address lea
	lea src,a1	;a1 e src adresini yukler
	move.l #src,a2	;yukaridaki komutun aynisidir
			;a1=a2
src:
	dc.b 'emarti',0
target:
	dc.b 0,0,0,0,0,0
	
