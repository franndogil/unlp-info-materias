{ 7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los autos se
 lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera participaron 100
 autos. Informar en pantalla:
 ● Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
 ● Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program ejer7;
var
    nombre, nombre1, nombre2, nombre99, nombre100:string;
    i, tiempo, tiempo1, tiempo2, tiempo99, tiempo100:integer;
begin
    i:=0;
    tiempo:=0;
    tiempo1:=10000;
    tiempo2:=10000;
    tiempo99:=0;
    tiempo100:=0;
    for i:=1 to 4 do begin
        writeln('Ingrese el nombre: ');
        readln(nombre);
        writeln('Ingrese el tiempo: ');
        readln(tiempo);
        if(tiempo<tiempo2)then begin
            if(tiempo<tiempo1)then begin
                tiempo2:=tiempo1;
                nombre2:=nombre1;
                tiempo1:=tiempo;
                nombre1:=nombre;
            end
            else begin
                tiempo2:=tiempo;
                nombre2:=nombre;
            end;
        end;
        if (tiempo>tiempo99)then begin
            if(tiempo>tiempo100)then begin
                tiempo99:=tiempo100;
                nombre99:=nombre100;
                nombre100:=nombre;
                tiempo100:=tiempo;
            end
            else begin
                tiempo99:=tiempo;
                nombre99:=nombre;
            end;
        end;
    end;
    writeln('Primer puesto: ',nombre1);
    writeln('Segundo puesto: ',nombre2);
    writeln('Ante ultimo puesto: ',nombre99);
    writeln('Ultimo puesto: ',nombre100);
end.
