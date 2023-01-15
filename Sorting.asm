dosseg
printString macro s1
                lea dx , s1
                mov ah , 9
                int 21h
endm
printNumber macro n1
                mov dl , n1
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
    arr         db 7 dup (?)
    arrayM      db "Sorted Array : $"
    arrayInputM db "Input Array : $"
    space       db 32 , "$"
    newline     db 10 ,13 , "$"
.code
main proc
               mov         ax , @data
               mov         ds , ax
               printString arrayInputM
               lea         si , arr
               mov         cx , 7
    inputLoop: 
               takeInput   [si]
               printString space
               inc         si
               loop        inputLoop
               printString newline
               printString arrayM
               mov         cx , 7
              
    outerLoop: 
               push        cx
               lea         si ,arr
               mov         cx , 7
    innerLoop: 
               mov         al , [si]
               mov         bl , [si+1]
               cmp         al , bl
               jl          next
               mov         [si] , bl
               mov         [si+1] , al
    next:      
               inc         si
               loop        innerLoop
               pop         cx
               loop        outerLoop
               lea         si , arr
               mov         cx , 7
    outputLoop:
               printNumber [si]
               printString space
               inc         si
               loop        outputLoop
               mov         ah , 4ch
               int         21h
main endp
end main
