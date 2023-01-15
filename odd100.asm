dosseg
.model small
.stack 100h
.data
.code
main proc
mov ax , 0
mov cx , 1

sumLoop:
add ax , cx
add cx , 2
cmp cx , 99
jbe sumLoop

mov bx , 10
mov cx , 0
separator:
mov dx , 0
div bx
push dx
inc cx
test ax , ax
jnz separator

digitLoop:
pop dx
add dx , 48
mov ah , 2
int 21h
loop digitLoop
mov ah , 4ch
int 21h

main endp
end main