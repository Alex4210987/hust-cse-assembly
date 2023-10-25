;编写一个子程序，把一个十六位的二进制数用十六进制在屏幕上显示出来，并用一个主程序验证它。
;用堆栈传递十六位的二进制数
.model small

.code
.startup
main:
    mov ax, 1111111111111110b ; 这里设置你的十六位二进制数
    push ax
    xor ax, ax
    call display_hexadecimal
    pop ax
    mov ah, 4Ch
    int 21h

display_hexadecimal proc
    push bp      
    mov bp, sp    
    push bx
    push cx

    mov ax,bp[4] ; 将二进制数存入ax
    mov cx, 4    ; 16位数分成4个4位的分组

convert_loop:
    rol ax, 4    ; 将二进制数循环右移4位
    push ax
    and ax, 000Fh ; 保留低4位，将高位清零
    cmp ax, 9
    jbe digit
    add al, 7h   ; 将大于9的数字转换为A-F的字符

digit:
    add al, '0'  ; 将数字转换为ASCII字符
    mov dl, al
    mov ah, 2     ; 调用DOS功能2，显示字符
    int 21h

    pop ax
    dec cx
    jnz convert_loop

    mov [bp+4] , ax
    pop cx
    pop bx
    mov sp , bp
    pop bp              
    ret
display_hexadecimal endp

end main
