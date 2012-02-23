# Implementacja

Format rational posiada zaimplementowane cztery podstawowe operacje
arytmetyczne takie jak dodawanie, odejmowanie, mnożenie i dzielenie.
Dodatkową funkcjonalnością jest możliwość obliczenia odwrotności ułamka.
Możliwe są również konwersje pomiędzy formatami `rational` i IEEE754.
Językami implementacji algorytmów są ISO C99 i assembler x86_64 w składni
AT&T poprzez wstawki w kodzie C. Aby umożliwić korzystanie z optymalizacji do
funkcji, w których znajdują się wstawki dodano dyrektywę dla kompilatora
`__attribiute__((optimize(0)))`.

## Algorytmy operacji arytmetycznych
### Dodawanie

Dodawanie dwóch liczb a i b w formacie rational jest stosunkowo złożonym i
nieefektywnym w porównaniu do formatu IEEE 754 algorytmem. Pierwszym krokiem
jest znalezienie wspólnego mianownika sumowanych liczb za pomocą algorytmu
NWW. Następnie liczniki obu składników zwiększone zostają dokładnie tyle razy,
ile zwiększone zostały ich mianowniki. Kolejnym krokiem jest porównane znaków
liczb i w przypadku gdy są równe, są sumowane, w przeciwnym razie odjęciu od
większej mniejszej. Końcowym krokiem jest sprawdzenie, czy nie można dokonać
redukcji liczniki i mianownika, a w przypadku gdy wynik przekracza zakres
formatu rational, następuje normalizacja.

\vspace{1.5em}
Wejście: `rational` a, `rational` b

Wyjście: `rational` c

Pseudokod

    c.denominator = nww a.denominator, b.denominator
    an = a.numerator * c.denominator/a.denominator
    bn = b.numerator * c.denominator/b.denominator

    if a.sign == b.sign
        c.numerator = a.numerator + b.numerator
        c.sign = a.sign
    else
        if a.numerator >= b.numerator
            c.numerator = a.numerator - b.numerator
            c.sign = a.sign
        else
            c.numerator = b.numerator - a.numerator
            c.sign = b.sign
        end
    end
    return c

