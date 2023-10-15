;;将 AX 寄存器中的数据按4位平均切分成 4 组，并且把每组数据分别放在 DL、 CL、 BL和 AL 中，如AX=4321H，操作后，DL=4，CL=3，BL=2，AL=1。（注意寄存器与高低位之间的对应）

;;输入描述
;;1.样例为十六进制形式输入，以空格符结尾，其中A~E均为大写，自己模拟数据在本地调试时注意！！！
;;2.08号调用无回显，自己模拟数据在本地调试时注意！！！
;;//PREPEND BEGIN ;;获取数据并存放在ax寄存器内，数据大小16位，且用16进制表示，如1234
.model small
.code
start:
  mov bx, 0

inputloop:   

  mov ah, 8   
  int 21h

  cmp al, 32  
  je startcalc

  mov ah, 0

  cmp al, '9'
  jbe convert_digit
  sub al, 7
convert_digit:
  sub al, '0'

  shl bx, 1   
  shl bx, 1   
  shl bx, 1   
  shl bx, 1   
  add bx, ax

  jmp inputloop

startcalc:
  mov ax, bx
;;//PREPEND END

;;//TEMPLATE BEGIN
    mov dl , ah
    and dl , 00f0h
    mov cl , 4
    shr dl , cl
    mov cl , ah
    and cl , 0fh
    push cx
    mov bl , al
    and bl , 00f0h
    mov cl , 4
    shr bl , cl
    pop cx
    and al , 0fh

;;//TEMPLATE END



;;//APPEND BEGIN   输出寄存器al、bl、cl、dl的数据
  mov si, dx
  
  cmp al, 9
  jbe output_digit_al
  add al, 7
output_digit_al:
  add al, '0'
  mov ah, 02h
  mov dl, al
  int 21h

  cmp bl, 9
  jbe output_digit_bl
  add bl, 7
output_digit_bl:
  add bl, '0'
  mov ah, 02h
  mov dl, bl
  int 21h

  cmp cl, 9
  jbe output_digit_cl
  add cl, 7
output_digit_cl:
  add cl, '0'
  mov ah, 02h
  mov dl, cl
  int 21h

  mov dx, si
  cmp dl, 9
  jbe output_digit_dl
  add dl, 7
output_digit_dl:
  add dl, '0'
  mov ah, 02h
  int 21h

	mov ah, 4ch
	int 21h
end start
;;//APPEND END