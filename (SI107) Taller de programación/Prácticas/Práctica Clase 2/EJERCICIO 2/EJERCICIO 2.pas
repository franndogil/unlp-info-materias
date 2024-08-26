{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

program ejer2;
const
	rango_max=200;
	rango_min=100;
type
	rango=rango_min..rango_max;
	
	lista=^nodo;
	
	nodo=record
		dato:rango;
		sig:lista;
	end;
	
procedure AgregarAtras(var l:lista; num:rango);
var
	nuevo, aux:lista;
begin
	new(nuevo);
	nuevo^.dato:=num;
	nuevo^.sig:=nil;	//seria el ultimo
	
	if (l=nil) then 		//evaluo si la lista está vacía
		l:= nuevo
	else begin
        aux:= l;
        while (aux ^.sig <> nil) do		//recorro y quedo parado
			aux:= aux^.sig;				//en el ultimo elemento
			
        aux^.sig:=nuevo;	//Le indico al último que ahora su 
							//siguiente es nuevo
    end;
end;

procedure Generacion_de_lista(var l:lista);
var
	num:rango;
begin
	num:=random(rango_max-rango_min+1)+rango_min;
	if(num<>100)then begin
		AgregarAtras(l, num);
		Generacion_de_lista(l);
	end;
end;

procedure Imprimir_lista_iteractivo(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dato);
		l:=l^.sig;
	end;
end;

procedure Imprimir_lista_recursivo(l:lista);			//PUNTO B
begin
	if(l<>nil)then begin
		writeln(l^.dato);
		l:=l^.sig;
		Imprimir_lista_recursivo(l);
	end;
end;

procedure Imprimir_lista_recursivo_inverso(l:lista);	//PUNTO C
begin
	if(l<>nil)then begin
		Imprimir_lista_recursivo_inverso(l^.sig);
		writeln(l^.dato);
	end;
end;

procedure Minimo_valor(l:lista; var min:integer);		//PUNTO D
begin
	if(l<>nil)then begin
		if(l^.dato<min)then begin
			min:=l^.dato;
		end;
		Minimo_valor(l^.sig, min);
	end;
end;

procedure Busqueda(l:lista; val:rango; var ok:boolean);
begin
	if(l<>nil)then begin
		if(val=l^.dato)then
			ok:=true;
		l:=l^.sig;
		Busqueda(l, val, ok);
	end;
end;

var
	l:lista;
	min:integer;
	ok:boolean;
	val:rango;
begin
	randomize;
	l:=nil;
	min:=201;
	Generacion_de_lista(l);					//						PUNTO A
	{writeln('Impresion Iteractiva: ');		//lo visto en cadp
	Imprimir_lista_iteractivo(l);}
	writeln('Impresion Recursiva: ');		//lo visto en taller	
	Imprimir_lista_recursivo(l);			//						PUNTO B
	writeln('Impresion Recursiva Inversa: ');
	Imprimir_lista_recursivo_inverso(l);	//						PUNTO C
	Minimo_valor(l, min);					//						PUNTO D
	writeln ('El minimo valor de la lista es: ', min);
	writeln('Ingrese el valor a buscar: ');
	readln(val);
	Busqueda(l, val, ok);					//						PUNTO E
	writeln(ok);
end.
