section .bss
    msg resb 32

section .text

EXTERN toUpper
GLOBAL _start

_start:

    mov eax, 3
    mov ebx, 0
    mov ecx, msg
    mov edx, 32
    int 80h

    mov esi, eax
    mov edi, ecx

    push edi
    push esi

    call toUpper

    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, esi
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h