#ifndef STRING_H
#define STRING_H

#include <stddef.h>

int memcmp(const void* lhs, const void* rhs, size_t n);
void* memcpy(void* dest, const void* src, size_t n);

#endif