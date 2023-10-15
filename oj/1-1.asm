;;//PREPEND BEGIN
.model small

.code
start:

    mov ah, 08h
    int 21h
    sub al, '0'
    xor ah,ah
    mov bx, ax
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
    ; 无符号相加 BX 和 CX，结果保存在 AX 中
    mov ax, bx
    add ax, cx

    ; 无符号加上 15
    add ax, 15

    ; 无符号除以 DX，结果保存在 AX 中
    xor dx, dx
    div dx

    ; 将结果从 AX 移动到 CX 寄存器
    mov cx, ax
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