{ Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en
 TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
 La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura
 informar:
 ● Lacantidaddealumnos aprobados (nota 8 o mayor).
 ● Lacantidaddealumnos que obtuvieron un 7 como nota.}
 
program ejer3;
var
    cant8, cant7, nota:integer;
    nombre:string;
begin
    cant8:=0;
    cant7:=0;
    nota:=0;
    repeat
        writeln('Ingrese el nombre: ');
        readln(nombre);
        writeln('Ingrese la nota: ');
        readln(nota);
        if(nota>=8)then
            cant8:=cant8+1;
        if(nota=7)then
            cant7:=cant7+1;
    until(nombre='Zidane Zinedine');
    writeln('La cantidad de alumnos aprobados con 9 o superior fue de: ', cant8);
    writeln('La cantidad de alumnos que obtuvieron un 7 fue de: ', cant7);
end.