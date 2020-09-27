include

org $c18003
base $818003
    jml sm_save_hook

org $c1807F
base $81807F
    jml sm_save_done_hook

org $c18087
base $818087
    jml sm_load_hook


; Patch everything to always use save 1
org $C1800D     ; save
    lda.w #$0000
org $C18091     ; load
    lda.w #$0000
org $C19A42     ; data copy source
    lda.w #$0000
org $C19A4D     ; data copy destination
    lda.w #$0000
org $C19CA9     ; data clear
    lda.w #$0000
    
; Remove last used save from SRAM
org $C19ED8
    stz $0952   ; default to save 1
    jmp $9EF3
org $C1A239
    jmp $A247   ; skip storing last used save


; Remove madadameyohn / supermetroid string from SRAM
org $C0824F
    rtl
warnpc $C08261
org $C08261
    lda.w #$0004
    sta $1F59
    rtl
warnpc $C082AD

; replace delete code
;org $C180FC
;    jsl delete_save_data
;    jmp $811D

;org $819CA4
;    jsl delete_save_data
;    jmp $9CDB
