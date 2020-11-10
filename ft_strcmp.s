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
	cmp		rdi, rsi
	jg		greater
	je		same
	jmp		least
plus:
	inc		rax
compare:
	mov		dl, BYTE [rdi + rax]
	cmp		dl, 0
	je		last_s1
	cmp		BYTE [rsi + rax], 0
	je		greater
	cmp		dl, BYTE [rsi + rax]
	je		plus
	jg		greater
	jmp		least
last_s1:
	cmp		BYTE [rsi + rax], 0
	je		same
	jmp		least
least:
	mov		rax, -1
	ret		
greater:
	mov		rax, 1
	ret
same:
	mov		rax, 0
	ret

