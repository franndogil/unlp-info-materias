{4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}

program ejer4;

procedure Leer_numero(var n:integer);
begin
	write('Ingrese el numero a convertir: ');
	readln(n);
end;

procedure Binario(n:integer);
begin
	if (n>0)then begin
		binario(n div 2);	//voy hasta el final
		write(n mod 2);		//imprimo desde el final hasta el primero (imprimo y salgo, imprimo y salgo)
	end;
end;

procedure Programa;
var
	n:integer;
begin
	Leer_numero(n);
	if(n<>0)then begin
		Binario(n);
		writeln('');
		Programa;
	end;
end;

begin
	Programa;
end.
