	.data
welcome: .asciiz "Enter a string: "
buf: .space 80

	.text
	.globl main

main:
	la $a0, welcome
	li $v0, 4
	syscall
	la $a0, buf
	li $a1, 80
	li $v0, 8
	syscall
	#przetwarzanie

	la $t1, buf
	li $t0, '*'
next:
	lbu $t2, ($t1)
	bltu $t2, ' ', fin
	bltu $t2, '0', nochg
	bgtu $t2, '9', nochg
	sb $t0, 0($t1)
nochg:
	addiu $t1, $t1, 1
	b next

	#przetwarzanie
fin:
	la $a0, buf
	li $v0, 4
	syscall
	li $v0, 10
	syscall
