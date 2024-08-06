{9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número
de inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par}

program ejer9;
procedure amaschicos(a:string; n:integer; var a1:string; var n1:integer; var a2:string; var n2:integer);
begin
    if(n<=n2)then begin
        if(n<=n1)then begin
            n2:=n1;
            a2:=a1;
            n1:=n;
            a1:=a;
        end
        else begin
            n2:=n;
            a2:=a;
        end;
    end;
end;

procedure nmas(no:string; n:integer; var no1:string; var n1:integer; var no2:string; var n2:integer);
begin
    if(n>=n2)then begin
        if(n>=n1)then begin
            n2:=n1;
            no2:=no1;
            n1:=n;
            no1:=no;
        end
        else begin
            n2:=n;
            no2:=no;
        end;
    end;
end;

procedure cantpar(n:integer; var cant:integer);
begin
    if(n mod 2=0)then
        cant:=cant+1;
end;

var
    i, numero, cantidad, nn1, nn2, na1, na2:integer;
    porcentaje:real;
    apellido, nombre, apellido1, apellido2, nombre1, nombre2:string;
    
begin
    numero:=0;
    cantidad:=0;
    nn1:=0;
    nn2:=0;
    na1:=10000;
    na2:=10000;
    i:=0;
    porcentaje:=0;
    
    for i:=1 to 1200 do begin
        writeln('Ingrese el nombre:');
        readln(nombre);
        writeln('Ingrese el apellido:');
        readln(apellido);
        writeln('Ingrese el numero de inscripción:');
        readln(numero);
        
        cantpar(numero, cantidad);
        amaschicos(apellido, numero, apellido1, na1, apellido2, na2);
        nmas(nombre, numero, nombre1, nn1, nombre2, nn2);
    end;
    porcentaje:=(cantidad/1200)*100;
    writeln('Porcentaje de alumnos con nro de inscripción par: ', porcentaje, '%');
    writeln('Nombres de los dos alumnos con nro de inscripción mas grande: ',nombre1,' y ',nombre2);
    writeln('Apellidos de los dos alumnos con nro de inscripción mas chico: ', apellido1,' y ',apellido2);
end.
    