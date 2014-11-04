;tego zadania nie bylo na labolatoriach
;jest to odpowiednik zadania z lab1 ale w assembly intela

    section .text
    global remove_even_digit

remove_even_digit:
    push ebp
    mov ebp, esp
    push edi
    mov edi, [ebp + 8] ; glowica czytajaca w edi
    mov ecx, edi       ; glowica piszaca w ecx
    xor edx, edx       ; numer liczby

next:
    mov al, [edi] ;wczytujemy znak
    inc edi ; przsuwamy glowice czytajaca
    cmp al, '0'
    jb nochg
    cmp al, '9'
    ja nochg
    ;tutaj wiemy ze to liczba
    ;sprawdzamy ktora to liczba
    xor edx, 1 ;jak byla pierwsza to xor ustawi 1 jak bylo nastepna to 0
    jz next ;jesli byla nastepna

nochg:
    mov [ecx], al
    inc ecx ;przsuwamy glowice piszaca
    test al, al ;sprawdzenie czy nie zapisalismy zera
    jnz next
    mov eax, [ebp + 8]
    pop edi
    pop ebp
    ret

