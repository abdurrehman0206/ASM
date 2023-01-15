dosseg
printStr macro s1
             lea dx , s1
             mov ah , 9
             int 21h
endm

.model small
.stack 100h
.data
    endl   db 10 , 13 ,"$"
    inputM db "Input a Number : $"
    nM     db "Numerator : $"
    dM     db "Denominator : $"
    qM     db "Quo : $"
    rM     db "Rem : $"
    n1     db ?
    n2     db ?
    d      db ?
    q      db ?
    r      db ?
.code
main proc
         mov      ax , @data
         mov      ds , ax
         printStr inputM
         mov      ah , 1
         int      21h
         sub      al , 48
         mov      n1 , al
         mov      ah , 1
         int      21h
         sub      al , 48
         mov      n2 , al
         printStr endl
         printStr inputM
         mov      ah , 1
         int      21h
         sub      al , 48
         mov      d , al
         mov      ah , n1
         mov      al , n2
         mov      bl , d
         AAD
         div      bl
         add      al , 48
         add      ah , 48
         mov      q ,al
         mov      r ,ah
         printStr endl
         printStr qM
         mov      dl , q
         mov      ah , 2
         int      21h
         printStr endl
         printStr rM
         mov      dl , r
         mov      ah , 2
         int      21h
         mov      ah , 4ch
         int      21h
main endp
end main