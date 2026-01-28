[BITS 16]
;; [ORG 0x7E00] RIP
SECTION .text
GLOBAL main

main:
    MOV AH, 0x0E
    MOV AL, 'H'
    INT 0x10

    MOV AH, 0x0E
    MOV AL, 'I'
    INT 0x10

halt:
    HLT
    JMP halt
