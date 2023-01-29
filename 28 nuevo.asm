;28. Para el ejercicio anterior determinar el valor mínimo de los datos trasladados, almacenar dicho
;valor en la posición DS:40

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
    jmp menor
segunda_posibilidad:
    cmp al,00h
    jne menor
    mov [di],ah
    inc di
    inc si
menor:
    cmp dl,00h
    jne comparar
    mov dh,ah
    inc dl
comparar:
    cmp ah,dh
    ja leer
    mov dh,ah
leer:
    inc si
    cmp si,22
    jbe inicio
    mov ds:[40],bh
fin:
    mov ah,4ch
    int 21h
