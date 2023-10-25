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
    mov cx, NUM ; 初始化计数器
    lea si, DATALIST ; 将DATALIST的偏移地址送入SI
    xor ax, ax 
    xor dx, dx

loop_start:
    add ax, word ptr [si] ; 累加
    adc dx, 0 ; 有进位则加1
    add si, 2 ; 指向下一个字单元
    loop loop_start

    mov [si], ax ; 将累加和存入DATALIST的最后1个字单元中
    mov [si+2], dx ; 将进位存入DATALIST的最后1个字单元中的下一个字单元中

    mov ax, 4ch ; 返回DOS
    int 21h

.exit 0
end