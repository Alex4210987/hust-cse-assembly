section .data
    result resb 4      ; 存储计算结果

section .text
    global ditui1

ditui1:
    ; 保存寄存器
    push ebx
    push ecx
    push edx

    ; 设置 F(0) 和 F(1)
    mov ebx, 0
    mov ecx, 0
    mov edx, 1

    ; 特殊情况：如果 n 是 0 或 1，则结果是 n
    cmp eax, 0
    je done
    cmp eax, 1
    je done

loop_start:
    ; 计算 F(n) = F(n-1) + F(n-2)
    mov ebx, edx
    add edx, ecx
    mov ecx, ebx

    dec eax

    ; 继续循环直到 n 减小到 1
    jnz loop_start

done:
    ; 存储结果
    mov eax, edx
    
    ; 返回结果
    pop edx
    pop ecx
    pop ebx
    ret


;0,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597
