[BITS 16]
;; [ORG 0x7E00] RIP

section .note.GNU-stack noalloc noexec nowrite progbits ;; TEMP FOR LD

SECTION .text
GLOBAL main
EXTERN a20
EXTERN gdt_descriptor
EXTERN gdt
EXTERN PM
EXTERN CODE_SEG

main:
    CLI
    CALL a20

    MOV AX, CS
    MOVZX EAX, AX
    SHL EAX, 4
    ADD EAX, gdt
    MOV [gdt_descriptor + 2], EAX

    LGDT [gdt_descriptor]
    MOV EAX, CR0
    OR EAX, 1
    MOV CR0, EAX
    JMP CODE_SEG:PM
