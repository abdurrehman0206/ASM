dosseg 
.model small
.stack 100h
.data
    arr  db 6000 dup(9)
.code
main proc
              mov  ax , @data
              mov  ds , ax
              mov  si , 0
              mov  ax , 0
              mov  cx , 6000
    loop1:    
              mov  bl , arr[si]
              mov  bh , 0
              add  ax , bx
              inc  si
              loop loop1

              mov  bx , 10
              mov  cx , 0
    seperator:
              mov  dx , 0
              div  bx
              push dx
              inc  cx
              test ax , ax
              jnz  seperator
    digitLoop:
              pop  dx
              add  dx , 48
              mov  ah , 2
              int  21h
              loop digitLoop
              mov  ah , 4ch
              int  21h
main endp
end main