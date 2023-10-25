; 定义常量NUM，其值为5
NUM equ 5

; 数据段中定义字数组变量DATALIST
data segment
    DATALIST dw -1, 0, 2, 5, 4, ?
data ends

; 代码段中的程序将DATALIST中前NUM个数的累加和存入DATALIST的最后1个字单元中
code segment
start:
    mov ax, data
    mov ds, ax
    mov cx, NUM
    lea si, DATALIST
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
code ends
end start