dosseg
printStr macro s1
             lea dx , s1
             mov ah , 9
             int 21h
endm
.model small
.data
    n      db ?
    d      db ?
    inputM db "Input a Number : $"
    endl   db 10 , 13 , "$"
    n1m    db "1st Number : $"
    n2m    db "2nd Number: $"
    pro    db ?
    car    db ?
.code
main proc
         mov      ax , @data
         mov      ds , ax
         printStr inputM
         mov      ah , 1
         int      21h
         sub      al , 48
         mov      n , al
         printStr endl
         printStr inputM
         mov      ah , 1
         int      21h
         sub      al , 48
         mov      d , al
         mov      al , n
         mov      bl , d
         mul      bl
         aam
         add      ah , 48
         add      al , 48
         mov      pro , ah
         mov      car , al
         printStr endl
         mov      dl , pro
         mov      ah , 2
         int      21h
         mov      dl , car
         mov      ah , 2
         int      21h

main endp
end main