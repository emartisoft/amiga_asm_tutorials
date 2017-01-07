*
* Ekrana cikti ornegi (shell'den calistir)
* ASM-One ile wo komutu kullanarak uygulama dosyasi olustur
*

	include macro.i

NULL		EQU	0
LF		EQU 	10
AbsExecBase	EQU	4
OpenLibrary	EQU	-552
CloseLibrary	EQU	-414
OutPut		EQU 	-60
Write		EQU 	-48

start:
	lea DosName,a1
	moveq #0,d0

openlib:
	CALLSYS OpenLibrary,AbsExecBase
	move.l d0,DosBase
	beq exit
	
dosopen:
	CALLSYS OutPut,DosBase
	move.l d0,StdOut
	beq closeDos
	
writetext:
	move.l StdOut,d1
	move.l #mesaj1,d2
	move.l #mesaj1_boyut,d3
	CALLSYS Write,DosBase
	
	move.l StdOut,d1
	move.l #mesaj2,d2
	move.l #mesaj2_boyut,d3
	CALLSYS Write,DosBase
	
	move.l StdOut,d1
	move.l #mesaj3,d2
	move.l #mesaj3_boyut,d3
	CALLSYS Write,DosBase	

closeDos:
	move.l DosBase,a1
	CALLSYS CloseLibrary,AbsExecBase
exit:
	clr.l d0
	rts				;program sonu  
	
	EVEN

DosBase	ds.l	1
StdOut	ds.l 	1
DosName	dc.b 'dos.library',NULL

mesaj1	dc.b	'ilk satir',LF
mesaj1_boyut	EQU	*-mesaj1

mesaj2	dc.b	'ikinci satir',LF
mesaj2_boyut	EQU	*-mesaj2

mesaj3	dc.b	'ucuncu satir',LF
mesaj3_boyut	EQU	*-mesaj3
