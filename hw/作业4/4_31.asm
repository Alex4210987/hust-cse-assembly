;write a assembly subroutine to calculate the value of the fuction f(x)=x^n
.model small
.stack 100h
.data
    x dw 3 ;value of x
    n dw 3 ;value of n
.code
    
main:    
    .startup
    mov ax,x
    mov bx,n
    call power
    call print_ax
    mov ax,4c00h
    int 21h

power proc 
    ;use incurssion to calculate the power of x
    ;ax=x,bx=n

    cmp bx,1
    je exit
    dec bx
    call power
    mul x

exit:
    ret

power endp

print_ax proc
    push ax
    push cx
    push dx
    push ax

    mov dl, al
    mov cl, 4
    shr dl, cl
    or dl, 30h
    cmp dl, 39h
    jbe aldisp1
    add dl, 7

aldisp1:
    mov ah, 2
    int 21h

    pop dx
    and dl, 0fh
    or dl, 30h
    cmp dl, 39h
    jbe aldisp2
    add dl, 7

aldisp2:
    mov ah, 2
    int 21h

    pop dx
    pop cx
    pop ax
    ret
print_ax endp

end main