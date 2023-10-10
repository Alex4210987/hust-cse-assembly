;;//PREPEND END

    ;;//TEMPLATE BEGIN
    ;;//书写代码
    ;;//TEMPLATE END

    mov INDEX, 0         ; 初始化循环索引为0

OUTPUT_LOOP:
    xor si,si        ; 将SI寄存器清零，用于保存数组索引
    xor ch,ch     ; 将CH寄存器清零
    xor ah,ah   ; 将AH寄存器清零
    mov al, INDEX       ; 将循环索引保存到AL中
    mov bx,offset ARRAY ; 将数组的偏移地址保存到BX中
    add si,bx    ; 将数组的偏移地址保存到SI中
    add si,ax   ; 将循环索引加到SI中
    mov cl,[si] ; 将当前元素保存到数组中
    inc INDEX            ; 循环索引加1
    mov al,INDEX    ; 将循环索引保存到AL中
    mov ah,LEN    ; 将数组长度保存到AH中
    mov bl,cl
    AND bl, 1; 判断结果
    CMP bl, 0
    JE EVEN_NUMBER ; 如果结果为 0，则表示 CL 中的数是偶数
    JNE ODD_NUMBER ; 如果结果不为 0，则表示 CL 中的数不是偶数

EVEN_NUMBER:
    add dl,cl
    jmp CON
ODD_NUMBER:
    sub dl,cl
    jmp CON

CON:
    cmp al, ah      ; 判断循环索引是否达到数组长度
    jb OUTPUT_LOOP        ; 如果循环索引小于数组长度，继续输入下一个元素


        
;;//APPEND BEGIN
    call print_num  ; 显示结果
    mov ah,4CH  ; 设置DOS功能调用的子功能号为4CH（程序退出）
    int 21H





















;;//PREPEND END
    
    ;;//TEMPLATE BEGIN
    ;;//书写代码
    ;;//TEMPLATE END

    mov cx, 3 ; 输入的整数数量
    mov di , 0 ; 数组下标

ADD_NUMBER:
    mov al ,PosArr[di] ; 将数组的数字存入al  
    inc di  ; 数组下标加1
    add [PositiveSum] ,al
    loop ADD_NUMBER ; 循环

    mov al,[PositiveSum]
    CMP AL, 10
    JB LessThan10 ; 如果小于 10，跳转到 LessThan10 标签处执行相应的代码

    ; 判断是否大于等于 10 并且小于等于 20
    CMP AL, 20
    JB Between10And20 ; 如果大于等于 10 且小于等于 20，跳转到 Between10And20 标签处执行相应的代码

    ; 判断是否大于等于 小于 30
    CMP AL, 30
    JB GreaterThan30 ; 如果大于等于 30，跳转到 GreaterThan30 标签处执行相应的代码

; 跳转目标标签处的代码
LessThan10:
    mov dl,'0'
    mov ah,02h
    int 21h
    JMP ALL_DONE 

Between10And20:
    mov dl,'-'
    mov ah,02h
    int 21h
    mov dl,'1'
    mov ah,02h
    int 21h
    JMP ALL_DONE 

GreaterThan30:
    mov dl,'1'
    mov ah,02h
    int 21h
    JMP ALL_DONE 

ALL_DONE:
    mov ah, 4ch ; DOS的退出服务号
    int 21H     ; 调用DOS的退出服务