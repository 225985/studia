#include "function.h"
#include "helper.h"

sign_t rational_get_sign(uint64_t a) {
    sign_t result;
    asm volatile("movq $0x8000000000000000, %%rdx\n"
            "andq %%rdx, %%rax\n"
            "shrq $0x3f, %%rax\n"
            :"=a"(result)
            :"a"(a)
            :"rdx");

    return result;
}

uint64_t rational_set_sign(uint64_t a, sign_t s) {
    asm volatile("movq $0x8000000000000000, %%rdx\n"
            "shlq $0x3f, %%rax\n"
            "andq %%rdx, %%rax\n"
            "movq $0x7FFFFFFFFFFFFFFF, %%rdx\n"
            "andq %%rdx, %0\n"
            "orq %%rax, %0\n"
            :"=m"(a)
            :"a"(s)
            :"rdx");

    return a;
}

uint32_t rational_get_numerator(uint64_t a) {
    uint32_t result;
    asm volatile("andq $0x7FFFFFFF, %%rax\n"
            :"=a"(result)
            :"a"(a));

    return result;
}

uint64_t rational_set_numerator(uint64_t a, uint32_t n) {
    asm volatile("andq $0x7FFFFFFF, %%rax\n"
            "movq $0xFFFFFFFF80000000, %%rdx\n"
            "andq %%rdx, %0\n"
            "orq %%rax, %0\n"
            :"=m"(a)
            :"a"(n)
            :"rdx");

    return a;
}

uint32_t rational_get_denominator(uint64_t a) {
    uint32_t result;
    asm volatile("movq $0x7FFFFFFF00000000, %%rdx\n"
            "andq %%rdx, %%rax\n"
            "shrq $0x20, %%rax\n"
            :"=a"(result)
            :"a"(a)
            :"rdx");

    return result;
}

uint64_t rational_set_denominator(uint64_t a, uint32_t d) {
    asm volatile("movq $0x7FFFFFFF00000000, %%rdx\n"
            "shlq $0x20, %%rax\n"
            "andq %%rdx, %%rax\n"
            "movq $0x80000000FFFFFFFF, %%rdx\n"
            "andq %%rdx, %0\n"
            "orq %%rax, %0\n"
            :"=m"(a)
            :"a"(d)
            :"rdx");

    return a;
}

int rational_get_flag(uint64_t val){
    sign_t result;
    asm volatile("movq $0x80000000, %%rdx\n"
            "andq %%rdx, %%rax\n"
            :"=a"(result)
            :"a"(val)
            :"rdx");

    return result;
}

uint64_t rational_new(sign_t sign, uint32_t numerator, uint32_t denominator) {
    uint64_t result;

    if(denominator == 0) {
        if(sign == 0)
            return 0x8FFFFFFF;
        else
            return 0x800000008FFFFFFF;
    }

    result = 0;
    result = rational_set_sign(result, sign);
    result = rational_set_denominator(result, denominator);
    result = rational_set_numerator(result, numerator);

    return result;
}

char *rational_print(uint64_t val){
    const size_t length = 64;
    char *buf;
    const char*str, *sign = "";

    if ((buf = malloc(length + 1)) != NULL) {
        buf[length] = '\0';

        if(rational_get_flag(val) != 0 && rational_get_denominator(val) == 0) {
            if (rational_get_numerator(val) == 0x7FFFFFFF)
                str = "NaN";
            else
                str = "inf";

            snprintf(buf, length, "%s", str);
        } else {
            if (rational_get_sign(val) == NEGATIVE) sign = "-";

            if(rational_get_numerator(val) == 0)
                snprintf(buf, length, "%s", "0");
            else if(rational_get_denominator(val) == 1)
                snprintf(buf, length, "%s%u", sign,
                        rational_get_numerator(val));
            else
                snprintf(buf, length, "%s%u/%u", sign,
                        rational_get_numerator(val),
                        rational_get_denominator(val));
        }
    }

    return buf;
}

