dosseg
.model small
.stack 100h
.data
    binary db 0,1,0,1    ; Binary Number
    deci   db 0
    res    db ?
    pw     db ?
.code
main proc
             mov  ax , @data
             mov  ds , ax
             mov  si , offset binary
             mov  cx ,'3'
             mov  pw , 3
    loop1:   
    ;saving cx
             push cx
    ;getting power
             mov  cl , pw
             cmp  cl , 0
             jnz  continue
             mov  res , 1
             jmp  endPow
    continue:
             mov  al , 1
             mov  bl , 2        
             mov  cl , pw
    pLoop:   
             mul  bl
             loop pLoop
             mov  res , al
    endPow:  
    ;saving power and multiplying the positional bit
             mov  al , res
             mov  bl , [si]
             mul  bl
             add  deci ,al
             inc  si
             dec  pw
    ;popping original cx back
             pop  cx
             dec  cx
             cmp  cx , '/'
             jg   loop1
             mov  dl , deci
             add  dl , 48
             mov  ah , 2
             int  21h
             mov  ah , 4ch
             int  21h
main endp
end main
