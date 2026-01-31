[BITS 16]
GLOBAL gdt_descriptor
GLOBAL CODE_SEG
GLOBAL DATA_SEG
GLOBAL gdt

CODE_SEG EQU 0x08
DATA_SEG EQU 0x10

gdt:
    DQ 0x00000000

    ;; CODE SEG
    DW 0xFFFF
    DW 0x0000
    DB 0x00
    DB 10011010b
    DB 11001111b
    DB 0x00

    ;; DATA SEG
    DW 0xFFFF
    DW 0x0000
    DB 0x00
    DB 10010010b
    DB 11001111b
    DB 0x00

gdt_end:

gdt_descriptor:
    DW gdt_end - gdt - 1
    DD 0