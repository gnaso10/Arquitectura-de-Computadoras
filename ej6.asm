section .bss
    buffer resb 32

section .text

GLOBAL _start
extern numToString

_start:
    push ebp
    mov ebp, esp

    push 0;
    call factorial
    pop edi

    push eax
    push buffer
    call numToString
    mov esi, ecx

    mov esp, ebp
    pop ebp

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, esi
    int 80h
    
    mov eax, 1
    int 80h

factorial:

    push ebp
    mov ebp, esp

    mov eax, 1
    mov ebx, 1
    mov ecx, [ebp+8]


Ciclo:
    mul ebx
    inc ebx
    cmp ebx, ecx
    jbe Ciclo

    mov esp, ebp
    pop ebp

ret