uint64_t rational_inv(uint64_t val) {
#if 0
    Ciekawostka w x86_64:
        Architektura nie pozwala na operacje na stałych 64-bitowych
        inny sposób niż za pomocą instrukcji mov. -- ML
#endif
        asm volatile("movq %%rax, %%rbx\n\t"
                "movq $0x8000000080000000, %%rcx\n\t"
                "movq $0x7FFFFFFF7FFFFFFF, %%rdx\n\t"
                "andq %%rcx, %%rax\n\t"
                "andq %%rdx, %%rbx\n\t"
                "rorq $0x20, %%rbx\n\t"
                "orq %%rbx, %%rax\n\t"
                :"=a"(val)
                :"a"(val)
                :"rbx", "rcx", "rdx");

    return val;
}

uint64_t rational_mul(uint64_t a, uint64_t b) {
    uint64_t r_numerator, r_denominator, r_sign, result;

    asm volatile("movq $0x7FFFFFFF00000000, %%rdx\n\t"
            "movq %3, %%rax\n\t"
            "movq %4, %%rbx\n\t"
            "andq %%rdx, %%rax\n\t"
            "andq %%rdx, %%rbx\n\t"
            "shr $0x20, %%rax\n\t"
            "shr $0x20, %%rbx\n\t"
            "mulq %%rbx\n\t"
            "movq %%rax, %0\n\t"

            "movq %3, %%rax\n\t"
            "movq %4, %%rbx\n\t"
            "andq $0x7FFFFFFF, %%rax\n\t"
            "andq $0x7FFFFFFF, %%rbx\n\t"
            "mulq %%rbx\n\t"
            "movq %%rax, %1\n\t"

            "movq $0x8000000000000000, %%rdx\n\t"
            "movq %3, %%rax\n\t"
            "movq %4, %%rbx\n\t"
            "andq %%rdx, %%rax\n\t"
            "andq %%rdx, %%rbx\n\t"
            "xorq %%rbx, %%rax\n\t"
            "movq %%rax, %2\n\t"
            :"=m"(r_denominator), "=m"(r_numerator), "=m"(r_sign)
            :"m"(a), "m"(b)
              :"rax", "rbx", "rdx");

    result = rational_normalize(r_numerator, r_denominator);

    asm volatile("orq %1, %0\n\t": "=m"(result): "r"(r_sign));

    return result;
}

uint64_t rational_add(uint64_t a, uint64_t b) {
    uint64_t result, r_numerator, r_denominator, r_sign, an,bn;

    r_denominator = nww(rational_get_denominator(a),rational_get_denominator(b));
    an = r_denominator / rational_get_denominator(a) * rational_get_numerator(a);
    bn = r_denominator / rational_get_denominator(b) * rational_get_numerator(b);

    if(rational_get_sign(a) == rational_get_sign(b)){
        asm volatile("addq %%rax, %%rbx\n\t"
                "movq %%rbx, %0\n\t"
                :"=m"(r_numerator)
                :"a"(an), "b"(bn));
        r_sign = rational_get_sign(a);
    } else {
        if(an >= bn){
            asm volatile("subq %%rbx, %%rax\n\t"
                    "movq %%rax, %0\n\t"
                    :"=m"(r_numerator)
                    :"a"(an), "b"(bn));
            r_sign = rational_get_sign(a);
        } else {
            asm volatile("subq %%rax, %%rbx\n\t"
                    "movq %%rbx, %0\n\t"
                    :"=m"(r_numerator)
                    :"a"(an), "b"(bn));
            r_sign = rational_get_sign(b);
        }
    }

    result = rational_normalize(r_numerator, r_denominator);

    result = rational_set_sign(result, r_sign);

    return result;
}

uint64_t rational_sub(uint64_t a, uint64_t b) {
    asm volatile("movq $0x8000000000000000, %%rax\n"
            "xorq %%rax, %0"
            :"=m"(b)
            :
            :"rax");

    return rational_add(a, b);
}

