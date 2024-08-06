program ejer6;
procedure Lectura;
var
    num, par:integer;
begin
    num:=0;
    par:=0;
    writeln('Ingrese un numero:');
    readln(num);
    while(num>=0)do begin
        if(num MOD 2=0)then
            if(num>par)then
                par:=num;
        writeln('Ingrese un nuevo numero:');
        readln(num);
    end;
    writeln('El numero par mas alto fue:');
    writeln(par);
end;

begin
    Lectura;
end.