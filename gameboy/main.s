;
; An empty ROM that sits forever at the logo screen sounding a tone.
; Works on a real GameBoy.
;

;----------------------------------------------------------------------
; includes
;----------------------------------------------------------------------
.include "cart.i"

;----------------------------------------------------------------------
; rst vectors
;----------------------------------------------------------------------
.ORG $0
		nop
.ORG $8
		nop
.ORG $10
		nop
.ORG $18
		nop
.ORG $20
		nop
.ORG $28
		nop
.ORG $30
		nop
.ORG $38
		nop

;----------------------------------------------------------------------
; interrupt vectors
;----------------------------------------------------------------------
.bank 0 slot 0
.org $40	;vbi
		jp	$c000
.org $48	;lcdff41i
		jp	$c003
.org $50	;timeri
		jp	$c006
.org $58	;seriali
		jp	$c009
.org $60	;joypadi
		jp	$c00c

;----------------------------------------------------------------------
; entry point
;----------------------------------------------------------------------
.org $100
		nop
		jp	main
		; cart header occupies $104..$149

;----------------------------------------------------------------------
; global variables
;----------------------------------------------------------------------

.enum $c010
foo		db
bar		db
.ende

.define baz	$c100
.define qux	$c110

;----------------------------------------------------------------------
; main
;----------------------------------------------------------------------
.org $150

main:		di
		ld	sp, $FFFE
		
		; Make a sound.
		ld	a,$80
		ldh	(R_NR52),a
		ld	a,$00
		ldh	(R_NR11),a
		ld	a,$f0
		ldh	(R_NR12),a
		ld	a,$1a
		ldh	(R_NR13),a
		ld	a,$87
		ldh	(R_NR14),a
		ld	a,$77
		ldh	(R_NR50),a
		ld	a,$ff
		ldh	(R_NR51),a

forever:	halt
		nop
		jp	forever
