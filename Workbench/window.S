*
* Workbench Window 10 saniye gorunur ve kapatilir
* ASM-One ile wo komutu kullanarak uygulama dosyasi olustur
*
* dos.library acilir
* 	intuition.library acilir
*		intuition screen lock edilir
*			pencere acilir
*				bir sure bekle (10 saniye)
*			pencere kapat
*		intuition screen unlock edilir
*	intuition.library kapat
* dos.library kapat
*


	include macro.i

TRUE		EQU 1
NULL		EQU	0
TIME		EQU 500	;500 tick = 10 saniye
TAG_DONE	EQU 0

WA_BASE		EQU $80000063
WA_LEFT		EQU WA_BASE+$01
WA_TOP		EQU WA_BASE+$02
WA_WIDTH		EQU WA_BASE+$03
WA_HEIGHT		EQU WA_BASE+$04
WA_TITLE		EQU WA_BASE+$0B
WA_DRAGBAR		EQU WA_BASE+$1B
WA_PUBSCREEN		EQU WA_BASE+$16

AbsExecBase	EQU	4
OpenLibrary	EQU	-552
CloseLibrary	EQU	-414
LockPubScreen	EQU -510
UnLockPubScreen	EQU -516
OpenWindowTagList	EQU -606
CloseWindow		EQU -72
Delay 	EQU -198

start:
	movem.l d0-d7/a0-a6,-(a7)	;Put registers on stack
	lea DosName,a1		;dos.library
	moveq #0,d0		;herhangi bir sürümü için

openDos:
	CALLSYS OpenLibrary,AbsExecBase		;yuklenir
	move.l d0,DosBase			;yukleme 0 degil ise sonuc (d0) DosBase'e kaydedilir 
	beq exit				;yukleme basarisiz ise exit'a dallan
	
openIntuition:
	lea IntuitionName,a1		;intuition.library
	moveq #36,d0				;minimum 36 sürümü olarak
	CALLSYS OpenLibrary,AbsExecBase		;yuklenir
	move.l d0,IntuitionBase			;yukleme 0 degil ise sonuc (d0) IntuitionBase'e kaydedilir 
	beq closeDos			;yukleme basarisiz ise closeDos'a dallan
	
lockScreen:
	lea workbench_name,a0
	CALLSYS LockPubScreen,IntuitionBase
	move.l d0,workbench_p
	beq closeIntuition

openWindow:
	move.l #NULL,a0		;Pencere ile ilgili tag yuklemesi
	lea tags,a1
	CALLSYS OpenWindowTagList,IntuitionBase
	move.l d0,window_p
	beq unlockScreen
	
	move.l #TIME,d1			;10 saniye bekle
	CALLSYS Delay,DosBase
	
	move.l window_p,a0			;Pencereyi kapatmak icin parametre girisi
	CALLSYS CloseWindow,IntuitionBase	;Pencereyi kapat
	
unlockScreen:
	move.l #NULL,a0
	move.l workbench_p,a1
	CALLSYS UnLockPubScreen,IntuitionBase
	
closeIntuition:
	move.l IntuitionBase,a1				;intuition.library kapat
	CALLSYS CloseLibrary,AbsExecBase
	
closeDos:
	move.l DosBase,a1			;dos.library kapat
	CALLSYS CloseLibrary,AbsExecBase
	
exit:
	clr.l d0
	movem.l (a7)+,d0-d7/a0-a6	;Get registers from stack
	rts				;program sonu  
	
	EVEN

DosBase	ds.l	1
IntuitionBase	ds.l 	1
window_p	ds.l	1
tags	dc.l 	WA_PUBSCREEN
workbench_p 	ds.l 1
			dc.l WA_LEFT,100
			dc.l WA_TOP,100
			dc.l WA_WIDTH,350
			dc.l WA_HEIGHT,100
			dc.l WA_DRAGBAR,TRUE
			dc.l WA_TITLE,windowName
			dc.l TAG_DONE,NULL
			
DosName	dc.b 'dos.library',NULL
IntuitionName dc.b 'intuition.library',NULL
windowName dc.b 'Pencerem (10 saniye sonra kapanir)',NULL
workbench_name dc.b 'Workbench',NULL

