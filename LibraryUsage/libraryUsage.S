*
* Amiga Library kullanimi
*

NULL		EQU	0
AbsExecBase	EQU	4
OpenLibrary	EQU	-552
CloseLibrary	EQU	-414
DisplayBeep	EQU	-96

start:
* OpenLibrary(libraryName, version)
* Registers:
* D0 version
* A1 libraryName
* rutin sonucu d0'a aktarilir

	move.l AbsExecBase,a6		;Exec library base adresini al
	lea intuitionName,a1		;kutuphane isminini pointer'a yukle
	moveq #0,d0			;herhangi bir surumu olabilir

openlib:
	jsr OpenLibrary(a6)		;indirekt subrutin cagir
	move.l d0,IntuitionBase		;rutin sonucunu IntuitionBase adresinde
					;sakla yani d0'i
	beq exit			;kutuphane acilmadi ise exit'a dallan
					;d0 0 degilse devam et	

openok:
* DisplayBeep(screenAddress)
* A0 screenAddress

	move.l #0,a0			;screenAddress argumani a0'a yuklenir
	move.l IntuitionBase,a6
	jsr DisplayBeep(a6)		;ekranda flash'a neden olur

* CloseLibrary(baseAddress)
* A1 baseAddress

	move.l AbsExecBase,a6
	move.l IntuitionBase,a1		;Intuition.library base adresi	
	jsr CloseLibrary(a6)		;acik olan kutuphane kapatilir

exit:
	clr.l d0
	rts				;program sonu  

IntuitionBase	ds.l	1
intuitionName	dc.b 'intuition.library',NULL

