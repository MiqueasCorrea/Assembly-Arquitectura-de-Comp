;23. Para un conjunto de valores ubicados en un área de memoria que va desde DS:00H a la DS:20H,
;se pide determinar el mínimo de dichos valores y de existir más de uno, indicar la cantidad de
;veces que aparece dicho valor. Almacenar el valor mínimo en DS:22H y la cantidad de veces
;DS:23H

;Valores desde ds:00h a la ds:20h, encontrar menor valor y si se repite contabilizarlo y
;almacenar el minimo en ds:22h y la cantidad en ds:23h

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax
xor dx,dx
xor cx,cx
mov si,00h

inicio:
    mov al,[si]
    cmp dl,00h
    jne comparar
    mov ah,al
    inc dl
    jmp leer
comparar:
    cmp al,ah
    ja leer
    cmp al,ah
    jne nuevo_minimo
    inc cl
    jmp leer
nuevo_minimo:
    xor cl,cl
    mov ah,al
    inc cl
leer:
    inc si
    cmp si,20h
    jbe inicio
    mov ds:[22h],ah
    mov ds:[23h],cl
fin:
    mov ah,4ch
    int 21h