Implementacja

    uint64_t rational_add(uint64_t a, uint64_t b) {
        uint64_t result, r_numerator, r_denominator, r_sign, an,bn;

        r_denominator = nww(rational_get_denominator(a),
                            rational_get_denominator(b));
        an = r_denominator / rational_get_denominator(a) *
             rational_get_numerator(a);
        bn = r_denominator / rational_get_denominator(b) *
             rational_get_numerator(b);

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


### Odejmowanie

Implementacja algorytmu odejmowania liczb a i b w formacie `rational` oparty
został na algorytmie dodawania. W pierwszym kroku zmieniamy znak liczby b na
przeciwny i wykonujemy dodawanie składników.

\vspace{1.5em}
Wejście: `rational` a, `rational` b

Wyjście: `rational` c

Pseudokod

    b.sign = not b.sign
    return sum a, b

Implementacja

    uint64_t rational_sub(uint64_t a, uint64_t b) {
        asm volatile("movq $0x8000000000000000, %%rax\n"
                "xorq %%rax, %0"
                :"=m"(b)
                :
                :"rax");

        return rational_add(a, b);
    }

### Mnożenie

Mnożenie w formacie rational jest prostym i wydajnym algorytmem. Identycznie
jak w przypadku mnożenia zwykłych ułamków, najpierw mnożymy ze sobą liczniki
obu czynników, a potem mianowniki. Podobnie jak w przypadku dodawania,
następuje sprawdzenie, czy można zredukować ułamek, a w przypadku gdy iloczyn
przekracza zakres formatu rational, następuje jego normalizacja.

\vspace{1.5em}
Wejście: `rational` a, `rational` b

Wyjście: `rational` c

Pseudokod

    c.numerator = a.numerator * b.numerator
    c.denominator = a.denominator * b.denominator
    c.sign = a.sign xor b.sign
    return c

Implementacja

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

### Dzielenie

Z uwagi, że dzielenie ułamków jest pomnożeniem pierwszego czynnika przez
odwrotność drugiego, algorytm dzielenia w formacie rational polega na
obliczeniu wartości odwrotności czynnika b i pomnożeniu obu liczb.

\vspace{1.5em}
Wejście: `rational` a, `rational` b

Wyjście: `rational` c

Pseudokod

    b = b.copy.inv
    a = mul a, b
    return a

Implementacja

    uint64_t rational_div(uint64_t a, uint64_t b) {
        return rational_mul(a, rational_inv(b));
    }

## Dodatkowe funkcje
### Odwrotność

Algorytm zamienia między sobą wartości licznika i mianownika.

\vspace{1.5em}
Wejście: `rational` a

Wyjście: `rational` b

Pseudokod

    a.numerator, a.denominator = a.denominator, a.numerator
    return a

Implementacja

    uint64_t rational_inv(uint64_t val) {
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

### Funkcja porównująca

Algorytm porównywania oparty został na odejmowaniu dwóch liczb. Wynik dodatni
oznacza, że odjemna jest większa od odjemnika, ujemny - odjemna mniejsza od
odjemnika, a $0$ -- liczby są równe.

\vspace{1.5em}
Wejście: `rational` a, `rational` b

Wyjście: `int` c

Pseudokod

    sub = a - b
    result = 0

    if sub != 0
        if sub.sign == POSITIVE
            result = 1
        else
            result =  -1

    return result

Implementacja

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

### Skrócenie ułamka
Algorytm skracania ułamka polega na obliczeniu wartości NWD licznika i
mianownika, a następnie podzieleniu ich przez otrzymany wynik.

\vspace{1.5em}
Wejście: `rational` a

Wyjście: `rational` b

Pseudokod

    nw = nwd(a.numerator, a.denominator)

    b.numerator = a.numerator / nwd
    b.denominator = b.numerator / nwd

    return b

Implementacja

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


## Konwersje
### Rational $\to$ IEEE754

Algorytm polega na wyodrębnieniu z obiektu typu rational wartości licznika,
mianownika i znaku oraz sprawdzeniu, czy nie została ustawiona flaga błędu. W
przypadku braku sygnalizacji błędu funkcja zwraca wynik dzielenia licznika
przez mianownik, pomnożonego przez $1.0$ lub $-1.0$ w zależności od znaku
obiektu `rational`. Natomiast wystąpienie 1 na pozycji bitu flagi błędu
powoduje, że zwrócony zostaje $\infty$ lub `NaN`, w zależności od wartości
reszty bitów.

\vspace{1.5em}
Pseudokod

    if flag && denominator == 0
        if numerator == 0x7FFFFFFF
            return Nan
        else
            if sign
                return -inf
            else
                return inf
    else
        if sign
            return -1.0 * numerator / denominator
        else
            return 1.0 * numerator / denominator

Implementacja

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

### IEEE754 $\to$ Rational

Trudność konwersji z formatu IEEE754 do formatu rational polega na ustaleniu
wartości licznika i mianownika. Ustalenie wartości mianownika polega na
wielokrotnym mnożeniu liczby w formacie IEEE754 przez $10$, dopóki wartość
części ułamkowej nie jest równa $0$. Do części licznika przypisana zostaje
wartość mianownika pomnożona przez liczbę zapisaną w standardzie
IEEE754. Ostatnim etapem konwersji jest normalizacja wyniku.

\vspace{1.5em}
Wejście: `double` a

Wyjście: `rational` b

Pseudokod

    if a
        b.sign = -1
    else
        b.sign = 0

    a = abs(a)
    fraction = a - floor(a)
    b.denominator = 1

    while fraction do
        fraction *= 10
        fraction = fraction - floor(fraction)
        b.denominator *= 10
    end

    b.numerator = a * b.denominator

    return b

Implementacja

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

## Normalizacja

Po każdym działaniu arytmetycznym, następuje proces normalizacji wyniku.
Pierwszym krokiem jest sprawdzenie, czy nie ma możliwości skrócenia ułamka. W
przypadku gdy wartość licznika lub mianownika nie mieści się w zakresie
formatu `rational`, następuje proces właściwej normalizacji, czyli jednoczesnego
usuwania najstarszych bitów mianownika i licznika. Gdy podczas tej operacji
mianownik osiągnie wartość $0$, ustawiona zostaje flaga błędu i zwrócona wartość
$\infty$. Natomiast gdy znormalizowana liczba będzie mniejsza od oryginalnej o
$8\%$, również zostaje ustawiona flaga błędu oraz zwrócony `NaN`.

\vspace{1.5em}
Pseudokod

    a = NWD(numerator, denominator)

    if a != 1 do
        b.numerator /= a
        b.denominator /= a
    end

    org = b.numerator/ b.denominator

    while b.numerator > 0x7FFFFFFF or b.denominator > 0x7FFFFFFF do
        shr 1, b.numerator
        shr 1, b.denominator

        if b.denominator
            if ((b.numerator/b.denominator) / org) < 0.92
                return NaN
            else
                return inf
    end

    return b

Implementacja

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

## Funkcje pomocnicze

W celu ułatwienia implementacji algorytmów w bibliotece `rational`, napisane
zostały funkcje pomocnicze, ustawiające i pobierające odpowiednie wartości z
obiektu typu `rational`.

### Pobierające wartość z obiektu rational
#### Pobieranie znaku

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

#### Pobieranie licznika

    uint32_t rational_get_numerator(uint64_t a) {
        uint32_t result;
        asm volatile("andq $0x7FFFFFFF, %%rax\n"
                :"=a"(result)
                :"a"(a));

        return result;
    }

#### Pobieranie mianownika

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

#### Pobieranie flagi

    int rational_get_flag(uint64_t val){
        sign_t result;
        asm volatile("movq $0x80000000, %%rdx\n"
                "andq %%rdx, %%rax\n"
                :"=a"(result)
                :"a"(val)
                :"rdx");

        return result;
    }

### Funkcje ustawiające
#### Ustawianie znaku

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

#### Ustawianie licznika

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

#### Ustawianie mianownika

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

### Tworzenie nowej liczby typu rational

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

### Drukowanie
Funkcja zwraca łańcuch znaków, będący tekstowym odpowiednikiem liczby w
formacie `rational`.

    char *rational_print(uint64_t val){
        const size_t length = 64;
        char *buf;
        const char*str, *sign = "";

        if ((buf = malloc(length + 1)) != NULL) {
            buf[length] = '\0';

            if(rational_get_flag(val) != 0 &&
               rational_get_denominator(val) == 0) {
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


