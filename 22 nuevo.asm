;22. Para un conjunto de valores ubicados en un área de memoria que va desde DS:10H a la DS:00H,
;se pide determinar el mínimo de dichos valores, almacenar resultado en DS:15H.

; Valores desde ds:10h a ds:00h, determinar el valor minimo y almacenarlo en ds:15h

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax
xor dx,dx

mov si,10h

inicio:
    mov al,[si] ;actual    
    cmp dl,00h
    jne comparar
    mov ah,al
    inc dl    
    jmp leer
comparar:
    cmp al,ah
    ja leer
    mov ah,al
leer:
    dec si
    cmp si,00
    jge inicio
    mov ds:[15h],ah
fin:
    mov ah,4ch
    int 21h
     