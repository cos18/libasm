	section	.text
	global	_ft_strlen

_ft_strlen: 
	mov		rax, 0
	jmp		compare
plus:
	inc		rax
compare:
	cmp		BYTE [rdi + rax], 0
	jne		plus
	ret
