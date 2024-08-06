{ Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos uno de
 ellos no lo era. Por ejemplo:
 ○ Siseleen los caracteres “a e o”, deberá informar:
 ○ Siseleen los caracteres “z a g”, deberá informar:
 Los tres son vocales
 Al menos un carácter no era vocal}
 
 
program ejer8;
var
    c1, c2, c3:char;
    cant:integer;
begin
    cant:=0; //la inicializo
    write('Ingrese el primer caracter:');
    readln(c1);
    write('Ingrese el segundo caracter:');
    readln(c2);
    write('Ingrese el tercer caracter:');
    readln(c3);
    
    if((c1='a')or(c1='e')or(c1='i')or(c1='o')or(c1='u'))then
        cant:=cant+1;
    if((c2='a')or(c2='e')or(c2='i')or(c2='o')or(c2='u'))then
        cant:=cant+1;
    if((c3='a')or(c3='e')or(c3='i')or(c3='o')or(c3='u'))then
        cant:=cant+1;
    
    if(cant=3)then
        writeln('Los tres son vocales')
    else
        writeln('Al menos un carácter no era local');
end.
