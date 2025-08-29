section .bss
    msg resb 32

section .text
global _start
extern numToString

_start:

    mov eax, 18
    int 80h

    push eax
    push msg
    call numToString
    mov esi, ecx

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, ecx
    int 80h

    mov eax, 1
    mov ebx, 0 
    int 80h

