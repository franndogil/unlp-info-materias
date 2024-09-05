{ Implementar un programa que invoque a los siguientes módulos.
 a. Un módulo recursivo que retorne un vector de a lo sumo 15 números enteros “random”
 mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con el valor 20.
 b. Un módulo no recursivo que reciba el vector generado en a) e imprima el contenido del
 vector.
 c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
 d. Un módulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores
 pares contenidos en el vector.
 e. Un módulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del
 vector.
 f. Un módulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si
 dicho valor se encuentra en el vector o falso en caso contrario.
 g. Un módulo que reciba el vector generado en a) e imprima, para cada número contenido en
 el vector, sus dígitos en el orden en que aparecen en el número. Debe implementarse un
 módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 142, se
 debe imprimir 1 4 2}
 
program ejer1;
const
	max_int=15;
	rango_max=155;
	rango_min=10;
type
	rangonum=rango_min..rango_max;
	rangovec=1..max_int;
	
	vecint=array[rangovec]of rangonum;
	
procedure Cargar_vector(var v:vecint; var dimLog:integer);	//PUNTO A
var
	n:integer;
begin
	dimLog:=dimLog+1;
	n:=random(rango_max-rango_min+1)+rango_min;
	if(n<>20)and(dimLog<16)then begin
		v[dimLog]:=n;
		Cargar_vector(v, dimLog);
	end;
end;

procedure Imprimir_vector_recursivo (v:vecint; i:integer);		//PUNTO C
begin
	if(i<=15)then begin
		writeln(v[i]);
		i:=i+1;
		Imprimir_vector_recursivo(v, i);
	end;
end;

procedure Imprimir_vector_no_recursivo(v:vecint);				//PUNTO B
var
	i:integer;
begin
	i:=0;
	for i:=1 to 15 do begin
		writeln(v[i]);
	end;
end;

procedure Suma_pares(v:vecint; i:integer; var suma:integer);	//PUNTO D
begin
	if(i<=15)then begin
		if(v[i] mod 2=0)then begin
			suma:=suma+v[i];
			i:=i+1;
			Suma_pares(v, i, suma);
		end
		else begin
			i:=i+1;
			Suma_pares(v, i, suma);
		end;
	end;
end;

procedure Valor_max(v:vecint; i:integer; var vm:integer);
begin
	if(i<=15)then begin
		if(vm<=v[i])then begin
			vm:=v[i];
			i:=i+1;
			Valor_max(v, i, vm);
		end
		else begin
			i:=i+1;
			Valor_max(v, i, vm);
		end;
	end;
end;

procedure Busqueda(v:vecint; i:integer; dato:integer; var ok:boolean);
begin
	if(i<=15)then begin
		if(v[i]=dato)then
			ok:=true
		else begin
			i:=i+1;
			Busqueda(v, i, dato, ok);
		end;
	end;
end;

procedure Desarmar_num(i:integer);
var
	dig:integer;
begin
	if(num<>0)then begin
		dig:=num mod 10;
		write(dig);
		
		
	
	
end;

procedure Impresion_digitos(v:vecint; i:integer);
begin
	if(i<=15)then begin
		Desarmar_num(v[i]);
		i:=i+1;
		Impresion_digitos(v, i);
	end;
end;

var
	v:vecint;
	dimL, aux, suma, valormax, dato:integer;
	ok:boolean;
begin
	randomize;
	dimL:=0;
	aux:=1;
	suma:=0;
	valormax:=0;
	Cargar_vector(v, dimL);					//PUNTO A
	writeln('Impresion NO recursiva: ');
	Imprimir_vector_no_recursivo(v);		//PUNTO B
	writeln('Impresion recursiva: ');
	Imprimir_vector_recursivo(v, aux);		//PUNTO C
	Suma_pares(v, aux, suma);				//PUNTO D
	writeln('La suma de los numeros pares del vector es igual a: ', suma);
	Valor_max(v, aux, valormax);			//PUNTO E
	writeln('El valor maximo del vector es igual a: ', valormax);
	write('Ingrese el valor a buscar: ');
	readln(dato);
	Busqueda(v, aux, dato, ok);				//PUNTO F
	writeln('OK: ', ok);
end.
	
