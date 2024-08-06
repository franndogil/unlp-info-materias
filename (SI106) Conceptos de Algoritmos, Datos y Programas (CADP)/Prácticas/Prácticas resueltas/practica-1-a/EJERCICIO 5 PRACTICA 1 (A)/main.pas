{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números reales.
 La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo número, en cuyo
 caso deberá informarse: No se ha ingresado el doble de X}

program ejer5;
var
    n1, doble:real;
    cant:integer;
begin
    cant:=0; n1:=0; doble:=0;
    read(n1);
    doble:=n1*2;
    while((n1<>doble) and (cant<10))do begin
        read(n1);
        if(n1<>doble)then
            cant:=cant+1;
    end;
    if(cant=10)then
        writeln('No se ha ingresado el doble de X');
end.
