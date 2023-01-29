;14. Dado un valor ubicado en la posición DS:1FH, determinar si su bit 5 = 0, de ser así 
;guardar en la posicion el valor original incrementado en 2EH.  

; b7 b6 b5 b4 b3 b2 b1 b0
; 0  0  0  0  0  0  0  0  00h valido
; 1  1  0  1  1  1  1  1  DFh valido

; 1  1  1  1  1  1  1  1  FFh invalido
; 0  0  1  0  0  0  0  0  20h invalido


.model small
.stack
.data 
.code

mov ax,@data
mov ds,ax

mov si,1fh
mov al,[si]
mov ah,al

inicio:
    and al,20h
    cmp al,20h 
    je fin
    
    add ah,2eh
    mov [si],ah
fin:
    mov ah,4ch
    int 21h
    