section .bss
    msg resb 32

section .text

global _start
extern numToString

_start:

    push ebp
    mov ebp, esp

    mov eax, 0x14
    int 80h

    ; al ejecutar la syscall de getpid se guarda en eax el valor de mi pid

    push eax
    push msg
    call numToString
    mov esi, ecx

    mov esp, ebp
    pop ebp

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, esi
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
