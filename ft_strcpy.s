	section	.text
	global	_ft_strcpy

_ft_strcpy:
	mov		rax, 0
	jmp		copy
plus:
	inc		rax
copy:
	mov		bl, BYTE [rsi + rax]
	mov		BYTE [rdi + rax], bl
	cmp		bl, 0
	jne		plus
return:
	mov		rax, rdi
	ret
