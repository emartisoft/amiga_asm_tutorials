; Hi Amiga Example
; Not run from WB, run from shell

SysBase			= 4
OpenLibrary		= -552
CloseLibrary		= -414
PutStr			= -948

start:
		lea	DosLib,A1		;dos.library adini string olarak al
		moveq	#36,D0			;kick2.0 ve uzeri icin minimum surum 36 olmali
		movea.l	SysBase,A6
		jsr	OpenLibrary(A6)

		tst.l	D0			;OpenLibrary basarisiz olursa zero
		beq.s	NoDos			;OpenLibrary basarisiz oldugunda dallan

		move.l	#Message,D1		;yazdir
		movea.l	D0,A6			;DosLib A6ya
		jsr	PutStr(A6)

		movea.l	A6,A1			;DOSLib, kutuphaneyi kapat
		movea.l	SysBase,A6
		jsr	CloseLibrary(A6)

NoDos:
		clr.l	D0			;return 0
		rts

DosLib:			
		DC.B	"dos.library",0
Message:			
		DC.B	"Hi Amiga!",10,0
