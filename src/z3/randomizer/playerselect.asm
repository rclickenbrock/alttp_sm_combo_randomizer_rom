
; Patch save validity checks to only check save 1
; Note that in JP 1.0 the code for Intro_ValidateSram was inline in Bank 0C
Intro_ValidateSram = $0CCCCC ; Bank0C.asm : 1628 (JSL Intro_ValidateSram) / Bank02.asm : 75 (REP #$30)
Intro_ValidateSram_finish = $0CCD45 ; Bank02.asm : 149 (LDX.w #$00FE)
Intro_ValidateSram_delete = $0CCD5B ; Bank02.asm : 166 (LDY.w #$0000 : TYA)
org $0CCCED ; Bank02.asm : 101 (CMP.w #$5A5A : BEQ .prepareNextSlot)
BEQ Intro_ValidateSram_finish
BRA Intro_ValidateSram_delete
org $0CCD8F
BRA Intro_ValidateSram_finish

; Skip Link palette setup for saves 2 and 3
org $1BEFC1 ; palettes.asm : 1221 (LDX.w #$0040)
JMP.w $F009 ; palettes.asm : 1266 (LDY.w #$0000)

org $0CCE0F ; Bank0C.asm : 1880 (LDX $00 : INX #2 : CPX.w #$0006 : BCC .nextFile)
BRA $07 : NOP #7 ; don't draw the other two saves

;
org $0CCE2A
Module_SelectFile_HandleInput:
    LDA $F4 : XBA : LDA $F6
    %a16()
;    BIT #$2C00 : BNE .changeSelection  ; Select, Up, Down
    BIT #$D0C0 : BNE .action           ; Start, A, B, X, Y
    %a8()
    RTL

;.changeSelection
;    %a8()
;    LDA.b #$20 : STA $012F  ; play sound effect
;    ; Alternate between the save 1 (index 0) and erase player (index 4)
;    LDA $C8 : BNE +
;    LDA #$04
;    STA $C8
;    RTL
;+
;    STZ $C8
;    RTL

.action
    %a8()
    LDA.b #$2C : STA $012E  ; play sound effect
;    LDA $C8 : CMP.b #$04 : BEQ .gotoEraseMode
    LDA $BF : BEQ .newGame
.load
    LDA.b #$F1 : STA $012C  ; Fade out music
    %a16()
    LDA $00848C : STA $00   ; get SRAM offset of save 1
    %a8()
    JML Module_SelectFile_loadSram

;.gotoEraseMode
;    LDA.b #$03 : STA $10
;    STZ $11
;    STZ $B0
;    RTL

.newGame
    JML alttp_mw_softreset

padbyte $00 : pad $0CCEB2
warnpc $0CCEB2

