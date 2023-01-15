dosseg
printStr macro s1
             lea dx , s1
             mov ah , 9
             int 21h
endm
printNum macro n1
             mov dl , n1
             add dl , 48
             mov ah , 2
             int 21h
endm
.model small
.data
    line    db 10 , 13 , "$"
    inputM1 db "Input a string : $"
    inputM2 db "Input a charachter : $"
    len     db 0
    cnt     db 0
    str     db 50 dup("$")
    char    db ?
.code
main proc
              mov      ax , @data
              mov      ds , ax
              printStr inputM1
              mov      si , 0
    inputLoop:
              mov      ah,1
              int      21h
              cmp      al , 13
              jz       exitInput
              mov      str[si] , al
              inc      si
              inc      len
              jmp      inputLoop
    exitInput:
              printStr inputM2
              mov      ah , 1
              int      21h
              mov      char , al
              mov      si , 0
              mov      cl , len
              
    checkLoop:
              mov      al , str[si]
              cmp      al, char
              jne      next
              inc      cnt
    next:     
              inc      si
              loop     checkLoop
              printStr line
              mov      dl , cnt
              or       dl , 48
              mov      ah , 2
              int      21h
              
              mov      ah , 4ch
              int      21h
main endp
end main