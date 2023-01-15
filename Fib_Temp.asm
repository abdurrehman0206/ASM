dosseg
printNum macro n1
             mov dl , n1
             add dl , 48
             mov ah , 2
             int 21h
endm
.model small
.stack 100h
.data
    fib0 db 0
    fib1 db 1
.code
main proc
          mov      ax , @data
          mov      ds , ax
    ;fib(2) = fib(2-1) + fib(2-2)
    ;next number is sum of previous 2
    ;printing first 2 numbers
          printNum fib0          ;0
          printNum fib1          ;1
          mov      si , 2
          mov      cx , 5
    loop1:
          mov      al , fib0
          mov      bl , fib1
          add      al , bl       ;al get the current num
          mov      fib1 , al     ;updating second previous for the next time
          mov      fib0 , bl     ;updating previous num for the next time
          printNum al
          loop     loop1
          mov      ah , 4ch
          int      21h
main endp
end main