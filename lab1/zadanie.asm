#usuwanie co drugiej cyfry z ciagu

    .data
    buffer: .space 10000

    .text
    .globl main

main:
    li      $v0,    8
    la      $a0,    buffer
    li      $a1,    10000
    syscall
    la      $t0,    buffer      #t0 głowica czytająca
    la      $t1,    buffer      #t1 głowica pisząca
    li      $t6,    0           #numer cyfry {0,1}
    li      $t8,    0           #ilosc usunietych cyfr {0..n}

next:
    lb      $t3,    ($t0)
    #przesuwamy gowice czytajaca
    addu    $t0,    $t0,    1
    #sprawdzamy czy znak to cyfra
    bltu    $t3,    '0',    dalej
    bgtu    $t3,    '9',    dalej
    #tu wiemy ze to liczba
    beq     $t6,    1,      byla_nastepna_cyfra
    #wiemy ze była pierwsza cyfra z dwoch
    #zwiekszamy numer liczby
    li $t6, 1
    #nie omijamy jej
dalej:
    sb      $t3     ($t1)
    beqz    $t3,    fin #jesli zapisalismy \0 to koniec
    #przesuwamy glowice zapisujaca
    addu    $t1,    $t1,    1
    b next

byla_nastepna_cyfra:
    #zwieszamy licznik przetworzonych cyfr
    addu    $t8,    $t8,    1
    #zerujemy oznaczenie numeru cyfry
    li      $t6,    0
    b next

fin:
    la      $a0,    buffer
    li      $v0,    4
    syscall
    move    $a0,    $t8
    li      $v0,    1
    syscall
    li      $v0,    10
    syscall
