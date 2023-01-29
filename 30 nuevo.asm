;27-30 Para un conjunto de valores ubicados en un area de memoria que va desde DS:12 a la DS:22, se
;pide trasladar aquellos valores que cumplan la siguiente condición: bit5 = bit2 a partir de la
;posición DS:25. 
;Tambien determinar el valor minimo de los datos trasladados, almacenar dicho
;valor en la posicion DS:40

;Valores desde ds:[12h] a ds:[22h], si el bit5==bit2 pasarlo a partir de ds:[25h] y determinar
;valor minimo de esos valores y ubicarlo en ds:[40h]  

; b7 b6 b5 b4 b3 b2 b1 b0
; 0  0  1  0  0  1  0  0  24h valido
; 0  0  0  0  0  0  0  0  00h valido

.model small
.stack
.data
.code

mov ax,@data
mov ds,ax 
xor dx,dx

mov si,12h
mov di,25h

inicio:
    call Validacion
    cmp si,25h
    jbe inicio
    mov ds:[40h],dh
fin:
    mov ah,4ch
    int 21h
    
proc Validacion
    mov al,[si]
    mov ah,al
    and al,24h
    cmp al,24h
    jne segunda_opcion
    mov [di],ah
    inc di
    jmp menor
segunda_opcion:
    cmp al,00h
    jne menor
    mov [di],ah
    inc di
menor:
    cmp dl,00h
    jne comparar
    mov dh,ah
    inc dl
comparar:
    cmp ah,dh
    ja  volver
    mov dh,ah
volver:
    inc si
    ret
endp
    
    
            
                                                         
                                                         