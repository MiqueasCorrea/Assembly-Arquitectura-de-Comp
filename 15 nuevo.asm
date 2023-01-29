;15. Determinar si el valor ubicado en DS:100H es par y mayor a 1FH, en el caso de ser así 
;calcular la suma de dicho valor con 15H, almacenarlo en DS:200H y terminar, sino volver al 
;principio y leer la posición nuevamente

; b7 b6 b5 b4 b3 b2 b1 b0
; 0  0  0  0  0  0  0  0  00h par
; 0  0  0  0  0  0  0  1  01h impar

; Si el valor de DS:100H es par y mayor a 1fh, sumarle al valor de ds:100h 15h  almacenarlo
; en ds:200h.

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax

mov si,100h
;mov [si],06h valor hardcodeado

mov di,200h
mov al,[si]
mov ah,al

inicio:
    and al,01h 
    cmp al,01h
    je fin
    cmp ah,1fh
    jle fin
    
    add ah,15h
    mov [di],ah
fin:
    mov ah,4ch
    int 21h