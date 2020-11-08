section .text
	global _ft_strlen

_ft_strlen : 
	mov rax, 0x2000004
	mov rdi, 1
	mov rsi, msg
	mov rdx, 12
	syscall
	mov rax, 0x2000001
	mov rdi, 0
	syscall

section .data
	msg db "Hello World"
