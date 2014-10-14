all: out

out: main.o fun.o
	cc -m32 -o out main.o fun.o

main.o: main.c
	cc -m32 -c main.c

fun.o: fun.s
	nasm -f elf fun.s

clear:
	rm -rf fun.o main.o

.PHONY: all clear
