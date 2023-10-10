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
push ax 
call ditui1
pop ax
call print_ax
;******exit******
    mov ax, 4c00h
    int 21h
;******exit******
;PREPEND END
;TEMPLATE BEGIN   
ditui1 proc
;***begin****
	;保存当前帧的栈指针和bx、cx寄存器
    push bp      
    mov bp, sp    
    push bx
    push cx

	;小于3的情况，直接返回
    mov ax, [bp + 4]
    cmp ax , 3
    jle less_than_3

	;计算F(n-1)并保存在Cx中
    mov bx , ax
    dec bx
    push bx
    call ditui1
    pop cx

	;计算F(n-2)并保存在Ax中
    dec bx      
    push bx    
    call ditui1   
    pop ax
    add ax , cx

;出口
less_than_3:
    mov [bp+4] , ax
    pop cx
    pop bx
    mov sp , bp
    pop bp           
    ret             
;****end******
;TEMPLATE END
ditui1 endp
;APPEND BEGIN
print_ax proc
push ax ;过程中使用了AX、CX和DX
push cx
push dx
push ax ;暂存ax
mov dl,al ;转换al的高4位
mov cl,4
shr dl,cl
or dl,30h ;al高4位变成3
cmp dl,39h
jbe aldisp1
add dl,7 ;是0Ah～0Fh，还要加上7
aldisp1: mov ah,2 ;显示
int 21h
pop dx ;恢复原ax值到dx
and dl,0fh ;转换al的低4位
or dl,30h
cmp dl,39h
jbe aldisp2
add dl,7
aldisp2: mov ah,2 ;显示
int 21h
pop dx
pop cx
pop ax
ret ;过程返回
print_ax endp
end start
;//APPEND END