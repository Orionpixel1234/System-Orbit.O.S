[BITS 16]
GLOBAL a20

a20:
    CLI

    MOV AX, 0x2401
    INT 0x15

    CALL wait_input_clear

    IN AL, 0x92
    OR AL, 00000010B
    OUT 0x92, AL

.done:
    STI
    RET

wait_input_clear:
    IN AL, 0x64
    TEST AL, 2
    JNZ wait_input_clear

    MOV AL, 0xD1
    OUT 0x64, AL
    CALL wait_output_clear
    RET

wait_output_clear:
    IN AL, 0x64
    TEST AL, 2
    JNZ wait_output_clear

    MOV AL, 0xDF
    OUT 0x60, AL
    RET
