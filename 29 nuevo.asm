;29. Se tienen valores que se ubican desde DS:00 hasta DS:30, determinar el promedio de aquellos
;valores que cumplan con ser mayores de 1AH, almacenar el promedio en DS:37.

; Valores desde ds:[00] a ds:[30], promediar los vos valores que cumplen con ser mayor a 1ah
;y guardar el promedio en ds:37
                                
                               
.model small
.stack
.data
.code

mov ax,@data
mov ds,ax
xor ax,ax 
xor bx,bx
xor cx,cx

mov si,00h

inicio:
    call Validar
    cmp si,10h
    jbe inicio
    call promedio
    mov ds:[37h],al
    
fin:
    mov ah,4ch
    int 21h
    
proc validar
    mov bl,[si]
    cmp bl,1ah
    jbe volver
    add al,bl
    inc cl
    volver:
    inc si
    ret
endp


proc Promedio 
    cmp cl,00
    je volver2
    div cl
    volver2:
    ret
endp
    