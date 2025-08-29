section .text 

; retorna en ecx la longitud del numero

global numToString:   
    push ebp
    mov ebp, esp

    call numToString

    mov esp, ebp
    pop ebp

numToString:

    push ebp
    mov ebp, esp 

    mov eax, [ebp+12] ; me guardo el numero
    mov edi, 0 ; contador para la longitud
    mov ecx, 10 ; divisor

    ; la division se hace guardandome en un registro el valor por el cual quiero divir, en este caso en edx me queda el resto, en ecx tengo el divisor

Ciclo:
    mov edx, 0 ;reseteo donde se guarda el resto
    div ecx
    add edx, 48 ;le agrego el ascii del 0 
    push edx 
    inc edi 
    cmp eax, 0
    jnz Ciclo

    mov esi, [ebp+8] ; me paro donde comienza direccion para pisar los bytes reservados
    mov ecx, edi ; me guardo la longitud

ToDirection: 
    pop ecx
    mov [esi], cl
    inc esi
    dec edi
    cmp edi, 0
    jnz ToDirection

    mov esp, ebp
    pop ebp

ret

















