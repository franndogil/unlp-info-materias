{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día del mes,
los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se lee el monto 0. Se
asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas
de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor cantidad
de ventas.
}

program ejer8;
var
    monto, montomes:real;
    i, cant:integer;
begin
    i:=0;
    monto:=0;
    montomes:=0;
    cant:=0;
    for i:=1 to 2 do begin
        cant:=0;
        repeat
            monto:=0;
            writeln('Ingrese el monto de la venta realizada del dia n°', i, ':');
            readln(monto);
            if(monto<>0)then
                cant:=cant+1;
            montomes:=montomes+monto;
        until(monto=0);
        writeln('Cantidad de ventas realizadas:', cant);
    end;
    writeln('Monto total acumulado en ventas: ', montomes);
end.
