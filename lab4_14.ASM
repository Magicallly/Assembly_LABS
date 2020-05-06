org 100h
Start:

mov cx, 9
mov di, String
mov al, 'k'

Comp:

REPNE SCASB
cmp cx, 0
jz StopComp
dec di
add [di], byte 1
inc di
mov al, 'k'
jmp Comp
StopComp:
mov ah, 09h
mov dx, String
int 21h

mov ah, 08h
int 21h
ret


String: db "ksdalkku$" ;; 9s