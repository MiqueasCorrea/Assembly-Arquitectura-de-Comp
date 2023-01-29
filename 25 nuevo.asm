;25. Para los valores almacenados entre la posición DS:1FH y DS:2FH, determinar qué cantidad de
;valores cumplen con la siguiente condición: bit 7=1, bit 4 =0 y bit 2=1, almacenar resultado en
;DS:30H.

; b7 b6 b5 b4 b3 b2 b1 b0
; 1  0  0  0  0  1  0  0  84h valido 

; 0  0  0  0  0  1  0  0  04h invalido

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax 
xor cl,cl
mov si,1fh

inicio: 
    mov al,[si]
    and al,84h
    cmp al,84h
    jne leer
    inc cl
leer:
    inc si
    cmp si,2fh
    jbe inicio
    mov ds:[30h],cl
fin:
    mov ah,4ch
    int 21h