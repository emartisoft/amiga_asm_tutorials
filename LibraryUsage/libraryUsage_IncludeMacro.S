*
* Amiga Library kullanimi (macro ile)
*

	include macro.i

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

	lea intuitionName,a1		;kutuphane isminini pointer'a yukle
	moveq #0,d0			;herhangi bir surumu olabilir

openlib:
	CALLSYS OpenLibrary,AbsExecBase		;macro
	move.l d0,IntuitionBase		;rutin sonucunu IntuitionBase adresinde
					;sakla yani d0'i
	beq exit			;kutuphane acilmadi ise exit'a dallan
					;d0 0 degilse devam et	

openok:
* DisplayBeep(screenAddress)
* A0 screenAddress

	move.l #0,a0			;screenAddress argumani a0'a yuklenir
	CALLSYS DisplayBeep,IntuitionBase		;macro ile ekranda flash'a neden olur

* CloseLibrary(baseAddress)
* A1 baseAddress

	move.l IntuitionBase,a1		;Intuition.library base adresi	
	CALLSYS CloseLibrary,AbsExecBase		;acik olan kutuphane kapatilir

exit:
	clr.l d0
	rts				;program sonu  

IntuitionBase	ds.l	1
intuitionName	dc.b 'intuition.library',NULL

