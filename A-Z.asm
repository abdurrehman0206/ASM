dosseg
printChar macro c1
              mov dl , c1
              mov ah , 2
              int 21h
endm
.model small
.stack 100h
.data
    charCap   db 'A'
    charSmall db 'a'
.code
main proc
               mov       ax , @data
               mov       ds , ax
               mov       cx , 26
    printLoop1:
               printChar charCap
               inc       charCap
               call      space
               loop      printLoop1
               call      endl
               mov       cx , 26
    printLoop2:
               printChar charSmall
               inc       charSmall
               call      space
               loop      printLoop2
               mov       ah , 4ch
               int       21h
main endp
space proc
               mov       dl , 32
               mov       ah , 2
               int       21h
               ret
space endp
endl proc
               mov       dl , 10
               mov       ah , 2
               int       21h
               ret
endl endp
end main