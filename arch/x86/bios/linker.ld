OUTPUT_ARCH(i386)
ENTRY(main)
SECTIONS
{
    . = 0x7E00;
    .text :
    {
        *(.text*)
    }
    
    .rodata :
    {
        *(.rodata*)
    }

    .data :
    {
        *(.data*)
    }
}