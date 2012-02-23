#include "helper.h"

uint64_t nww(uint32_t a, uint32_t b) {
    asm volatile("mulq %2\n"
                 "divq %3\n"
                 :"=a"(a)
                 :"a"(a), "m"(b), "r"((uint64_t)nwd(a, b))
                 :"rdx"
                );
    return a;
}

uint32_t nwd(uint32_t a, uint32_t b) {
    asm volatile("nwd_loop:\n"
                 "  cmpq %%rbx, %%rax\n"
                 "  je nwd_bailout\n"
                 "  jg nwd_no_xchg\n"

                 "  xchgq %%rax, %%rbx\n"

                 "nwd_no_xchg:\n"
                 "  subq %%rbx, %%rax\n"

                 "  jmp nwd_loop\n"

                 "nwd_bailout:\n"
                 :"=a"(a)
                 :"a"(a), "b"(b)
                 :"cc"
                );
    return a;
}

uint64_t nwd64(uint64_t a, uint64_t b){
	
    uint64_t tmp;
    
    while(b != 0){
        tmp = a % b;
        a = b;
        b= tmp;
    }
    return a;
}

