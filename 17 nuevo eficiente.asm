;17. Indicar para un valor almacenado en DS:00, si el bit2 y el bit 6 son iguales a 1,
;de ser así calcular el OR de dicho valor con el valor de la posición DS:10, y almacenarlo 
;en DS:15

;Si el valor de ds:00h el bit2 y bit 6 son 1, hacer un or con el valor de ds:00h y el de
;ds:10h y almacenarlo en ds:15h

; b7 b6 b5 b4 b3 b2 b1 b0
; 0  1  0  0  0  1  0  0  44h valido
; 1  1  1  1  1  1  1  1  FFh valido

; 1  0  1  1  1  0  1  1  BBh invalido
; 0  0  0  0  0  0  0  0  00h invalido

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax

mov ds:[00h],0C7h

mov si,00h
mov al,[si]
mov ah,al  ;Resguardo el valor de al en ah
mov si,15h ;Reemplazo SI con el valor donde tengo que almacenarlo
mov di,10h
mov bl,[di]

inicio:
   and al,44h  ;hacemos pelota al con el and
   cmp al,44h
   jne fin  
   
   or ah,bl
   mov [si],ah
fin:
    mov ah,4ch
    int 21h
   
     
