 org 100h




intmain:
mov ah,09h      ;функция для вывода сообщения
mov dx,Mes_F    ; в dx кладём наше сообщение
int 21h
call input
mov [F],dx


call NextLine

mov ah,09h      ;функция для вывода сообщения
mov dx,Mes_E    ; в dx кладём наше сообщение
int 21h
call input
mov [E],dx



call NextLine

xor dx,dx
mov dx,[F]
push dx

xor dx,dx
mov dx ,[E]
push dx

call StackCounting


call NextLine
call output


mov ah,08h  ;функция ожидания символа ( позволяет оставить консоль открытой )
int 21h

ret     ;передаём управление ос
;
;
;
input:

xor bx,bx ;очищаем регистр bx
mov bl,10 ; т.к. будем вводить по 1 символу то результат будем умножать на 10
mov ch,0

mov ah,01h ; ввоd 1 символа
int 21h  ;в al
cmp al,13 ;сравниваем его с enter (если нажат энтер значит ввод закончен)
sub al,48 ;цифра из символа
mov cl,al ; дх хранит всё число

 inp_cycle:

   mov ah,01h ;  ввод символ
   int 21h  ;вводимый символ заноcится в al
   cmp al,13
   je end_cycle ;прыжок если =
   sub al,48 ;получаем цифру из вводимого символа (см табл аски)
   mov ah,0  ; чистка ах старший бит
   xchg ax,cx  ;увеличиваем разряд
   mul bx
   add cx,ax
   jmp inp_cycle

end_cycle:
mov dx,cx
ret
;
;
;
NextLine:
mov ah,09h
mov dx,NewLine
int 21h
ret
;
;
;
StackCounting:
xor cx,cx
mov bx,16
 
isDiv: xor dx,dx
div bx
push dx
inc cx;считаем количество цифр
jnz isDiv
 
isOut: pop bx
or al,30h
int 29h
loop isOut


;mul bx
loopik:
add word  [Result], ax
jnc R
add word [Result+2],1
R:
add word [Result+2], dx
loop loopik
pop bp
ret 4
;
;
;
output:

.data:
mov ah,09h
mov dx,Mes_R
int 21h
xor ebx,ebx
mov bl,10
mov cx,0
xor eax,eax
mov eax,[Result]
mov dh,0


CIKL:
xor edx,edx
div ebx
push dx
inc cx
cmp eax,0

jne CIKL


mov ah,02h

CIKL2:
pop dx
add dl,48
int 21h
loop CIKL2


ret




NewLine db  10,13,'$'
Mes_E db 'Enter E: $'
Mes_F db 'Enter F: $'
Mes_R db 'Result is : $'
E dw ?
F dw ?
Result dd ?
