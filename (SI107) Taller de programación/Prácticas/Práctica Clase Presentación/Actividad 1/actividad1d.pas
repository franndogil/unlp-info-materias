program ProgramaNumAleatorio;
var 
	ale, i:integer;
	a, b, n: integer;
	
begin
     randomize; 
     i:=0;
     a:=0;
     b:=0;
     n:=0;
     writeln('Ingrese el rango:');
     writeln('Minimo:');
     readln(a);
     writeln('Maximo');
	 readln(b);
	 writeln('Ingrese la cantidad de numeros a imprimir: ');
	 readln(n);
	 
     for i:=1 to n do begin
		ale := random(b-a+1)+a;
		writeln ('El numero aleatorio generado es: ', ale);
	 end;

	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.

