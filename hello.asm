section .data
	text db "Hello, World!",10

section .text
	global _start

_start:
	; Printa text na tela
    
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 14
	syscall
    
    ; Encerra o programa
	mov rax, 60
    mov rdi, 0
    syscall
