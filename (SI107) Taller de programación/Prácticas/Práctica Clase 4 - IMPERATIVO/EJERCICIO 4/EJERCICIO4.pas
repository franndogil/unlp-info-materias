{Una biblioteca nos ha encargado procesar la información de los préstamos realizados
 durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
 y mes del préstamo y cantidad de días prestados. Implementar un programa con:
 a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
 los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
 ser eficientes para buscar por ISBN.
 i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
 insertarlos a la derecha.
 ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
 (prestar atención sobre los datos que se almacenan).
 b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
 grande.
 c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
 pequeño.
 d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
 módulo debe retornar la cantidad de préstamos realizados a dicho socio.
 e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
 módulo debe retornar la cantidad de préstamos realizados a dicho socio.
 f.
 Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
 ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
 que se prestó.
 g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
 ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
 que se prestó.
 h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
 i.
 Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
 comprendidos entre los dos valores recibidos (incluidos).
 j.
 Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
 comprendidos entre los dos valores recibidos (incluidos).}
 
 program ejercicio4;
 const
	diamax=31;
	mesmax=12;
 type
	rango_dia=1..diamax;
	rango_mes=1..mesmax;
 
	prestamo=record
		isbn:integer;
		nums:integer;
		dia:rango_dia;
		mes:rango_mes;
		cantd:integer;
	end;
	
	infoprestamo=record
		nums:integer;
		dia:rango_dia;
		mes:rango_mes;
		cantd:integer;
	end;
		
	lista=^nodo_lista;
	
	nodo_lista=record
		dato:infoprestamo;
		sig:lista;
	end;
	
	prestamos=record
		isbn:integer;
		todos:lista;
	end;
	
	arbol1=^nodo_arbol_1;
	
	nodo_arbol_1=record
		dato:prestamo;
		HI:arbol1;
		HD:arbol1;
	end;
	
	arbol2=^nodo_arbol_2;
	
	nodo_arbol_2=record
		dato:prestamos;
		HI:arbol2;
		HD:arbol2;
	end;

procedure Leer_prestamo(var p:prestamo);
begin
	p.isbn:=random(10);
	p.nums:=random(1000)+1;
	p.dia:=random(31)+1;
	p.mes:=random(12)+1;
	p.cantd:=random(90)+1;
end;

procedure Agregar1(var a:arbol1; p:prestamo);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=p;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(p.isbn<a^.dato.isbn)then
			Agregar1(a^.HI, p)
		else
			Agregar1(a^.HD, p);
	end;
end;

procedure Agregar_adelante(var l:lista; p:prestamo);
var
	nue:lista;
begin
	new(nue);
	nue^.dato.nums:=p.nums;
	nue^.dato.dia:=p.dia;
	nue^.dato.mes:=p.mes;
	nue^.dato.cantd:=p.cantd;
	nue^.sig:=l;
	l:=nue;
end;

procedure Agregar2(var a:arbol2; p:prestamo);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.isbn:=p.isbn;
		a^.dato.todos:=nil;
		Agregar_adelante(a^.dato.todos, p);
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(p.isbn=a^.dato.isbn)then begin
			Agregar_adelante(a^.dato.todos, p);
		end
		else 
			if(p.isbn<a^.dato.isbn)then 
				Agregar2(a^.HI, p)
			else
				Agregar2(a^.HD, p);
	end;
end;

procedure Generacion_de_estructuras(var a1:arbol1; var a2:arbol2);
var
	p:prestamo;
begin
	Leer_prestamo(p);
	while(p.isbn<>0)do begin
		Agregar1(a1, p);
		Agregar2(a2, p);
		Leer_prestamo(p);
	end;
end;

procedure Impresion_de_estructura1(a:arbol1);
begin
	if(a<>nil)then begin
		Impresion_de_estructura1(a^.HI);
		
		writeln('ISBN: ', a^.dato.isbn);
		writeln('Numero de socio: ', a^.dato.nums);
		writeln('Dia: ', a^.dato.dia);
		writeln('Mes: ', a^.dato.mes);
		writeln('Cantidad de dias prestados: ', a^.dato.cantd);
		writeln('-------------------------------');
		
		Impresion_de_estructura1(a^.HD);
	end;
end;

procedure Impresion_de_lista(l:lista);
begin
	while(l<>nil)do begin
		writeln('Numero de socio: ', l^.dato.nums);
		writeln('Dia: ', l^.dato.dia);
		writeln('Mes: ', l^.dato.mes);
		writeln('Cantidad de dias prestados: ', l^.dato.cantd);
		writeln('-------------------------------');
		
		l:=l^.sig;
	end;
end;

procedure Impresion_de_estructura2(a:arbol2);
begin
	if(a<>nil)then begin
		Impresion_de_estructura2(a^.HI);
		
		writeln('ISBN: ', a^.dato.isbn);
		Impresion_de_lista(a^.dato.todos);
		
		Impresion_de_estructura2(a^.HD);
	end;
end;

procedure Isbn_mayor(a:arbol1; var isbn:integer);		//PUNTO B
begin
	if(a<>nil)then begin
		if(a^.dato.isbn>=isbn)then
			isbn:=a^.dato.isbn;
		Isbn_mayor(a^.HI, isbn);
		Isbn_mayor(a^.HD, isbn);
	end;
end;

procedure Isbn_menor(a:arbol2; var isbn:integer);		//PUNTO C
begin
	if(a<>nil)then begin
		if(a^.dato.isbn<=isbn)then
			isbn:=a^.dato.isbn;
		Isbn_menor(a^.HI, isbn);
		Isbn_menor(a^.HD, isbn);
	end;
end;

function Cant_pres(a:arbol1; nums:integer):integer;		//PUNTO D
begin
	if(a=nil)then
		Cant_pres:=0
	else begin
		if(a^.dato.nums=nums)then
			Cant_pres:=Cant_pres(a^.HI, nums)+Cant_pres(a^.HD, nums)+1
		else
			Cant_pres:=Cant_pres(a^.HI, nums)+Cant_pres(a^.HD, nums);
	end;
end;

function Cant_pres_2(a:arbol2; nums:integer):integer;
begin
	if(a=nil)then
		Cant_pres_2:=0
	else begin
	end;
end;


var
	a1:arbol1;
	a2:arbol2;
	isbnmay, isbnmen, numsi:integer;
begin
	randomize;
	a1:=nil;
	a2:=nil;
	isbnmay:=-1;
	isbnmen:=9999;
	Generacion_de_estructuras(a1, a2);			//PUNTO A I Y II
	
	writeln('--------------------------:');
	writeln('IMPRESION DE ESTRUCTURA N1:');
	writeln('--------------------------:');
	Impresion_de_estructura1(a1);				//CHEQUEO PUNTO A.I
	
	writeln('--------------------------:');
	writeln('IMPRESION DE ESTRUCTURA N2:'); 
	writeln('--------------------------:');  
	Impresion_de_estructura2(a2);				//CHEQUEO PUNTO A.II
	
	Isbn_mayor(a1, isbnmay);
	writeln('ISBN mas grande: ', isbnmay);		//PUNTO B
	
	Isbn_menor(a2, isbnmen);
	writeln('ISBN mas chico: ', isbnmen);		//PUNTO C
	
	writeln('Ingrese un numero de socio: ');
	read(numsi);
	writeln('Cantidad de prestamos realizados a dicho socio: ', Cant_pres(a1, numsi));		//PUNTO D
end.





















