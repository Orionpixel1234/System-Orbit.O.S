#ifndef STDDEF_H
#define STDDEF_H
#if defined(__x86_64__) || defined(__amd64__)
typedef unsigned long long size_t;
#elif defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__)
typedef unsigned int size_t;
#else
typedef unsigned int size_t;
#endif
#endif