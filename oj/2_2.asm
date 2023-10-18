;;//PREPEND BEGINcL
; 输入三个小于10的正整数，如果:
; 1)三个数之和小于10，则输出0
; 2)三个数之和大于等于10并且小于20，则输出-1
; 3)三个数之和大于等于20并且小于30，则输出1
.model small
.stack
.data
    PositiveSum db 0    ; 存放正数和
    PosArr db 3 dup(?)  ; 存放正数的数组
    
.code
start:
    mov ax,@data    ; 初始化DS
    mov ds,ax    ; 初始化DS
    mov cx, 3 ; 输入的整数数量
    mov di , 0 ; 数组下标

InputLoop:
    ; 读取一个整数
    mov ah, 01h ; DOS的输入服务号
    int 21h     ; 调用DOS的输入服务
    sub al, 30h ; 将ASCII码转换为数字
    mov PosArr[di], al ; 将输入的数字存入数组  
    inc di  ; 数组下标加1
    loop InputLoop  ; 循环输入
;;//PREPEND END
    
    ;;//TEMPLATE BEGIN
        ; 计算三个整数的和
    mov ax, 0  ; 清空AL寄存器，用于保存和
    mov di, 0  ; 初始化数组下标为0
    mov cx, 3  ; 数组元素个数为3

SumLoop:
    add al, PosArr[di]  ; 将数组中的元素累加到AL中
    inc di  ; 数组下标加1
    loop SumLoop  ; 继续累加

    ; 根据和的范围输出不同的结果
    cmp al, 10  ; 比较和是否小于10
    jb SumLessThan10  ; 如果和小于10，跳转到SumLessThan10
    cmp al, 20  ; 比较和是否小于20
    jb SumBetween10And20  ; 如果和小于20，跳转到SumBetween10And20
    cmp al, 30  ; 比较和是否小于20    
    jb SumGreaterThan20  ; 否则，和大于等于20

SumLessThan10:
    mov dl, '0'
    jmp PrintPositive
    
SumGreaterThan20:
    mov dl, '1'
    jmp PrintPositive

SumBetween10And20:
    ; 输出负数结果
    mov dl,'-'
    mov ah,02h
    int 21h
    jb SumGreaterThan20  ; 否则，和大于等于20

PrintPositive:
    mov ah,02h
    int 21h
    .exit

;;//TEMPLATE END

;;//APPEND BEGIN
end start
;;//APPEND END
