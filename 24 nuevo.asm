;24. Para un conjunto de valores ubicados en un área de memoria que va desde DS:10H a la DS:100H,
;se pide determinar el máximo de dichos valores menores a D1H, almacenar resultado en
;DS:150H.


.model small
.stack
.data
.code

mov ax,@data
mov ds,ax
xor ax,ax
xor cx,cx
xor dx,dx

mov si,10h

inicio:
    mov al,[si]
    cmp dl,00h
    jne comparar
    mov ah,al
    inc dl
    jmp leer
comparar:
    cmp ah,al
    jae leer
    mov ah,al
leer:
    inc si
    cmp si,100h
    jbe inicio
    mov ds:[150h],ah
fin:
    mov ah,4ch
    int 21h 
    
    
    