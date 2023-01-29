;27. Para un conjunto de valores ubicados en un área de memoria que va desde DS:12 a la DS:22, 
;se pide trasladar aquellos valores que cumplan la siguiente condición: bit5 = bit2 a partir de la
;posición DS:25.

;Valores desde ds:[12] hasta ds:[22], los valores que tengan bit5==2 moverlos a partir de ds:[25]

; b7 b6 b5 b4 b3 b2 b1 b0
; 0  0  1  0  0  1  0  0  24h valido
; 0  0  0  0  0  0  0  0  00h valido

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax
xor ax,ax
xor dx,dx

mov si,12
mov di,25

inicio:
    mov al,[si]
    mov ah,al
    and al,24h
    cmp al,24h
    jne segunda_posibilidad
    mov [di],ah
    inc di
    inc si
    jmp leer
segunda_posibilidad:
    cmp al,00h
    jne leer
    mov [di],ah
    inc di
    inc si
leer:
    inc si
    cmp si,22
    jbe inicio
fin:
    mov ah,4ch
    int 21h
    
        