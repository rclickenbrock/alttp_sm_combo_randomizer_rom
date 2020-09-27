;==========================================================
; Samus Data menu
;==========================================================
; Change "SAMUS A" to "SAMUS"
org $C1B436
    dw $202B, $200A, $2026, $202D, $202B, $FFFE ; upper
    dw $203B, $201A, $2036, $2010, $203B, $FFFF ; lower
    dw $0000,$0000,$0000,$0000                  ; unused

; Hide Samus sprites for saves B and C
org $C19D85
    jmp $9D91
org $C19DCC
    jmp $9DE4
org $C1A1D2
    jmp $A1DE

; Don't load or display saves B and C
org $C19F46
    jmp $9FB2

; Fix valid save slots
org $C19FB8
    asl
    rol
    bra $02 : nop #2

; Hide Data Copy option
org $C19FC6
    jmp $9FD2

; Change cursor selection behavior
org $C1A1E8
base $81A1E8
    bne sm_samusdata_selection_up
org $C1A1EF
base $81A1EF
    jmp sm_samusdata_selection_down

org $C1A25E
base $81A25E
sm_samusdata_selection:
.up:
    lda $0952
    beq .exit           ; Save A -> Exit
    cmp #$0005
    bmi .save           ; Clear -> Save
    lda $0954           ; Exit -> Clear or Save
    bne .clear
    bra .save
.down
    lda $0952
    cmp #$0004
    beq .exit           ; Data Clear -> Exit
    bpl .save           ; Exit -> Save A
    lda $0954           ; Save -> Data Clear or Exit
    bne .clear
    bra .exit
.save:
    lda.w #$0000
    bra .store
.clear:
    lda.w #$0004
    bra .store
.exit:
    lda.w #$0005
    bra .store
padbyte $00 : pad $C1A2AF
.store:
warnpc $81A2AF

;==========================================================
; Data Clear menu
;==========================================================
; Don't load or display saves B and C
org $C1993F
    jmp $969F
warnpc $C19984

; Skip the "Clear which data?" prompt and go directly to confirmation
org $C19B33     ; Drawing code for Data Clear
    rep #$30
    jsr $95A6   ; clear tilemap
    ldy.w #$B534
    ldx.w #$0050
    stz $0F96
    jsr $B3E2   ; draw "DATA CLEAR MODE"
    stz $19B7   ; select save A
    lda.w #$005E
    sta $19A1   ; set cursor X position
    lda.w #$00B8
    sta $19AB   ; set cursor Y position
    jmp $9C0B   ; go to drawing code for confirmation screen
warnpc $C19B64

org $C19B64     ; Menu code for Data Clear
    rep #$30
    lda $0727
    inc : inc   ; Go to "Is this OK?" confirmation
    sta $0727
    rts
warnpc $C19C0B

; Return to Samus Data menu on cancel
org $C19C5E
    clc
    adc #$0003
org $C19C72
    rts
