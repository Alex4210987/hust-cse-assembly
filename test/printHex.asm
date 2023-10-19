.model small
.data
    bin_number dw 0101110110011110b ; 二进制数A，以十六进制表示
    hex_buffer db 4 DUP ('$') ; 存储十六进制结果的缓冲区
    hex_output db "Hex: $"

.code
    org 100h
start:
    ; 方法1: 使用寄存器传递参数
    mov ax, [bin_number]  ; 将二进制数加载到寄存器AX
    call binToHex
    call printHex

    ; 退出程序
    mov ah, 4Ch  ; 设置DOS功能号，表示退出程序
    int 21h      ; 调用21h中断

binToHex proc
    ; 输入：AX 中存储二进制数
    ; 输出：hex_buffer 中存储十六进制结果
    mov cx, 4
    lea di, hex_buffer

convertLoop:
    shr ax, 4      ; 右移4位，处理下一个四位二进制数
    pushf          ; 保存标志寄存器状态
    and al, 0Fh    ; 保留低四位
    mov ah, 0      ; 清空高四位
    cmp al, 9
    jbe convertHexDigit  ; 如果小于或等于9，转化为字符
    add al, 7      ; 否则，转化为A-F的字符

convertHexDigit:
    add al, '0'     ; 将数字字符转化为ASCII码
    stosb           ; 存储到缓冲区
    popf            ; 恢复标志寄存器状态
    loop convertLoop
    ret
binToHex endp

printHex proc
    ; 输入：hex_buffer 中的十六进制数据
    ; 输出：在屏幕上显示十六进制数据
    mov ah, 09h     ; 设置DOS功能号，表示显示字符串
    lea dx, hex_output
    int 21h

    lea dx, hex_buffer
    int 21h
    ret
printHex endp

end start
