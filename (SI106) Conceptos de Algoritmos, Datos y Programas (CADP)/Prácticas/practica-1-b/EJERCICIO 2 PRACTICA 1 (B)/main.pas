{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo: si se lee la
 secuencia: 3 5 6 2 3 10 98 8-12 9, deberáinformar:
 El mayor número leído fue el 98
 a. Modifique el programa anterior para que, además de informar el mayor número leído, se informe el
 número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo: si se lee la misma
 secuencia: 3 5 6 2 3 10 98 8-12 9, deberáinformar:
 El mayor número leído fue el 98, en la posición 7}
 
program ejer2;
var
    i, num, may, posmay:integer;
begin
    i:=0;
    num:=0;
    may:=0;
    posmay:=0;
    for i:=1 to 10 do begin
        readln(num);
        if(num>may)then begin
            may:=num;
            posmay:=i;
        end;
    end;
    writeln('El mayor numero leido fue ', may, ' en la posición ', posmay);
end.