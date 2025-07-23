program febrerob;
type
	alumno = record
		nombre:string;
		legajo:integer;
		cantEval:integer;
	end;
	
	lista =^nodoLista;
	
	nodoLista = record
		dato:alumno;
		sig:lista;
	end;
	
	arbol =^nodoArbol;
	
	nodoArbol = record
		dato:alumno;
		hi:arbol;
		hd:arbol;
	end;

procedure leerAlumno(var a:alumno);
begin
	writeln('Ingrese el legajo: ');
	readln(a.legajo);
	if(a.legajo<>0)then begin
		writeln('Ingrese el nombre: ');
		readln(a.nombre);
		a.cantEval := 0;
	end;
end;

procedure agregar(var a:arbol; alu:alumno);
begin
	if(a=nil)then begin
		new(a);	//reservo espacio en memoria
		a^.dato := alu;
		a^.hi := nil;
		a^.hd := nil;
	end
	else begin
		if(alu.legajo < a^.dato.legajo)then
			agregar(a^.hi, alu)
		else
			agregar(a^.hd, alu);
	end;
end;

procedure cargarArbol(var a:arbol);
var
	alu:alumno;
begin
	leerAlumno(alu);
	while(alu.legajo<>0)do begin
		agregar(a, alu);
		leerAlumno(alu);
	end;
end;

procedure aumentoAprobadas(var a:arbol; legajo:integer);
begin
	if(a <> nil)then begin
		if(a^.dato.legajo = legajo)then
			a^.dato.cantEval := a^.dato.cantEval + 1
		else begin
			aumentoAprobadas(a^.hi, legajo);
			aumentoAprobadas(a^.hd, legajo);
		end;
	end;
end;

procedure insertarOrdenado(var l: lista; a: alumno);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato := a;
	nue^.sig := nil;

	act := l;
	ant := nil;

	while (act <> nil) and (act^.dato.nombre < a.nombre) do begin
		ant := act;
		act := act^.sig;
	end;

	if (ant = nil) then begin
		// Insertar al principio
		nue^.sig := l;
		l := nue;
	end
	else begin
		// Insertar entre ant y act
		ant^.sig := nue;
		nue^.sig := act;
	end;
end;

procedure retornarLista(var a:arbol; var l:lista);
begin
	if(a <> nil)then begin
		if(a^.dato.cantEval >= 3)then begin
			insertarOrdenado(l, a^.dato);
		end;
		retornarLista(a^.hi, l);
		retornarLista(a^.hd, l);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dato.nombre);
		l:=l^.sig;
	end;
end;

var
	ar:arbol;
	l:lista;
begin
	l:= nil;
	ar:= nil;
	cargarArbol(ar);
	//hardcodeo
	aumentoAprobadas(ar, 1311);
	aumentoAprobadas(ar, 1311);
	aumentoAprobadas(ar, 1311);
	aumentoAprobadas(ar, 1311);
	aumentoAprobadas(ar, 1312);
	aumentoAprobadas(ar, 1312);
	aumentoAprobadas(ar, 1312);
	
	retornarLista(ar, l);
	
	imprimirLista(l);
end.
