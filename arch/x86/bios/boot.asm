[BITS 16]
[ORG 0x7C00]

main:
    CLI
    XOR AX, AX
    MOV ES, AX
    MOV DS, AX
    MOV SS, AX
    MOV SP, 0x7A00
    STI

    MOV [boot_disk], DL
    
    JMP read_disk

read_disk:
    MOV DL, [boot_disk]
    MOV AH, 0x42
    MOV SI, dap
    INT 0x13
    JC .error

    JMP 0x0000:0x7E00

.error:
    XOR AX, AX
    INT 0x13

    DEC BYTE [retries]
    JNZ read_disk

    MOV SI, disk_error_msg
    CALL print

    JMP halt

halt:
    HLT
    JMP halt

print:
    LODSB
    TEST AL, AL
    JZ .done
    MOV AH, 0x0E
    INT 0x10
    JMP print
.done:
    RET

retries DB 5
boot_disk DB 0
disk_error_msg DB "Disk error: Could not read disk. Stopping", 0
dap:
    DB 0x10
    DB 0x00
    DW 0x0004
    DW 0x7E00
    DW 0x0000
    DQ 0x1

TIMES 510-($-$$) DB 0
DW 0xAA55