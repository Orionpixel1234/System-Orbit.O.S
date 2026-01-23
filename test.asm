[BITS 16]
[ORG 0x7C00]

main:
    HLT
    JMP main

TIMES 510-($-$$) DB 0
DW 0xAA55