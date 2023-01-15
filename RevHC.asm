dosseg
printChar macro c1
              mov dl , c1
              mov ah , 2
              int 21h
endm
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
    endl    db 10 , "$"
    str     db "Hello world ! $"
    inputM  db "Input a string : $"
    strM    db "String : $"
    revStrM db "Reverse : $"
    len     db 0
.code
main proc
              mov         ax , @data
              mov         ds , ax
              lea         si , str
    countLoop:
              mov         al , [si]
              cmp         al , '$'
              jz          endInput
              inc         len
              inc         si
              jmp         countLoop
    endInput: 
              push        si
              printString endl
              printString strM
              printString str
              printString endl
              printString revStrM
    ;reverse loop
              pop         si
              dec         si
              mov         cl , len
    revLoop:  
              printChar   [si]
              dec         si
              loop        revLoop
              mov         ah , 4ch
              int         21h
main endp
end main
