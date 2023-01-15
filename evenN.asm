dosseg
printString macro s1
                lea dx , s1
                mov ah , 9
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
    num1   db ?
    inputM db "Input a number : $"
    evenM  db "Number is even !$"
    oddM   db "Number is Odd !$"
.code
main proc
              mov         ax , @data
              mov         ds , ax
    ;taking input
              printString inputM
              takeInput   num1
              call        endl
    ;checking ODD / EVEN
    ;using bitwise AND
              mov         al , num1
              test        al , 1
              jz          evenLabel     ;if 1 that means even
    ;else print odd
              printString oddM
              call        endl
              jmp         exitPro
    evenLabel:
              printString evenM
              call        endl
    exitPro:  
              mov         ah , 4ch
              int         21h
main endp
space proc
              mov         dl , 32
              mov         ah , 2
              int         21h
              ret
space endp
endl proc
              mov         dl , 10
              mov         ah , 2
              int         21h
              ret
endl endp
end main