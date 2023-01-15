dosseg
printString macro s1
                lea dx , s1
                mov ah , 9
                int 21h
endm
printNumber macro n1
                mov dx , n1
                add dx , 48
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
    endl       db 10 , '$'
    binaryM    db "Input Binary Number [8-BITS] : $"
    deciM      db "Decimal : $"
    binary     db 8 dup(?)
    digitCount db 0

.code
main proc
               mov         ax , @data
               mov         ds , ax
    resetLoop: 
               printString endl
               printString binaryM
               mov         cx , 8
    inputLoop: 
               takeInput   al
               cmp         al , '2'
               jae         resetLoop
               cmp         al , '0'
               jb          resetLoop
               sub         al , 48
               sal         bx ,1
               or          bl , al
               loop        inputLoop
               printString endl
               mov         ax , bx
               mov         bx , 10
    splitLoop: 
               mov         dx , 0
               div         bx
               inc         digitCount
               push        dx
               cmp         ax , 0
               jnz         splitLoop
               printString deciM
               mov         cl , digitCount
    outputLoop:
               pop         dx
               printNumber dx
               loop        outputLoop
               mov         ah , 4ch
               int         21h
main endp
end main