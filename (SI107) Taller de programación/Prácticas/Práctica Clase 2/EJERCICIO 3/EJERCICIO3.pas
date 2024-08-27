{ 3.- Implementar un programa que invoque a los siguientes módulos.
 a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
 y menores a 1550 (incluidos ambos).
  b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
 en la práctica anterior)
 c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
 encabezado:
 Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
 Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
 en el vector.}
 
 program ejercicio3;
 const
	rango_max=1550;
	rango_min=300;
	max_int=20;
type
	rango=rango_min..rango_max;
	rango_int=1..max_int;
	indice=-1..max_int;
	
	vecint=array[rango_int]of rango;
	
procedure Retornar_vector(var v:vecint; i:integer);			//	PUNTO A
var
	num:rango;
begin
	if(i<20)then begin
		i:=i+1;
		num:=random(rango_max-rango_min+1)+rango_min;
		v[i]:=num;
		Retornar_vector(v, i);
	end;
end;

procedure Imprimir_vector(v:vecint);		//como en cadp (ITERATIVO)
var
	i:integer;
begin
	i:=0;
	for i:=1 to 20 do begin
		writeln(v[i]);
	end;
end;

procedure Imprimir_vector_recursivo(v:vecint; i:integer);		//como en taller (RECURSIVO)
begin
	if(i<20)then begin
		i:=i+1;
		writeln(v[i]);
		Imprimir_vector_recursivo(v, i);
	end;
end;

procedure Ordenacion_por_insercion(var v:vecint; dimLog:integer);	//empezamos a analizar desde la segunda pos del vector
var
	i, j:rango_int;
	actual:rango;							//va a ser nuestro auxiliar para no perder oficinas
begin										//ejemplo de la primera vuelta
	for i:=2 to dimLog do begin
		actual:=v[i];						//actual toma la 2da pos del vector
		j:=i-1;								//j=2-1=1 (uno)
		while((j>0)and(v[j]>actual))do begin	//mientras j sea mayor a 0 (es uno 1) y el cod del anterior (pos 1) sea mayor al cod de
											//la pos 2 (actual)
			v[j+1]:=v[j];					//el actual (pos 2) va a tomar la pos del anterior (pos 1)	
			j:=j-1;							//disminuyo j (J=1-1=0)
		end;								//sale del while pues j ya vale 0 y es condicion
		v[j+1]:=actual; 					//el anterior (pos 1) toma la pos del actual (pos 2)
	end;
end;

procedure Busqueda_Dicotomica (v: vecint; ini:indice; fin: indice; dato:integer; var pos: indice);		//PUNTO C
var
	i:indice;
begin
	i:=ini;
	if(dato<v[11])then begin
		for i:=1 to 10 do begin
			if(dato=v[i])then
				pos:=i
		end;
	end
	else begin
		if(dato>v[10])then begin
			for i:=10 to fin do begin
				if(dato=v[i])then
					pos:=i;
			end;
		end
		else
			pos:=-1;
	end;
end;


var
	i:integer;
	v:vecint;
	dimL, dato:integer;
	inicio, fin, pos:indice;
begin
	dimL:=20;
	i:=0;
	Retornar_vector(v, i);					//PUNTO A
	writeln('Impresion ITERATIVA: ');
	Imprimir_vector(v);
	writeln('Impresion RECURSIVA: ');
	Imprimir_vector_recursivo(v, i);
	Ordenacion_por_insercion(v, dimL);		//PUNTO B
	writeln('Impresion RECURSIVA del vector ORDENADO: ');
	Imprimir_vector_recursivo(v, i);
	dato:=897;
	inicio:=1;
	fin:=20;
	Busqueda_Dicotomica(v, inicio, fin, dato, pos);		//PUNTO C
	writeln('Dato: ', pos);
end.
