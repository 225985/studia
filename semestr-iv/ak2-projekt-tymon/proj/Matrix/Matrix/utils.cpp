#include "utils.h"

uint64_t timer_start_time;
#if defined(__APPLE__)
#else
  timespec time1, time2;  
#endif

void timer_init(){
#if defined(__APPLE__)
    mach_timebase_info_data_t timeBaseInfo;
    mach_timebase_info(&timeBaseInfo);
#endif
}

void timer_start(){
#if defined(__APPLE__)
    timer_start_time = mach_absolute_time();
#else
    clock_gettime(CLOCK_REALTIME, &time1);
#endif
}

double timer_end(){
#if defined(__APPLE__)    
    uint64_t timer_end_time, timer_elapsed_time;
    
    timer_end_time = mach_absolute_time();
    timer_elapsed_time = timer_end_time - timer_start_time;
    
    return timer_elapsed_time / 1000000.0;
#else
   clock_gettime(CLOCK_REALTIME, &time2);
    
    return ((time2.tv_sec-time1.tv_sec)+(double)(time2.tv_nsec-time1.tv_nsec)/1000000000);
#endif
}
