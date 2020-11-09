	section	.text
	global	_ft_write
	extern	___error

_ft_write:
	mov		rax, 0x2000004
	syscall
	jc		sys_error
	ret
sys_error:
	push	rax
	call	___error
	pop		rdx
	mov		[rax], rdx
	mov		rax, -1
	ret
