dosseg
;macro for displaying string
displayStr macro s1
                 lea dx , s1
                 mov ah , 9
                 int 21h
endm
;macro for displaying char
displayChar macro c1
                  mov dl , c1
                  add dl , 48
                  mov ah , 2
                  int 21h
endm
.model small
.stack 100h
.data
      inputM db "Input a number : $"
      bNa    db 4 dup(?)
      bM     db "Binary Number : $"
      dM     db "Decimal Number : $"
      ;first 8 bit variable for numerator
      n1     db ?
      ;second 8 bit variable for numerator
      n2     db ?
      d      db 2
      r      dw ?
    
.code
main proc
            mov         ax , @data
            mov         ds , ax
            displayStr  inputM
            mov         ah , 1
            int         21h
            sub         al ,48
            mov         n1 , al
            mov         ah , 1
            int         21h
            sub         al ,48
            mov         n2 , al
            call        endl
            displayStr  dM
            displayChar n1
            displayChar n2
            call        endl
            displayStr  bM
            lea         si , bNa
      ;loop to convert decimal to binary
      ;saving in array
            
            mov         ah , n1
            mov         al , n2
            mov         cx , 0
      loop1:
            AAD
            div         d
            mov         [si] , ah
            mov         ah ,  0
            inc         si
            inc         cx
            cmp         ax , 0
            jnz         loop1
      ;displaying array in reverse
      exit: 
            dec         si
      loop2:
            mov         al , [si]
            displayChar al
            dec         si
            loop        loop2
            call        endl

            mov         ah , 4ch
            int         21h
      ;procedure for new line
endl proc
            mov         dl , 10
            mov         ah , 2
            int         21h
            ret
endl endp
main endp
end main