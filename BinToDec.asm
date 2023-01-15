dosseg
printString macro s1
                lea dx , s1
                mov ah , 9
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

    digitCount db 0
    deci       DB 5 dup("$")
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
                add          bl , al
                loop        inputLoop
                printString endl
                mov         ax , bx
                mov         bx, 10         ; divisor
                xor         cx , cx        ; CX=0 (number of digits)

    First_Loop: 
                xor         dx , dx        ; Attention: DIV applies also DX!
                div         bx             ; DX:AX / BX = AX remainder: DX
                push        dx             ; LIFO
                inc         cx             ; increment number of digits
                test        ax, ax         ; AX = 0?
                jnz         First_Loop     ; no: once more
                lea         di, deci       ; target string DECIMAL
    Second_Loop:
                pop         ax             ; get back pushed digit
                or         al, 48         ; AL to ASCII
                mov         [di], al       ; save AL
                inc         di             ; DI points to next character in string DECIMAL
                loop        Second_Loop    ; until there are no digits left
                printString deci
                mov         ah , 4ch
                int         21h
          
main endp
end main

