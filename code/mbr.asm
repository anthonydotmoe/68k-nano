; vim:noet:sw=8:ts=8:sts=8:ai:syn=asm68k

        include "68000app.inc"

; read the master boot record
        moveq   #0,d0     ; read sector number 0
        moveq   #-1,d1    ; read whole sector
        lea.l   buf,a0
        sys     ReadSector
; print it as a hexdump
        move.l  #512,-(sp) ; number of bytes to dump
        pea     buf        ; start of buffer
        lea.l   fmtstr,a0
        sys     OutFmt
        addq    #8,sp
        sys     Exit

fmtstr: dc.b    FMT_HEXDUMP,"\n",0
	even

buf:    dcb.b   512
	even
