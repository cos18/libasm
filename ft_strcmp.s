	section	.text
	global	_ft_strcmp

_ft_strcmp:
	cmp		rdi, 0
	je		null_return
	cmp		rsi, 0
	je		null_return
	mov		rax, 0
	jmp		compare
null_return:
	mov		rax, rdi
	sub		rax, rsi
	ret
plus:
	inc		rax
compare:
	mov		rbx, [rdi + rax]
	mov		rcx, [rsi + rax]
	cmp		bl, 0
	je		return
	cmp		cl, 0
	je		return
	cmp		rbx, rcx
	je		plus
return:
	sub		rbx, rcx
	cmp		rbx, 0
	jg		greater
	je		same
least:
	mov		rax, -1
	ret		
greater:
	mov		rax, 1
	ret
same:
	mov		rax, 0
	ret

