{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura
 finaliza cuando se ingresa el legajo-1, que no debe procesarse. Por ejemplo: se lee la siguiente secuencia:
 33423
 8.40
 19003
 6.43-1
 En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo
 promedio fue 6.43, y finalmente el legajo-1 (para el cual no es necesario leer un promedio).
 Al finalizar la lectura, informar:
 a. Lacantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
 b. Lacantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1).
 c.
 El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor
 al valor 2500 (en el ejemplo anterior, se debería informar 0%).}
 
program ejer6;
var
    legajo, canta, cantp, cantd:integer;
    promedio, porcentaje:real;
begin
    legajo:=0;
    canta:=0;
    cantd:=0;
    cantp:=0;
    promedio:=0;
    porcentaje:=0;
    
    read(legajo);
    while(legajo<>-1)do begin
        read(promedio);
        canta:=canta+1;
        if(promedio>=6.5)then begin
            cantp:=cantp+1;
            if((promedio>=8.5)and(legajo<2500))then
                cantd:=cantd+1;
        end;
        read(legajo);
    end;
    writeln('La cantidad de alumnos leida fue de: ', canta);
    writeln('La cantidad de alumnos cuyo promedio supera un 6.5 fue de: ', cantp);
    
    porcentaje:=(cantd/canta)*100;
    
    writeln('El porcentaje de alumnos destacados fue de: ', porcentaje, '%');
end.
