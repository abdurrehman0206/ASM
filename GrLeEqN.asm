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
    num1     db ?
    num2     db ?
    inputM   db "Enter a number : $"
    equalM   db "Equal !$"
    greaterM db "1st number is greater !$"
    smallerM db "1st number is smaller !$"
.code
main proc
                 mov         ax , @data
                 mov         ds , ax
    ;taking input
                 printString inputM
                 takeInput   num1
                 call        endl
                 printString inputM
                 takeInput   num2
                 call        endl
    ;checking conditions
                 mov         al , num1
                 mov         bl , num2
                 cmp         al , bl
                 jz          equalLabel
                 jg          greaterLabel

                 printString smallerM
                 jmp         exitPro
    greaterLabel:
                 printString greaterM
                 jmp         exitPro
    equalLabel:  
                 printString equalM
                 jmp         exitPro

    exitPro:     
                 mov         ah , 4ch
                 int         21h
main endp
    ;Procedures
endl proc
                 mov         dl , 10
                 mov         ah , 2
                 int         21h
                 ret
endl endp
end main