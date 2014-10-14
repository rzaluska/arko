	section .text
	global dig2star

dig2star:
	push ebp
	mov ebp, esp

	mov edx, [ebp + 8]

next:
	mov al, [edx]
	test al, al
	jz fin

	cmp al, '0'
	jb nochg
	cmp al, '9'
	ja nochg
	mov byte[edx], '*'

nochg:
	inc edx,
	jmp next

fin:
	mov eax, [ebp + 8]

	mov esp, ebp
	pop ebp
	ret

