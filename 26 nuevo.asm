;26. Para un dato ubicado en DS:20 se pide:

;bit7   bit4    bit1

;1  1  0 sumar al dato original 3H, almacenarlo en DS:22 y terminar
;0  0  1 realizar una xor con el valor 13H, almacenarlo en DS:23 y terminar
;1  0  1 realizar una or con el valor 4AH, almacenarlo en DS:24 y terminar
;x  x  x Volver a leer las posición DS:20 creando un ciclo     

; b7 b6 b5 b4 b3 b2 b1 b0
; 1  0  0  1  0  0  1  0  92H mascara

; 1  0  0  1  0  0  0  0  90h sumo a ds:[20h] 3h y almacenar en ds:22h y terminar

; 0  0  0  0  0  0  1  0  02h xor a ds:[20h] con 13h, almacenar en ds:[23h] y terminar

; 1  0  0  0  0  0  1  0  82h or a ds:[20h] con 4ah, almacenar en ds:[24h] y terminar

; x  x  x  x  x  x  x  x  ciclo 
; 0  0  0  0  0  0  0  0

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax

mov si,20h

inicio:
    mov al,[si] ;esto por si el ciclo se cumple, me lea 20h y no el valor enmascarado
    mov ah,al
    and al,92h 
    cmp al,90h
    je primera_sentencia
    cmp al,02h
    je segunda_sentencia
    cmp al,82h
    je tercera_sentencia 
    ;crear bucle aca
    
primera_sentencia:
    add ah,3h
    mov ds:[22h],ah
    jmp fin
segunda_sentencia:
    xor ah,13h
    mov ds:[23h],ah
    jmp fin
tercera_sentencia:
    or ah,4ah
    mov ds:[24h],ah
fin:
    mov ah,4ch
    int 21h
    