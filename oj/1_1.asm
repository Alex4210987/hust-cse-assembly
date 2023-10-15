;;//PREPEND BEGIN
.model small

.code
start:

    mov ah, 08h
    int 21h
    sub al, '0'
    xor ah,ah
    mov bx, ax
    ;;向bx寄存器输入数据
    mov ah, 08h
    int 21h
    sub al, '0'
    xor ah,ah
    mov cx, ax
    ;;向cx寄存器输入数据
    mov ah, 08h
    int 21h
    sub al, '0'
    xor ah,ah
    mov dx, ax
    ;;向dx寄存器输入数据
    mov ah, 08h 
    int 21h
    sub al, '0'
    ;;向ax寄存器输入数据
    xor ah,ah
;;//PREPEND END


;;//TEMPLATE BEGIN

;;存储在bx中
add bx,cx

;;mul会把结果存储在ax和dx中
push dx

;;存储在ax中
mul bx
add ax,15

pop cx
div cx

;;结果在cx
mov cx,ax
;;//TEMPLATE END


;;//APPEND BEGIN ;;输出cx寄存器数据
    add cx, '0'	
    mov ah, 02h
    mov dl, cl
    int 21h

    mov ah, 4ch
    int 21h
end start
;;//APPEND END