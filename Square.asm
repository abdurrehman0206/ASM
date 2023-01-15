dosseg
.model small
.stack 100h
.data
.code
main proc 


mov ah , 05h
mov al , 1
int 10h
mov ah , 06h
mov al , 12
mov cl , 0
mov dl , 24
mov ch , 24
mov dh , 48
mov bh , 0110000b
int 10h
mov ah , 4ch
int 21h
main endp
end main