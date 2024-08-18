{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando
llega el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus
dígitos pares y la cantidad de dígitos impares que posee.}

program ejer8;
procedure ParImpar(num:integer; var suma:integer; var cant:integer);
var
    dig:integer;
begin
    dig:=0;
    while(num<>0)do begin
        dig:=num mod 10;
        if (dig mod 2=0)then
            suma:=suma+dig
        else
            cant:=cant+1;
        num:=num div 10;
    end;
end;

var
    numero, sumapar, cantimpar:integer;
begin
    numero:=0;
    sumapar:=0;
    cantimpar:=0;
    writeln('Ingrese un nuevo numero: ');
    readln(numero);
    while(numero<>123456)do begin
        sumapar:=0;
        cantimpar:=0;
        ParImpar(numero, sumapar, cantimpar);
        writeln('La suma de los digitos pares es: ', sumapar);
        writeln('La cantidad de digitos impares que posee es: ', cantimpar);
        writeln('Ingrese un nuevo numero: ');
        readln(numero);
    end;
end.
    
    
    
    
    






        