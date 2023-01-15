dosseg
printString macro s1
                lea dx , s1
                mov ah , 9
                int 21h
endm
printNumber macro n1
                mov dl , n1
                or dl , 48
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
    binary db 0,1,0,1
    pows   db 8,4,2,1
    deci   db 0
    pow    dw 1
    two    db 2
.code
main proc
          mov         ax , @data
          mov         ds , ax

          mov         si , 0
          mov         cx , 4

    loop1:
          mov         al , binary[si]
          mov         bl , pows[si]
          mul         bl
          AAM
          add         deci , al
          inc         si
          loop        loop1
          mov         cx , 4
          printNumber deci
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
