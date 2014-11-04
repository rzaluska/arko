all: out

out: main.o bignum.o
	cc -m32 -o $@ $^

main.o: main.c
	cc -m32 -c $^

%.o: %.s
	nasm -f elf $<

clear:
	rm -rf fun.o main.o

.PHONY: all clear
