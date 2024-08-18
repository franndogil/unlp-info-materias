{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
 a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}
 
program ejer1;
var
    i, num, suma, cant:integer;
begin
    i:=0;
    num:=0;
    suma:=0;
    cant:=0;
    for i:=1 to 10 do begin
        readln(num);
        suma:=suma+num;
        if(num>5)then
            cant:=cant+1;
    end;
    writeln('La suma de los numeros dió: ', suma);
    writeln('La cantidad de numeros mayores a 5 fue de: ', cant);
end.