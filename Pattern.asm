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
    endl db 10,13,"$"
    char db 'a'
.code
main proc
              mov         ax , @data
              mov         ds , ax
    ;printing pattern
              mov         cx , 5
              mov         bx , 1
    outerLoop:
              push        cx
              mov         cx , bx
              
    innerLoop:
              printChar   char
                
              loop        innerLoop
              printString endl
              inc         char
              inc         bx
              pop         cx
              loop        outerLoop
              mov         ah , 4ch
              int         21h
main endp
end main