uint64_t rational_sim(uint64_t v) {
    uint32_t d, n, nw;
    uint64_t result;

    d = rational_get_denominator(v);
    n = rational_get_numerator(v);
    nw = nwd(d, n);

    asm volatile("xorq %%rdx, %%rdx\n"
            "divq %%rbx\n"
            :"=a"(n)
            :"a"((uint64_t)n), "b"((uint64_t)nw)
            :"rdx");

    asm volatile("xorq %%rdx, %%rdx\n"
            "divq %%rbx\n"
            :"=a"(d)
            :"a"((uint64_t)d), "b"((uint64_t)nw)
            :"rdx");

    result = rational_set_numerator(v, n);
    result = rational_set_denominator(result, d);
    return result;
}

uint64_t rational_div(uint64_t a, uint64_t b) {
    return rational_mul(a, rational_inv(b));
}

uint64_t rational_normalize(uint64_t numerator, uint64_t denominator) {
    uint64_t result, divisor;
    double original;
    if(denominator == 0)

        return 0x8FFFFFFF; /* inf */


    divisor = nwd64(denominator, numerator);
    if(divisor != 1){
        denominator /= divisor;
        numerator /= divisor;
    }

    original = (double)(1.0 * numerator/denominator);

    while(denominator > 0x7FFFFFFF  || numerator > 0x7FFFFFFF){
        asm volatile("shr   $1, %%rax\n\t"
                "shr   $1, %%rbx\n\t"
                :"=a"(denominator), "=b"(numerator)
                :"a"(denominator), "b"(numerator));

        if(denominator != 0){
            if((1.0 * numerator/denominator) / original < 0.92 ){
                return 0xFFFFFFFF; /* NaN */
            }
        } else {
            return 0x8FFFFFFF; /* inf */
        }
    }

    asm volatile("shl   $0x20, %%rax\n\t"
            "orq   %%rax, %%rbx\n\t"
            "movq  %%rbx, %0\n\t"
            :"=m"(result)
            :"a"(denominator), "b"(numerator));

    return result;
}

double rational_to_double(uint64_t a) {
    uint64_t r_denominator, r_numerator, r_sign;


    r_denominator = rational_get_denominator(a);
    r_numerator = rational_get_numerator(a);
    r_sign = rational_get_sign(a);

    if(rational_get_flag(a) && r_denominator == 0){
        union {
            unsigned long long a;
            double b;
        } help;
        if( r_numerator == 0x7FFFFFFF ){
            help.a = 0x7ff5800000000000;
            return help.b;
        } else {
            if(r_sign) help.a = 0xfff0000000000000;
            else help.a = 0x7ff0000000000000;
            return help.b;
        }

    } else
        return r_sign ? (double)(-1.0 * r_numerator / r_denominator):
            (double)(1.0 * r_numerator / r_denominator);
}

uint64_t double_to_rational(double a) {
    uint64_t result, r_denominator = 1, r_numerator, r_sign;
    double a2 = a > 0 ? a : -a;
    double fraction = a2 - floor(a2);

    while(fraction > 0){
        fraction *= 10;
        fraction = fraction - floor(fraction);
        r_denominator *= 10;
    }
    r_numerator = (uint64_t)(a2 * r_denominator);
    r_sign = (a >= 0) ? 0 : 0x8000000000000000;

    result = rational_normalize(r_numerator, r_denominator);

    asm volatile("orq %1, %0\n\t": "=m"(result): "r"(r_sign));

    return result;
}

int rational_compare(uint64_t a, uint64_t b) {
    uint64_t sub;
    int result = 0;

    sub = rational_sub(a, b);

    /* infinity and NaN's doesn't return valid result! */
    if (rational_get_numerator(sub) != 0) {
        if (rational_get_sign(sub) == POSITIVE) {
            result = 1;
        } else {
            result = -1;
        }
    }

    return result;
}

