dosseg
printString macro s1
                  lea dx , s1
                  mov ah , 9
                  int 21h
endm
printNumber macro n1
                  mov dl , n1
                  or  dl , 48
                  mov ah , 2
                  int 21h
endm
.model small
.stack 100h
.data
      arr      db 1,9,8,6,5
      arrayM   db "Array : $"
      largestM db "Largest Number : $"

.code
main proc
            mov         ax , @data
            mov         ds , ax
            printString arrayM
            lea         si , arr
            mov         bl , [si]
            mov         cx , 5
      loop1:
            printNumber [si]
            cmp         bl , [si]
            jg          next
            mov         bl , [si]
      next: 
            inc         si
            loop        loop1

            call        endl
            printString largestM
            printNumber bl

            mov         ah , 4ch
            int         21h
main endp

endl proc
            mov         dl , 10
            mov         ah , 2
            int         21h
            ret
endl endp
end main
