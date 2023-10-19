.model small
.stack
.data
    bin_number dw 1111111111111111b

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, bin_number
    call binToHex

    ; 退出程序
    mov ah, 4Ch  ; 设置DOS功能号，表示退出程序
    int 21h      ; 调用21h中断

binToHex proc
    ; 输入：AX 中存储二进制数
    ; 输出：hex_buffer 中存储十六进制结果
    mov cx, 4

convertLoop:
    mov dl, ah     ; 将结果存储到DL
    and dl, 0F0h    ; 将高四位二进制数置0
    shr dl, 4
    cmp dl, 09h    ; 判断是否小于或等于9
    jbe printHexDigit  ; 如果小于或等于9，转化为字符
    add dl, 7      ; 否则，转化为A-F的字符

printHexDigit:
    add dl, '0'    ; 转化为ASCII码
    push ax        ; 保存AX
    mov ah, 2      ; 设置DOS功能号，表示显示字符
    int 21h        ; 调用21h中断，显示字符
    pop ax         ; 恢复AX
    shl ax, 4      ; 右移4位，处理下一个四位二进制数
    loop convertLoop

    ret
binToHex endp

end start
