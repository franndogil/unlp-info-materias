program DOGIL;

type
	prestamo=record
		num:integer;
		isbn:integer;
		cods:integer;
	end;
	
	arbol1=^nodo_arbol1;
	
	nodo_arbol1=record
		dato:prestamo;
		HI:arbol1;
		HD:arbol1;
	end;
	
	socycant=record
		cods:integer;
		cant:integer;
	end;
	
	arbol2=^nodo_arbol2;
	
	nodo_arbol2=record
		dato:socycant;
		HI:arbol2;
		HD:arbol2;
	end;


procedure Generar_prestamo(var p:prestamo);
begin
	p.num:=random(15)+1;
	p.isbn:=random(100)+1;
	p.cods:=random(100);
end;

procedure Generar_estructura_1(var a:arbol1; p:prestamo);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=p;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(p.isbn<a^.dato.isbn)then
			Generar_estructura_1(a^.HI, p)
		else
			Generar_estructura_1(a^.HD, p);
	end;
end;

procedure Generar_estructura_2(var a:arbol2; p:prestamo);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.cods:=p.cods;
		a^.dato.cant:=1;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(p.cods=a^.dato.cods)then
			a^.dato.cant:=a^.dato.cant+1
		else begin
			if(p.cods<a^.dato.cods)then
				Generar_estructura_2(a^.HI, p)
			else
				Generar_estructura_2(a^.HD, p);
		end;
	end;
end;

procedure Generar_estructuras(var a1:arbol1; var a2:arbol2);
var
	p:prestamo;
begin
	Generar_prestamo(p);
	while(p.cods<>0)do begin
		Generar_estructura_1(a1, p);
		Generar_estructura_2(a2, p);
		Generar_prestamo(p);
	end;
end;

procedure Modulo_b(a:arbol1; isbn:integer; var cant:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.isbn=isbn)then
			cant:=cant+1;
		if(isbn<a^.dato.isbn)then
			Modulo_b(a^.HI, isbn, cant)
		else
			Modulo_b(a^.HD, isbn, cant);
	end;
end;

procedure Modulo_c(a:arbol2; val:integer; var cant:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.cant>=val)then
			cant:=cant+1;
		Modulo_c(a^.HI, val, cant);
		Modulo_c(a^.HD, val, cant);
	end;
end;

procedure Imprimir_estructura_1(a:arbol1);
begin
	if(a<>nil)then begin
		Imprimir_estructura_1(a^.HI);
		
		writeln('-------------------------------------------------');
		writeln('ISBN del libro: ', a^.dato.isbn);
		writeln('Numero de prestamo del libro: ', a^.dato.num);
		writeln('Codigo del socio: ', a^.dato.cods);
		
		Imprimir_estructura_1(a^.HD);
	end;
end;

procedure Imprimir_estructura_2(a:arbol2);
begin
	if(a<>nil)then begin
		Imprimir_estructura_2(a^.HI);
	
		writeln('-----------------------------------------');
		writeln('Codigo de socio: ', a^.dato.cods);
		writeln('Cantidad de prestamos: ', a^.dato.cant);
		
		Imprimir_estructura_2(a^.HD);
	end;
end;

var
	a1:arbol1;
	a2:arbol2;
	isbnb, cantisbn, val, cants:integer;
begin
	randomize;
	a1:=nil;
	a2:=nil;
	Generar_estructuras(a1, a2);		//PUNTO A (I Y II)
	
	cantisbn:=0;
	isbnb:=10;
	Modulo_b(a1, isbnb, cantisbn);							//PUNTO B
	writeln('Cantidad de prestamos del isbn: ', cantisbn);
	
	cants:=0;
	val:=4;
	Modulo_c(a2, val, cants);									//PUNTO C
	writeln('Cantidad de socios con cantidad de prestamos superior al valor ingresado: ', cants);
	
	writeln('');								//PRUEBASSSSS
	writeln('Prueba de que funciona:');
	writeln('');
	writeln('Impresion de estructura n1:');
	Imprimir_estructura_1(a1);
	writeln('');
	writeln('Impresion de estructura n2:');
	Imprimir_estructura_2(a2);
end.
