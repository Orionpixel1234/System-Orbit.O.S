Commit x86_64 only
Commit UEFI boot only
Commit freestanding (no libc)
Commit text-only output
Commit single toolchain at first

MUST USE:
Assembler: NASM
C Compiler: GCC
Linker: LD
Editor: Preferably VS Code

NASM only for early boot + assembler bootstrap
GCC only for freestanding C
LD only via explicit linker scripts
VS Code as text editor only
No IntelliSense
No auto-format
No build extensions

