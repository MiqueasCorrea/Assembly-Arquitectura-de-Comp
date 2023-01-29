;13. Dado dos valores ubicados en la posición DS:00H y la posición DS:10H respectivamente,
;determinar cuál de los dos es mayor, indicar tal situación colocando un uno en la posicion
;original del valor mayor, pero de ser iguales colocar cero en ambas posiciones.

;Valor en ds:00h y en ds:10h, el que es mayor le pongo un uno y si son iguales un 0 en los dos

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax

mov si,00h
mov al,[si]

mov di,10h
mov ah,[di]

inicio:
    cmp al,ah
    jg mayor1
    cmp ah,al
    jg mayor2
    
    mov [si],00h
    mov [di],00h
mayor1:
    mov [si],01h
    jmp fin
mayor2:
    mov [di],01h
fin:
    mov ah,4ch
    int 21h     