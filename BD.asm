dosseg
printStr macro s1
             lea dx , s1
             mov ah , 9
             int 21h
endm
printChar macro c1
              mov dl , c1
              mov ah , 2
              int 21h
endm
printNum macro n1
             mov dl , n1
             add dl , 48
             mov ah , 2
             int 21h
endm
.model small
.stack 100h
.data
    endl    db 10 , 13 , "$"
    binaryM db "Input a Binary Number : $"
    deciM   db "Decimal : $"
.code
main proc
              mov      ax , @data
              mov      ds , ax
    resetLoop:
              printStr endl
              printStr binaryM
              mov      bx , 0
              mov      cx , 8
    inputLoop:
              mov      ah , 1
              int      21h
              cmp      al , '1'
              ja       resetLoop
              cmp      al , '0'
              jb       resetLoop
              sub      al , 48
              sal      bx ,1
              add      bl , al
              loop     inputLoop
              printStr endl
              mov      ax , bx
              mov      bx , 10
              mov      cx , 0
    seperator:
              mov      dx , 0
              div      bx
              push     dx
              inc      cx
              test     ax , ax
              jnz      seperator
              printStr deciM
    digitLoop:
              pop      dx
              printNum dl
              loop     digitLoop
              mov      ah , 4ch
              int      21h
main endp
end main