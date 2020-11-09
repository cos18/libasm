	section	.text
	global	_ft_strdup
	extern	___error
	extern	_ft_strlen
	extern	_malloc
	extern	_ft_strcpy

_ft_strdup:
	cmp		rdi, 0
	je		error
	push	rdi
	call	_ft_strlen
	inc		rax
	push	rdi
	mov		rdi, rax
	call	_malloc
	jc		sys_error
	cmp		rax, 0
	je		error
	pop		rsi
	mov		rdi, rax
	push	rdi
	call	_ft_strcpy
	pop		rax
	ret
sys_error:
	push	rax
	call	___error
	pop		rdx
	mov		[rax], rdx
error:
	mov		rax, 0
	ret
