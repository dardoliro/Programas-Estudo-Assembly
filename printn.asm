section .data
    number db 50,10

section .text
    global _start

_start:
    mov rax, 9
    call _changeNumberPrint
    call _exitProgram

_exitProgram:
    mov rax, 60
    mov rdi, 0
    syscall

_changeNumberPrint:
    add rax, 48
    mov [number], al
    mov rax, 1
    mov rdi, 1
    mov rsi, number
    mov rdx, 3
    syscall
    ret
