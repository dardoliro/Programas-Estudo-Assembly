section .data
    text db "Hello, World",10,0
    text2 db "Hello again!",10,0

section .text
    global _start

_start:

    ; adiciona as strings na pilha
    push text2
    push text

    ; imprime os livros da pilha
    pop rdi     ; puxa o valor de cim a da pilha para rdi
    call print  ; printa rdi
    pop rdi
    call print
    
    ; fecha o programa
    mov rax, 60
    mov rdi, 0
    syscall

print:
    call contador

    ; escreve rdi na tela
    mov rax, 1
    mov rsi, rdi
    mov rdi, 1
    syscall
    ret

contador:
    ; contador dos bytes da string
    mov rbx, rdi    ; move a string de rdi para rbx
    mov rdx, 0      ; move o contador rdx para 0

loop:
    ; compara cada byte da string armazenada em rbx
    cmp byte[rbx], 0
    je termina  ; termina o loop se o byte for = 0
    inc rdx
    inc rbx
    call loop
termina:
    ; termina o loop
    ret
