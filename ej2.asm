
section .text
GLOBAL toUpper    

toUpper:

    push ebp
    mov ebp, esp

    mov bl, [ebp+8] ;me guardo la longitud para salir del ciclo
    mov esi, [ebp+12] ;me guardo la direccion de memoria de msg
    call cicle

    mov esp, ebp
    pop ebp

cicle: 
    mov al, [esi]  ; me guardo en al el caracter actual en este caso 'h'
    cmp al, 'a' ; comparo para ver si el caracter esta antes de la 'a'
    jb Skip ; si esta antes de la 'a' salta skip
    cmp al, 'z' ; comparo para ver si el caracter esta despues de la 'z'
    ja Skip ; si esta despues de la 'z' salta a skip
    sub al, 32 ;lo llevo a mayuscula
    mov [esi], al ;lo piso en memoria

Skip:
    inc esi
    dec bl
    jnz cicle

ret

