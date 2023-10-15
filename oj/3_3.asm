.model small
.stack
.data
N dw 0
result dw 0
.code

; 子程序dutui1，计算递推数列的第n项
ditui1 proc
    ; 保存寄存器状态
    push ax
    push bx
    push cx
    push dx

    ; 初始化数列的前两项
    mov ax,1 ; F(1) = 1
    mov bx,0 ; F(0) = 0

    ; 循环计算数列的第n项
    mov cx, N  ; 将n存入cx
    cmp cx, 2  ; 检查n是否小于2
    jae loop_start  ; 如果n >= 2，进入循环计算
    mov ax, cx  ; 如果n为0或1，直接将n作为结果

loop_start:
    ; 计算F(n) = F(n-1) + F(n-2)
    mov dx, ax
    add ax, bx
    dec cx

    ; 更新F(n-2)为F(n-1)，更新F(n-1)为新计算的F(n)
    ; ax=F(n),bx=F(n-1)
    mov bx, dx

    ; 检查是否计算完成
    cmp cx, 1
    jae loop_start

    ; 存储结果到result
    mov result, ax

    ; 恢复寄存器状态并返回
    pop dx
    pop cx
    pop bx
    pop ax
    ret
ditui1 endp

start:
    mov ah, 08h
    int 21h
    sub al, '0'
    xor ah, ah
    mov N, ax
    xor ax, ax
    call ditui1
    mov ax, result
    call print_ax

    ; 退出程序
    mov ax, 4c00h
    int 21h

print_ax proc
    push ax
    push cx
    push dx
    push ax

    mov dl, al
    mov cl, 4
    shr dl, cl
    or dl, 30h
    cmp dl, 39h
    jbe aldisp1
    add dl, 7

aldisp1:
    mov ah, 2
    int 21h

    pop dx
    and dl, 0fh
    or dl, 30h
    cmp dl, 39h
    jbe aldisp2
    add dl, 7

aldisp2:
    mov ah, 2
    int 21h

    pop dx
    pop cx
    pop ax
    ret
print_ax endp

end start
