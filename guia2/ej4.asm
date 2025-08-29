section .bss
    buffer resb 32

section .text
    global _start
    global addall
    extern numToString


_start:

    push ebp
    mov ebp, esp

    push 12
    call addall
    pop edi ; saco el 6 a un registro cualquiera

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


addall:

    push ebp    
    mov ebp, esp

    mov eax, 0
    mov ebx, [ebp+8]

Ciclo:

    add eax, ebx
    dec ebx
    jnz Ciclo

    mov esp, ebp
    pop ebp

ret



  













