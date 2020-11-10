	section	.text
	global	_ft_strdup
	extern	___error
	extern	_malloc

_ft_strdup:
	cmp		rdi, 0
	jz		error
	mov		rax, 0
	jmp		len_loop
len_inc:
	inc		rax
len_loop:
	cmp		BYTE [rdi + rax], 0
	jne		len_inc
	inc		rax
	push	rdi
	mov		rdi, rax
	call	_malloc
	jc		sys_error
	cmp		rax, 0
	je		error
	pop		rsi
	mov		rdi, rax
	mov		rax, 0
	jmp		cpy_loop
cpy_inc:
	inc		rax
cpy_loop:
	mov		bl, BYTE [rsi + rax]
	mov		BYTE [rdi + rax], bl
	cmp		bl, 0
	jne		cpy_inc
	mov		rax, rdi
	ret
sys_error:
	push	rax
	call	___error
	pop		rdx
	mov		[rax], rdx
error:
	mov		rax, 0
	ret
