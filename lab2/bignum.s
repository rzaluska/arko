;zadanie polegalo na zaimplemtowaniu funkcji ktora dla kazdego
;znalezionego w ciagu znakow łańcucha składającego sie z liczb
;po skonwertowanu go na int porownuje z pozostałymi i zwraca
;najwiekszy w postaci unsigned int
;
;unsigned int bignum(const char * string);
;
;przyklad uzycia
;unsigned int a = bignum("100asd200 300 asd100");
;printf("%u\n",a);
;rezultat:
;300

    section .text
    global bignum

bignum:
    push ebp
    mov ebp, esp
    push ebx
    mov edx, [ebp + 8] ; string w edx
    xor ecx, ecx ; sprawdzany znak
    xor ebx, ebx ; w ebx bedziemy trzymac liczbe kowertowana i bedziemy w nim akumulowac cyfry
    xor eax, eax ; eax - najwieksza znaleziona liczba

convert_next:
    mov cl, [edx]
    cmp cl, '9'
    ja nie_liczba
    cmp cl, '0'
    jb nie_liczba
    imul ebx, 10
    lea ebx, [ebx + ecx - '0'] ;dodajemy kolejna cyfre
    jmp next

nie_liczba:
    cmp eax, ebx
    jae nie_bylo_wiekszej
    mov eax, ebx ; nadpisujemy najwieksza
nie_bylo_wiekszej:
    xor ebx, ebx ;zerujemy akumulator liczb
next:
    inc edx ;przechodzimy do nastepnego znaku
    test ecx, ecx
    jnz convert_next ;sprawdzamy czy nie koniec ciagu

    pop ebx
    pop ebp
    ret
