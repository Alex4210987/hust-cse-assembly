.model small
.data
    NUM equ 5
    DATALIST dw -1, 0, 2, 5, 4, ?

.code
    .startup
    xor ax, ax
    mov cx, NUM
    lea bx, DATALIST ; bx指向DATALIST的第一个单元

sum_loop:
    add ax, [bx]    ; 累加
    inc bx          ; 指向下一个单元
    inc bx
    loop sum_loop

    ; 将累加和存储在DATALIST的最后一个单元
    mov [bx], ax

.exit 0
end