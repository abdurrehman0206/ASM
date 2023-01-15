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
.stack 100h
.data
      endl    db 10 , 13 , "$"
      binaryM db "Binary : $"
      deciM   db "Input a Decimal Number : $"
      n1      db ?
      n2      db ?
.code
main proc
                mov      ax , @data
                mov      ds , ax
                printStr deciM
                mov      ah , 1
                int      21h
                sub      al , 48
                mov      n1 , al
                mov      ah , 1
                int      21h
                sub      al , 48
                mov      n2 , al
                mov      ah , n1
                mov      al , n2
                AAD
                mov      bx , 2
                mov      cx , 0
      seperator:
                mov      dx , 0
                div      bx
                push     dx
                inc      cx
                test     ax , ax
                jnz      seperator
                printStr endl
                printStr binaryM
      digitLoop:
                pop      dx
                printNum dl
                loop     digitLoop
                mov      ah , 4ch
                int      21h
main endp
end main