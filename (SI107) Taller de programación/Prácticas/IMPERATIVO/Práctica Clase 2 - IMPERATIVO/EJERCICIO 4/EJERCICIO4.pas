{ 4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
 equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
 el número 0 (cero).
 Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
 ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
 próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}

program ejercicio4;

type
	lista=^nodo;
	
	nodo=record
		dato:integer;
		sig:lista;
	end;
	
procedure Agregar_adelante(var l:lista; num:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:=num;
	nuevo^.sig:=l;
	l:=nuevo;
end;

procedure Imprimir_lista(l:lista);
begin
	while(l<>nil)do begin
		write(l^.dato);
		l:=l^.sig;
	end;
end;
	
procedure Leer_numero(var n:integer);
begin
	write('Ingrese un numero: ');
	readln(n);
end;

procedure Binario(n:integer; var l:lista);
var
	aux:integer;
begin
	if(n<>0)then begin
		if (n mod 2=0)then begin
			aux:=0;
			Agregar_adelante(l, aux);
		end	
		else begin
			aux:=1;
			Agregar_adelante(l, aux);
		end;
		n:=n div 2;
		Binario(n, l);
	end;
end;


procedure Programa;
var
	n:integer;
	l:lista;
begin
	Leer_numero(n);
	while(n<>0)do begin
		l:=nil;
		Binario(n, l);
		write('Numero en binario: ');
		Imprimir_lista(l);
		writeln('');
		Leer_numero(n);
		writeln('');
	end;
end;

begin
	Programa;
end.
		
