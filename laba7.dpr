program LR6;

{$APPTYPE CONSOLE}

const
  N = 10;

type
  TMat = array [1 .. N] of word;

function multip(x: word): boolean;
begin
  asm
    mov cx,10
    dec cx
    nextscan:
    mov bx,cx
    mov si,0

    nextcomp:

    mov al,[array+si]
    mov dl,[array+si+1]
    cmp dl,al

    jge noswap

    mov [array+si],dl
    mov [array+si+1],al

    noswap:
    inc si
    dec bx
    jnz nextcomp
    loop nextscan
  end;

  if x = 1 then
    result := true
  else
    result := false;

end;

var
  Arr: TMat;
  i, x, j: integer;

begin
  x := 0;
  randomize;
  write('Our array: ');
  for i := 1 to 10 do
  begin
    Arr[i] := random(20);
    write(Arr[i]:2, ' ');
  end;

  writeln;

  writeln('Modifiyed array');

  Writeln('Modifiyed array');
for i := 1 to 10 do
  begin
     if multip(Arr[i]) then
     begin
     write('7  ') ;
     Inc(x);
     end
     else
    write(Arr[i]:2,' ');
  end;
  writeln;
writeln('There are ',x,' elements, more then 7');
readln;
end.

  for i := 1 to N - 1 do
  begin
    for j := 1 to N - 1 do
      if Arr[j] > Arr[j + 1] then
      begin
        x := Arr[j + 1];
        Arr[j + 1] := Arr[j];
        Arr[j] := x;
      end;
    write(x, ' ');
  end;
  writeln;
  readln;

end.
