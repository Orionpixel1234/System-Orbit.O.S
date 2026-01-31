#include <kprintv.h>

static int cursor_row = 0;
static int cursor_col = 0;

void kprintv(const char* s, int c) 
{
    volatile unsigned short *video = (volatile unsigned short*)VGA_ADDRESS;
    while (*s != 0)
    {
        if (*s == '\n')
        {
            cursor_col = 0;
            cursor_row++;
        }
        else 
        {
            unsigned short value = (c << 8) | *s;
            video[cursor_row * VGA_WIDTH + cursor_col] = value;
            cursor_col++;
            if (cursor_col >= VGA_WIDTH)
            {
                cursor_col = 0;
                cursor_row++;
            }
        }
        s++;
        if (cursor_row >= VGA_HEIGHT)
        {
            cursor_row = 0;
        }
    }
}

