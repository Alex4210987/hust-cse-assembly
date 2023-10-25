.model small
.stack
.data 
    Demi db 10,?,10 dup('$')
    Copy  db 10 dup('$')
    Reminder db "This is a copy",10,13,"$"

.code
start:
    mov ax,@data
    mov ds,ax
    lea dx, Demi
    mov ah,0ah
    int 21h
    call readAndPrint

    mov ah,4ch
    int 21h

readAndPrint proc
    lea si,Demi
    lea bx,Copy
    inc si
    inc si
    
CopyLoop:
    cmp byte ptr [si],'$'
    je print
    mov ch, byte ptr [si]
    mov byte ptr [bx],ch
    inc si
    inc bx
    loop CopyLoop

print:
    lea dx,Reminder
    mov ah,9
    int 21h
    lea dx,Copy
    mov ah,9
    int 21h
    ret

readAndPrint endp

end start