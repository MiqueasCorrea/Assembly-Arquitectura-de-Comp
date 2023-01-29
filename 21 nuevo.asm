;21. Para valores ubicados en un área de memoria que va desde la posición DS:00H a la DS:10H
;determinar la cantidad de valores pares mayores a 2EH, almacenar el resultado en DS:15H.

;21. Para valores ubicados en un área de memoria que va desde la posición DS:00H a la DS:10H
;determinar la cantidad de valores pares mayores a 2EH, almacenar el resultado en DS:15H.

; Desde ds:00h a ds:10h contar cuantos valores son pares y mayores a 2eh y almacenarlo en ds:15h

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax
xor cx,cx

mov si,00h

inicio:
    mov al,[si]
    mov ah,al
    
    and al,01h ;And contra impar
    cmp al,00h 
    jne leer   ;Si no es par salto a leer
    cmp ah,2eh
    jbe leer
    
    inc cl
leer:
    inc si
    cmp si,10
    jle inicio
    mov ds:[15h],cl
fin:
    mov ah,4ch
    int 21h