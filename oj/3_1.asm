;PREPEND BEGIN
	.model small
	.stack
	.data
	.code
start:
	mov ah, 08h
    int 21h
    sub al, '0'
	xor ah,ah
	call ditui1
	call print_ax
;******exit******
    mov ax, 4c00h
    int 21h
;******exit******
;PREPEND END
;TEMPLATE BEGIN
;ax=n 寄存器ax传递参数   
ditui1 proc
;ditui1
;***begin****
; 递归子程序
    cmp ax, 0     ; 如果n为0，结果为0
    je ditui1_exit
    cmp ax, 1     ; 如果n为1，结果为1
    je ditui1_exit
    cmp ax, 2     ; 如果n为2，结果为2
    je ditui1_exit
    ; 计算 F(n) = F(n - 1) + F(n - 2)
    push ax       ; 保存 n
    dec ax        ; 计算 F(n - 1)
    call ditui1
    pop cx        ; 恢复 n
    push ax       ; 保存 F(n - 1)
    dec cx        ; 计算 F(n - 2)
    dec cx
    mov ax, cx
    call ditui1
    pop cx        ; 恢复 F(n - 1)
    add ax, cx    ; 计算 F(n) = F(n - 1) + F(n - 2)

ditui1_exit:
    ret
;****end******
ditui1 endp
;TEMPLATE END
;APPEND BEGIN
print_ax proc
	push ax	;过程中使用了AX、CX和DX
	push cx
	push dx
	push ax	;暂存ax
	mov dl,al	;转换al的高4位
	mov cl,4
	shr dl,cl
	or dl,30h	;al高4位变成3
	cmp dl,39h
	jbe aldisp1
	add dl,7	;是0Ah～0Fh，还要加上7
aldisp1:	mov ah,2	;显示
	int 21h
	pop dx	;恢复原ax值到dx
	and dl,0fh	;转换al的低4位
	or dl,30h
	cmp dl,39h
	jbe aldisp2
	add dl,7
aldisp2:	mov ah,2	;显示
	int 21h
	pop dx
	pop cx
	pop ax
	ret	;过程返回
print_ax endp
end start
;//APPEND END
