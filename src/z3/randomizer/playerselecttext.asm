function playerselect_text_tile(number, palette) = (number&$3FF)|((palette&7)<<10)

macro playerselect_text_upper_tbl(palette)
    table "data/playerselect_text.tbl"
    '0' = playerselect_text_tile($140, <palette>)
    '1' = playerselect_text_tile($141, <palette>)
    '2' = playerselect_text_tile($142, <palette>)
    '3' = playerselect_text_tile($143, <palette>)
    '4' = playerselect_text_tile($144, <palette>)
    '5' = playerselect_text_tile($145, <palette>)
    '6' = playerselect_text_tile($146, <palette>)
    '7' = playerselect_text_tile($147, <palette>)
    '8' = playerselect_text_tile($148, <palette>)
    '9' = playerselect_text_tile($149, <palette>)
    'A' = playerselect_text_tile($14A, <palette>)
    'B' = playerselect_text_tile($14B, <palette>)
    'C' = playerselect_text_tile($14C, <palette>)
    'D' = playerselect_text_tile($14D, <palette>)
    'E' = playerselect_text_tile($14E, <palette>)
    'F' = playerselect_text_tile($14F, <palette>)
    'G' = playerselect_text_tile($160, <palette>)
    'H' = playerselect_text_tile($161, <palette>)
    'I' = playerselect_text_tile($162, <palette>)
    'J' = playerselect_text_tile($163, <palette>)
    'K' = playerselect_text_tile($164, <palette>)
    'L' = playerselect_text_tile($165, <palette>)
    'M' = playerselect_text_tile($166, <palette>)
    'N' = playerselect_text_tile($167, <palette>)
    'O' = playerselect_text_tile($168, <palette>)
    'P' = playerselect_text_tile($169, <palette>)
    'Q' = playerselect_text_tile($16A, <palette>)
    'R' = playerselect_text_tile($16B, <palette>)
    'S' = playerselect_text_tile($16C, <palette>)
    'T' = playerselect_text_tile($16D, <palette>)
    'U' = playerselect_text_tile($16E, <palette>)
    'V' = playerselect_text_tile($16F, <palette>)
    'W' = playerselect_text_tile($180, <palette>)
    'X' = playerselect_text_tile($181, <palette>)
    'Y' = playerselect_text_tile($182, <palette>)
    'Z' = playerselect_text_tile($183, <palette>)
    '<' = playerselect_text_tile($18A, <palette>)
    '>' = playerselect_text_tile($18B, <palette>)
endmacro

macro playerselect_text_lower_tbl(palette)
    table "data/playerselect_text.tbl"
    '0' = playerselect_text_tile($150, <palette>)
    '1' = playerselect_text_tile($151, <palette>)
    '2' = playerselect_text_tile($152, <palette>)
    '3' = playerselect_text_tile($153, <palette>)
    '4' = playerselect_text_tile($154, <palette>)
    '5' = playerselect_text_tile($155, <palette>)
    '6' = playerselect_text_tile($156, <palette>)
    '7' = playerselect_text_tile($157, <palette>)
    '8' = playerselect_text_tile($158, <palette>)
    '9' = playerselect_text_tile($159, <palette>)
    'A' = playerselect_text_tile($15A, <palette>)
    'B' = playerselect_text_tile($15B, <palette>)
    'C' = playerselect_text_tile($15C, <palette>)
    'D' = playerselect_text_tile($15D, <palette>)
    'E' = playerselect_text_tile($15E, <palette>)
    'F' = playerselect_text_tile($15F, <palette>)
    'G' = playerselect_text_tile($170, <palette>)
    'H' = playerselect_text_tile($171, <palette>)
    'I' = playerselect_text_tile($172, <palette>)
    'J' = playerselect_text_tile($173, <palette>)
    'K' = playerselect_text_tile($174, <palette>)
    'L' = playerselect_text_tile($175, <palette>)
    'M' = playerselect_text_tile($176, <palette>)
    'N' = playerselect_text_tile($177, <palette>)
    'O' = playerselect_text_tile($178, <palette>)
    'P' = playerselect_text_tile($179, <palette>)
    'Q' = playerselect_text_tile($17A, <palette>)
    'R' = playerselect_text_tile($17B, <palette>)
    'S' = playerselect_text_tile($17C, <palette>)
    'T' = playerselect_text_tile($17D, <palette>)
    'U' = playerselect_text_tile($17E, <palette>)
    'V' = playerselect_text_tile($17F, <palette>)
    'W' = playerselect_text_tile($190, <palette>)
    'X' = playerselect_text_tile($191, <palette>)
    'Y' = playerselect_text_tile($192, <palette>)
    'Z' = playerselect_text_tile($193, <palette>)
    '<' = playerselect_text_tile($19A, <palette>)
    '>' = playerselect_text_tile($19B, <palette>)
endmacro

macro playerselect_text(address, palette, text)
    pushtable

    db <address>>>8, <address>
    db $00
    db ?upper_end-?upper_start-1
    ?upper_start
    %playerselect_text_upper_tbl(<palette>)
    dw "<text>"
    ?upper_end

    db (<address>+$20)>>8, (<address>+$20), $00, ?lower_end-?lower_start-1
    ?lower_start
    %playerselect_text_lower_tbl(<palette>)
    dw "<text>"
    ?lower_end

    pulltable 
endmacro

;--------------------------------------------------------------------------------

org $0CDDE8
    %playerselect_text($6062, 7, "< P L A Y E R  S E L E C T >")
    ;%playerselect_text($62a5, 7, "COPY  PLAYER")
    ;%playerselect_text($6325, 7, "ERASE PLAYER")
    db $FF
padbyte $FF : pad $0CDED1
warnpc $0CDED1

org $0CDED1
    %playerselect_text($6128, 7, "1,                     ")
    %playerselect_text($61A8, 7, "                       ")
    %playerselect_text($6228, 7, "                       ")
    db $FF
padbyte $FF : pad $0CDFFE
warnpc $0CDFFE

org $0CDFFE
    %playerselect_text($6067, 7, "< ERASE PLAYER > ")
    ;%playerselect_text($60C3, 0, "0123456789ABCDEFGHIJKLMNNOPQ")
    ;%playerselect_text($6325, 7, "CANCEL 01234")
    ;db $FF
;padbyte $FF : pad $0CE0F7
warnpc $0CE0F7


org $0CE0F7
%playerselect_text($6128, 7, "1,                     ")



