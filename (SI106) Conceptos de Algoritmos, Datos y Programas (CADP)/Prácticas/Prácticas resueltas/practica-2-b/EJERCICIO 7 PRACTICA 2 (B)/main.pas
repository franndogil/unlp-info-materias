{7. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10,
el cual debe procesarse}

program ejer7;
procedure operador(num:integer; var cant:integer; var suma:integer);
var
    dig:integer;
begin
    dig:=0;
    while(num<>0)do begin
        dig:=num mod 10;
        cant:=cant+1;
        suma:=suma+dig;
        num:=num div 10;
    end;
end;

var
    numero, cantidad, suma:integer;
begin
    numero:=0;
    cantidad:=0;
    suma:=0;
    repeat
        suma:=0;
        readln(numero);
        operador(numero, cantidad, suma);
    until(suma=10);
    writeln('Cantidad total de digitos leidos: ', cantidad);
end.
    
    
    
    
    
    
    
    