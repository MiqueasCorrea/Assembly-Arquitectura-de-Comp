;20. Para valores ubicados en un area de memoria que va desde la posición DS:00H a la DS:10H
;determinar la cantidad de valores pares, almacenar el resultado en DS:15.

; Contar valores pares desde ds:00h hasta ds:10h y almacenar la cantidad en ds:15h

; 00h par, 01h impar

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax
xor cx,cx

mov si,00h 
mov ah,al

inicio:
    mov al,[si]
    and al,01h
    cmp al,00h
    jne leer
    
    inc cl
leer:
    inc si
    cmp si,10
    jle inicio
    mov ds:[15h],cl
fin:
   mov ah,4ch
   int 21h
    
