;19. Indicar par un valor almacenado en DS:10H, si el bit 6 = bit 3, en el caso de ser así 
;calcular la suma de dicho valor con 55H, almacenarlo en DS:20H y terminar, sino volver al 
;principio y leer la posición nuevamente.

; Valor en ds;10h, si el bit 6 == bit 3, sumar el valor de ds:10h con ds:55h y almacenarlo
; en ds:20h

; b7 b6 b5 b4 b3 b2 b1 b0
; 0  0  0  0  0  0  0  0  00h valido
; 0  1  0  0  1  0  0  0  48h valido

; 0  1  0  0  0  0  0  0  40h invalido
; 0  0  0  0  1  0  0  0  08h invalido

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax   

mov si,10h
mov al,[si]
mov ah,al

inicio:
    and al,48h
    cmp al,40h
    je fin
    cmp al,08h
    je fin
    
    add ah,ds:[55h]
    mov ds:[20h],ah
fin:
    mov ah,4ch
    int 21h