org    100h

start:      
        mov  AX,11h      
        int  10h   
     
        MOV  AH,0CH   
        MOV  AL,3  
  
        mov  CX, 100    ; X
        mov  DX, 99    ; Y
  
label_1:      
  
        inc  dx
        int  10h   
  
        cmp  dx, 200
        jle  label_1
                     ; X=100, Y=200

        mov  DX, 100    ; Y
label_2:

        inc  cx
        int  10h   
  
        cmp  cx, 200
        jle  label_2
                    ; X=200, Y=100



   mov  DX, 100    ; Y

label_3:
  
        inc  dx
        int  10h   
  
        cmp  dx, 200
        jle  label_3
                    ; X=200, Y=200


   mov  CX, 100    ; X
   mov  DX, 201    ; Y

label_4:

        inc  cx
        int  10h   
  
        cmp  cx, 200
        jle  label_4
                    ; X=200, Y=200


    MOV ah,0  
    INT 16h

   mov ah, 1  ; Пауза
   int 21h

        mov ax,4C00h
        int 21h
        mov ax,3
        int 10h

    ret