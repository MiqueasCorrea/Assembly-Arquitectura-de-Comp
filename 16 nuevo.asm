;16. Indicar para un valor almacenado en DS:10H, como es la relación entre el bit 3 y 7, 
;de ser iguales guardar en la misma posición un cero sino un uno.

; b7 b6 b5 b4 b3 b2 b1 b0
; 0  0  0  0  0  0  0  0  00h valido
; 1  0  0  0  1  0  0  0  88h valido

; 1  0  0  0  0  0  0  0  80h invalido
; 0  0  0  0  1  0  0  0  08h invalido

; Si el valor de ds:10h tiene bit 3 y bit 7 iguales guardar un 0, si no son iguales un 1


.model small
.stack
.data
.code

mov ax,@data
mov ds,ax

mov si,10h
mov al,[si]

inicio:
    and al,88h
    cmp al,88h
    je igual
    cmp al, 00h
    je igual
    
    mov [si],01h
    jmp fin
igual:
    mov [si],00h
fin:
    mov ah,4ch
    int 21h
