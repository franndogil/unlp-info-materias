{ 5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el
 número 100, el cual debe procesarse. Informar en pantalla:
 ● Elnúmeromáximoleído.
 ● Elnúmeromínimoleído.
 ● Lasumatotaldelosnúmeros leídos.}
 
program ejer5;
var
    num, max, min, suma:integer;
begin
    num:=0;
    max:=0;
    min:=10000;
    suma:=0;
    repeat
        writeln('Ingrese un numero: ');
        readln(num);
        suma:=suma+num;
        if(num>max)then
            max:=num;
        if(num<min)then
            min:=num;
    until(num=100);
    writeln('La suma de los numeros dio: ', suma);
    writeln('El numero maximo leido fue: ', max);
    writeln('El numero minimo leido fue: ', min);
end.