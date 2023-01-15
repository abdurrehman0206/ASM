dosseg
.model small
.stack 100h
.data
    fibArray db 0,1,0,0,0,0,0
.code
main proc
               mov  ax , @data
               mov  ds , ax
               mov  si , 2
               mov  cx , 5
    loop1:     
               mov  al , fibArray[si-2]
               mov  bl , fibArray[si-1]
               add  al , bl
               mov  fibArray[si] , al
               inc  si
               loop loop1
               mov  cx , 7
               mov  si , 0
    outputLoop:
               mov  dl , fibArray[si]
               add  dl , 48
               mov  ah , 2
               inc  si
               int  21h
               loop outputLoop
               mov  ah , 4ch
               int  21h
main endp
end main