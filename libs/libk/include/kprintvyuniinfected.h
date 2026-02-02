#ifndef KPRINTV_H
#define KPRINTV_H

#define VGA_ADDRESS 0xB8000
#define VGA_WIDTH 80
#define VGA_HEIGHT 25

/*
    FUNCTION:
    void kprintv(const char* s, int c)
    PARAMS:
    const char* s
    string thats going to be printed
    int c
    color of string
    USE:
    print a string to screen
    kprintv:
    kernel print vga
*/
void kprintv(const char* s, int c);
#endif