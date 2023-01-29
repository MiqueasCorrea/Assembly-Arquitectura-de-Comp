;18. Indicar para un valor almacenado en DS:A1H, si el bit2 = 0 y el bit 5 = 1, 
;de ser así calcular el XOR de dicho valor con el valor de la posición DS:35H, y 
;almacenarlo en DS:15H

;Si el bit 2=0 y bit 5=1 del valor de ds:a1h, hacer un xor con ese valor y el de ds:35h
;y almacenarlo en ds:15h

; b7 b6 b5 b4 b3 b2 b1 b0
; 0  0  1  0  0  1  0  0  24h invalido  

; 0  0  1  0  0  0  0  0  20h valido

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax
mov ds:[0A1h],0E8h

mov si,0A1h
mov al,[si]
mov ah,al

mov di,35h
mov bl,[di]
        
inicio:
    and al,24h
    cmp al,20h
    jne fin
    
    xor ah,bl
    mov ds:[15h],ah
fin:
    mov ah,4ch
    int 21h