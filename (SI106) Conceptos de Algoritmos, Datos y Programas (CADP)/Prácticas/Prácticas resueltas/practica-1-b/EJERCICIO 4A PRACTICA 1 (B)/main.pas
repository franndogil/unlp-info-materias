{ 4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos
 números mínimos leídos.
 a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el
 número 0, el cual debe procesarse.
 b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el
 número 0, el cual no debe procesarse.}
 
program ejer4;
var
    i, num, min1, min2:integer;
begin
    i:=0;
    num:=1;
    min1:=1000;
    min2:=1000;
    repeat
        writeln('Ingrese un numero:');
        readln(num);
        if(num<min2)then begin
            if(num<min1)then begin
                min2:=min1;
                min1:=num;
            end
            else
                min2:=num;
        end;
    until(num=0);
    writeln('Los numeros mas chicos leidos son: ', min1,' y ', min2);
end.