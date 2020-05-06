org 100h

      mov ah,09h
      mov dx,text0
      int 21h

      mov ah,0ah
      mov dx,stroka
      int 21h

      mov ah,[stroka+1]
      cmp ah,5
        jl BadStroka

      mov ah,[stroka+2]
      mov bh,[stroka+6]
      cmp ah,bh
      jne BadStroka

      mov ah,[stroka+6]
      cmp ah,'0'
     jl  BadStroka
      cmp ah,'9'
     jg  BadStroka


       mov ah,[stroka+1]
       sub ah,2
          cmp ah,'A'
     jge    comp
    comp:      cmp ah,'Z'
     jg     BadStroka


          mov ah,09h
          mov dx,goodtext
          int 21h
       
      mov ah, 08h
      int 21h
      ret


   BadStroka:
    
          mov ah,09h
          mov dx,badtext
          int 21h
     
      mov ah, 08h
      int 21h
      ret

;//
stroka db 9,0,9 dup("$")


text0 db ' Plese,enter your string:  $'
badtext db  'Yes                                                                           $'
goodtext db 'No                                                                            $'
