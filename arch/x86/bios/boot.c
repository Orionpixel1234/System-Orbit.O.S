void write_string(const char* string, int color)
{
    volatile char *video = (volatile char*)0xB8000;
    while( *string != 0 )
    {
        *video++ = *string++;
        *video++ = color;
    }
}

void BMAIN(void)
{
    write_string("TEST", 0x09);
}