!SRAM_CURRENT_GAME = $a173fe
!SRAM_DMA_RET = $a173e0 ; to $e12
!SRAM_TIMER1 = $a17600
!SRAM_TIMER2 = $a17602

!SRAM_SM_START = $a16010
!SRAM_SM_EXIT = $a17400
!SRAM_SM_COMPLETED = $a17402
!SRAM_SM_STATS = $a17a00    ; to $a17aff
!SRAM_SM_ITEM_BUF = $a17900

!SRAM_ALTTP_START = $a06000
!SRAM_ALTTP_EXIT = $a17500
!SRAM_ALTTP_DARKWORLD = $a17502
!SRAM_ALTTP_EQUIPMENT_1 = $a17504
!SRAM_ALTTP_EQUIPMENT_2 = $a17505
!SRAM_ALTTP_COMPLETED = $a17506
!SRAM_ALTTP_CHECKSUM = $a17510 ; to $a17530

!SRAM_ALTTP_ITEM_BUF = $a17b00 ; to $a17bff
!SRAM_ALTTP_RANDOMIZER_BUF = $a17c00
!SRAM_ALTTP_RANDOMIZER_SAVED = $a17cfe
!SRAM_ALTTP_OVERWORLD_BUF = $a17d00 ; to $a17d10
!SRAM_ALTTP_SPC_BUF = $a17e00 ; to $a17eff

!SRAM_RANDOLIVE = $a17700   ; to $a178f0

; !SRAM_MW_RECVQ = $a176b0 ; to $a176ef
; !SRAM_MW_WPTR = $a176f0
; !SRAM_MW_RPTR = $a176f2

; New multiworld communication stuff
!SRAM_MW_ITEMS_RECV = $a26000
!SRAM_MW_ITEMS_RECV_RPTR = $a26600
!SRAM_MW_ITEMS_RECV_WPTR = $a26602

!MW_ITEMS_RECV_RPTR = $7ed8ee    ; store RPTR here when saving so we can replay items on death

!SRAM_MW_ITEMS_SENT = $a26700
!SRAM_MW_ITEMS_SENT_RPTR = $a26d00
!SRAM_MW_ITEMS_SENT_WPTR = $a26d02
