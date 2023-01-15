dosseg

printMsg macro m1
             lea dx ,  m1
             mov ah , 9
             int 21h
endm
.model small
.stack 100h
.data
    inp     db "Decimal Number : $"
    bnum    db "Binary : $"
    deciNum db 0
    two     dw 2                       ;binary base
    rem     db ?                       ;for saving remainder
.code
main proc
                    mov      ax , @data
                    mov      ds , ax
    ;taking input
                    printMsg inp
                    mov      ah ,1
                    int      21h
    ;storing the input in the variable
                    sub      al , 48
                    mov      deciNum , al
    ;converting binary to decimal requires constantly dividing the number by 2
    ;saving the remainder of the division and when the number becomes zero
    ;print the remainder in reverse order
    ;to print an input in reverse order stack is used

    ;conversion loop
                    mov      dx , 0
                    mov      al , deciNum
                    mov      cx , 4             ;since we are only considering 0 to 9  we can run the loop 4 times to get 4 bits of binary
    ;BCD
                  
    divTillZeroLoop:
                    mov      ah ,0              ;setting ax = [ ah | al ] ->> [ 0 | decinum ]
                    div      two                ;dividing the decimal number by 2
                    push     dx                 ;saving the results in the stack as dx = [dh | dl] = [remainder | quotient]
                    loop     divTillZeroLoop

    
                    call     newline
    ;loop will run till the lenght of binary num saved above in cx
                    printMsg bnum
                    mov      cx , 4
    outputNumLoop:  
                    pop      dx
                    add      dx , 48
                    mov      ah , 2
                    int      21h
                    loop     outputNumLoop
    ;exit
                    mov      ah , 4ch
                    int      21h
main endp
newline proc
                    mov      dl , 10
                    mov      ah , 2
                    int      21h
                    ret
newline endp
end main
