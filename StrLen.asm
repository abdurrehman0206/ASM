dosseg
printString macro s1
                lea dx , s1
                mov ah , 9
                int 21h
endm
printNumber macro n1
                mov dl , n1
                add dl , 48
                mov ah , 2
                int 21h
endm
takeInput macro i1
              mov ah , 1
              int 21h
              mov i1 , al
endm
.model small
.stack 100h
.data
    str    db 50 dup("$")
    inputM db "Enter a string : $"
    lenM   db "Length : $"
    len    db 0
.code
main proc
              mov         ax , @data
              mov         ds , ax
    ;taking input and counting the chars while inputing
              printString inputM
              lea         si , str
    inputLoop:
              takeInput   [si]
              cmp         al , 13
              jz          endInput
              inc         si
              inc         len
              jmp         inputLoop
    endInput: 
              call        endl
              printString lenM
              printNumber len
              call        endl
              
              mov         ah , 4ch
              int         21h
main endp
endl proc
              mov         dl , 10
              mov         ah , 2
              int         21h
              ret
endl endp
end main