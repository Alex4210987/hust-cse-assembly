;编写一个子程序，把一个十六位的二进制数用十六进制在屏幕上显示出来，并用一个主程序验证它。
;用wordTEMP变量传递十六位二进制参数
.model small
.data
    wordTEMP dw 1111111111111111b
.code
.startup
main:

    call display_hexadecimal

    mov ah, 4ch
    int 21h

display_hexadecimal proc
    push ax
    mov ax,wordTEMP
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

    pop ax
    ret

display_hexadecimal endp

end main
