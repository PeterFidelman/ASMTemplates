;-----------------------------------------------------------------------
; GameBoy ROM memory map for MBC1-5
;-----------------------------------------------------------------------

; ----- ROM -----

; The GameBoy has two SLOTs (address ranges) through which ROM BANKs are
; viewed.

; $0000..$3FFF:  SLOT 0:  views BANK 0.
; $4000..$7FFF:  SLOT 1:  views BANK 1+, selected at runtime.

.memorymap
defaultslot 0
slot 0 $0000 size $4000	
slot 1 $4000 size $4000	
.endme

; The ROM BANKs.  Two is the bare minimum, yielding banks #0 and #1
; for a total of 32k ROM.  If you need more, increase .ROMBANKS.

.rombanksize $4000
.rombanks 2

; ----- RAM -----

; You get to manage this yourself.  Have fun.

; $8000..$9FFF:  VRAM.
; $A000..$BFFF:  External RAM, if the cart code has "RAM" in it.
;                Not all of this address space is necessarily used.
;                Nonvolatile if the cart code has "BATTERY" in it.
; $C000..$CFFF,
; $D000..$DFFF:  WRAM.  4k + 4k = 8k.
;     ----    
; $FE00..$FE9F:  OAM.  (Sprite Attributes)
;     ----    
; $FF00..$FF7F:  Registers.
; $FF80..$FFFE:  HRAM.  (High RAM)
; $FFFF       :  Interrupt Enable Register

;-----------------------------------------------------------------------
; cart header
;-----------------------------------------------------------------------

.name "NOTHING"
.ramsize 0
.emptyfill $00		; nop
.cartridgetype 1	; mbc1
.licenseecodeold $00
.computechecksum
.computecomplementcheck

; --- DO NOT EDIT BEYOND THIS POINT ---

;-----------------------------------------------------------------------
; the nintendo logo
;-----------------------------------------------------------------------

.bank 0
.org $104

.db $ce $ed $66 $66 $cc $0d $00 $0b $03 $73 $00 $83 $00 $0c $00 $0d
.db $00 $08 $11 $1f $88 $89 $00 $0e $dc $cc $6e $e6 $dd $dd $d9 $99
.db $bb $bb $67 $63 $6e $0e $ec $cc $dd $dc $99 $9f $bb $b9 $33 $3e

;-----------------------------------------------------------------------
; i/o ports ($FE00..$FF7F)
;-----------------------------------------------------------------------

.DEFINE P1    $ff00
.DEFINE SB    $ff01
.DEFINE SC    $ff02
.DEFINE DIV   $ff04
.DEFINE TIMA  $ff05
.DEFINE TMA   $ff06
.DEFINE TAC   $ff07
.DEFINE IF    $ff0f
.DEFINE NR10  $ff10
.DEFINE NR11  $ff11
.DEFINE NR12  $ff12
.DEFINE NR13  $ff13
.DEFINE NR14  $ff14
.DEFINE NR21  $ff16
.DEFINE NR22  $ff17
.DEFINE NR23  $ff18
.DEFINE NR24  $ff19
.DEFINE NR30  $ff1a
.DEFINE NR31  $ff1b
.DEFINE NR32  $ff1c
.DEFINE NR33  $ff1d
.DEFINE NR34  $ff1e
.DEFINE NR42  $ff21
.DEFINE NR43  $ff22
.DEFINE NR44  $ff23
.DEFINE NR50  $ff24
.DEFINE NR51  $ff25
.DEFINE NR52  $ff26
.DEFINE LCDC  $ff40
.DEFINE STAT  $ff41
.DEFINE SCY   $ff42
.DEFINE SCX   $ff43
.DEFINE LY    $ff44
.DEFINE LYC   $ff45
.DEFINE DMA   $ff46
.DEFINE BGP   $ff47
.DEFINE OBP0  $ff48
.DEFINE OBP1  $ff49
.DEFINE WY    $ff4a
.DEFINE WX    $ff4b
.DEFINE IE    $ffff

; same as above, but formatted as offsets from $FF00.
; useful in the "read/write port" cpu instructions.

.DEFINE R_P1    $00
.DEFINE R_SB    $01
.DEFINE R_SC    $02
.DEFINE R_DIV   $04
.DEFINE R_TIMA  $05
.DEFINE R_TMA   $06
.DEFINE R_TAC   $07
.DEFINE R_IF    $0f
.DEFINE R_NR10  $10
.DEFINE R_NR11  $11
.DEFINE R_NR12  $12
.DEFINE R_NR13  $13
.DEFINE R_NR14  $14
.DEFINE R_NR21  $16
.DEFINE R_NR22  $17
.DEFINE R_NR23  $18
.DEFINE R_NR24  $19
.DEFINE R_NR30  $1a
.DEFINE R_NR31  $1b
.DEFINE R_NR32  $1c
.DEFINE R_NR33  $1d
.DEFINE R_NR34  $1e
.DEFINE R_NR42  $21
.DEFINE R_NR43  $22
.DEFINE R_NR44  $23
.DEFINE R_NR50  $24
.DEFINE R_NR51  $25
.DEFINE R_NR52  $26
.DEFINE R_LCDC  $40
.DEFINE R_STAT  $41
.DEFINE R_SCY   $42
.DEFINE R_SCX   $43
.DEFINE R_LY    $44
.DEFINE R_LYC   $45
.DEFINE R_DMA   $46
.DEFINE R_BGP   $47
.DEFINE R_OBP0  $48
.DEFINE R_OBP1  $49
.DEFINE R_WY    $4a
.DEFINE R_WX    $4b
.DEFINE R_IE    $ff
