program ProgramaNumAleatorio;
var 
	ale:integer;
	a, b, f: integer;
	
begin
     randomize; 
     a:=0;
     b:=0;
     f:=0;
     writeln('Ingrese el rango:');
     writeln('Minimo:');
     readln(a);
     writeln('Maximo');
	 readln(b);
	 writeln('Ingrese el numero de corte: ');
	 readln(f);
	 
     repeat 
		ale := random(b-a+1)+a;
		writeln ('El numero aleatorio generado es: ', ale);
	 until (ale = f);

	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.

