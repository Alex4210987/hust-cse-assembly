.model small
.data
    NUM equ 5
    data segment
        DATALIST dw -1, 0, 2, 5, 4, ?
    data ends

.code
start:

_start:
    mov ax, data ; 初始化数据段寄存器
    mov ds, ax ; 初始化数据段寄存器
    xor ax, ax
    mov cx, NUM
    ;lea bx, DATALIST ; bx指向DATALIST的第一个单元
    mov bx, offset DATALIST

sum_loop:
    add ax, [bx]    ; 累加
    inc bx          ; 指向下一个单元
    inc bx
    loop sum_loop

    ; 将累加和存储在DATALIST的最后一个单元
    mov [bx], ax

.exit 0
end 