;;//PREPEND BEGIN
;;输入一个正整数数组，数组长度小于10，数组元素都小于10，然后将所有偶数的和(没有偶数则视为0)减去所有奇数的和(没有奇数则视为0)，结果保存在dl中。
.model small
.stack
.data
    ARRAY db 10 DUP(0)   ; 数组，长度为10
    LEN db ?          ; 数组长度
    INDEX db ?           ; 循环索引
    CURRENT_NUM db ?     ; 当前元素
    EVEN_SUM db 0        ; 偶数和
    ODD_SUM db 0         ; 奇数和

.code

print_num proc near
    push dx     ; 保存寄存器
    mov dh,dl   ; 保存dl
    and dh,80h  ; 判断是否为负数
    jnz negL    ; 若为负数，跳转到negL
    jmp nxt    ; 若为正数，跳转到nxt
negL:   ; 若为负数，先输出负号
    mov dh,dl   ; 保存dl
    mov dl, '-' ; 输出负号
    mov ah, 02h ; 功能号2，输出字符
    int 21h    ; 调用中断
    neg dh    ; 取反dh
    mov dl,dh   ; 将dh赋给dl
nxt:
    xor  ah, ah     ; 除法时，ah必须为0
    mov  al, dl    ; 将dl赋给al
    mov  dh, 10   ; 除数为10
    div  dh     ; 除以10
    ;除以10后商是否为0
    test al, 0ffh   ;若为0，则代表原数为一位数
    jz   single ;商不为0，至少为两位数
    push ax     ;保存ax
    xor  ah, ah     ;除法时，ah必须为0
    div  dh     ;除以10
    test al, 0ffh   ;同理，若商为0，代表为两位数
    jz   two    ;商为0时，余数不可能也为0，这样是个位数
    push ax     ;保存ax
    mov  dl, al     ;余数为个位数
    add  dl, '0'    ;转换为字符
    mov  ah, 02h    ;功能号2，输出字符
    int  21h    ;调用中断
    pop  ax     ;恢复ax
two:
    mov  dl, ah     ;余数为十位数
    add  dl, '0'    ;转换为字符
    mov  ah, 02h    ;功能号2，输出字符
    int  21h    ;调用中断
    pop  ax     ;恢复ax
single:
    mov  dl, ah     ;余数为个位数
    add  dl, '0'    ;转换为字符
    mov  ah, 02h    ;功能号2，输出字符
    int  21h    ;调用中断
    pop  dx    ;恢复寄存器
    ret
print_num endp

start:
    mov ax,@data     ; 初始化数据段寄存器
    mov ds,ax     ; 初始化数据段寄存器
    ; 输入数组长度
    mov ah, 01H          ; 设置DOS功能调用的子功能号为01H（读取字符）
    int 21H              ; 执行DOS功能调用
    sub al, '0'          ; 将输入字符转换为数字
    mov LEN, al         ; 将数组长度保存到LEN中

    ; 输入数组元素
    mov INDEX, 0         ; 初始化循环索引为0

INPUT_LOOP:
    mov ah, 01H          ; 设置DOS功能调用的子功能号为01H（读取字符）
    int 21H              ; 执行DOS功能调用
    sub al, '0'          ; 将输入字符转换为数字
    mov CURRENT_NUM, al ; 将当前元素保存到CURRENT_NUM中
    mov al, INDEX       ; 将循环索引保存到AL中
    mov bx,offset ARRAY ; 将数组的偏移地址保存到BX中
    mov cl,CURRENT_NUM      ; 将当前元素保存到CL中
    xor si,si        ; 将SI寄存器清零，用于保存数组索引
    xor ch,ch     ; 将CH寄存器清零
    xor ah,ah   ; 将AH寄存器清零
    add si,bx    ; 将数组的偏移地址保存到SI中
    add si,ax   ; 将循环索引加到SI中
    mov [si], cl ; 将当前元素保存到数组中
    inc INDEX            ; 循环索引加1
    mov al,INDEX    ; 将循环索引保存到AL中
    mov ah,LEN    ; 将数组长度保存到AH中
    cmp al, ah      ; 判断循环索引是否达到数组长度
    jb INPUT_LOOP        ; 如果循环索引小于数组长度，继续输入下一个元素

    ; 计算偶数和和奇数和
    xor DL, DL           ; 将DL寄存器清零，用于保存结果

    mov INDEX, 0         ; 初始化循环索引为0
;;//PREPEND END

    ;;//TEMPLATE BEGIN
    mov INDEX, 0  ; 初始化循环索引为0
    mov EVEN_SUM, 0  ; 初始化偶数和为0
    mov ODD_SUM, 0  ; 初始化奇数和为0

    CALC_LOOP:
        xor si, si  ; 将SI寄存器清零，用于保存数组索引
        xor cx, cx  ; 将CX寄存器清零
        xor ax, ax  ; 将AX寄存器清零
        mov al, INDEX  ; 将循环索引保存到AL中
        add si, offset ARRAY  ; 将数组的偏移地址保存到SI中
        add si, ax  ; 将循环索引加到SI中
        mov al, [si]  ; 将当前元素保存到AL中
        test al, 1  ; 检查当前元素是否为奇数
        jnz IS_ODD  ; 如果为奇数，跳转到IS_ODD标签
        add EVEN_SUM, al  ; 如果为偶数，将其加到偶数和上
        jmp NEXT_NUM  ; 跳转到处理下一个元素
    IS_ODD:
        add ODD_SUM, al  ; 如果为奇数，将其加到奇数和上
    NEXT_NUM:
        inc INDEX  ; 递增循环索引
        mov al, INDEX  ; 将循环索引保存到AL中
        cmp al, LEN  ; 判断循环索引是否达到数组长度
        jl CALC_LOOP  ; 如果循环索引小于数组长度，继续循环

        ; 计算偶数和减去奇数和的结果，结果保存在DL中
        mov al, EVEN_SUM
        sub al, ODD_SUM
        mov dl, al
        ;;//TEMPLATE END

;;//APPEND BEGIN
    call print_num  ; 显示结果
    mov ah,4CH  ; 设置DOS功能调用的子功能号为4CH（程序退出）
    int 21H

end start
;;//APPEND END