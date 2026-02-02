#include <string.h>
#include <kprintv.h>

void BMAIN(void)
{
    const char* myStr1 = "ABCD";
    const char* myStr2 = "ABCC";
    int cmp = memcmp(myStr1, myStr2, 4);

    if (cmp > 0) {
        kprintv(myStr1, 0x09);
    } else if (cmp < 0) {
        kprintv(myStr2, 0x09);
    }

    const char* a = "20";
    const char* b = "10";
    
    kprintv(b, 0x09);

    memcpy(&b, &a, sizeof(int)); 

    kprintv(b, 0x09);
}