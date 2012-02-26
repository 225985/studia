#ifndef __UTILS_H__
#define __UTILS_H__

#if defined(__APPLE__)
#include <mach/mach_time.h>
#else
#include <time.h>
#endif

#include <stdint.h>

#define MM_DEBUG 2

void timer_init();
void timer_start();
double timer_end();

#endif
