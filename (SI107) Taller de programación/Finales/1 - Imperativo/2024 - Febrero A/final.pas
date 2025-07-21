program final;
type
	alumno = record
		nombre : string;
		dni : integer;
		tiempo : real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato : alumno;
		hi: arbol;
		hd: arbol;
	end;
	
	lista=^nodoLista;
	
	nodoLista = record
		dato : alumno;
		sig : lista;
	end;
	
procedure leerAlumno(var a:alumno);
begin
	writeln('Ingrese el dni del alumno: ');
	readln(a.dni);
	if(a.dni<>0)then begin
		writeln('Ingrese el nombre: ');
		readln(a.nombre);
		writeln('Ingrese el tiempo: ');
		readln(a.tiempo);	
	end;
end;

procedure agregar(var a:arbol; al:alumno);
begin
	if(a = nil)then begin
		new(a);
		a^.dato := al;
		a^.hi := nil;
		a^.hd := nil;
	end
	else begin
		if(al.tiempo < a^.dato.tiempo)then
			agregar(a^.hi, al)
		else
			agregar(a^.hd, al);
	end;
end;

procedure cargarArbol(var a:arbol);
var
	al:alumno;
begin
	leerAlumno(al);
	while(al.dni<>0)do begin
		agregar(a, al);
		leerAlumno(al);
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

  while (act <> nil) and (act^.dato.tiempo < a.tiempo) do
  begin
    ant := act;
    act := act^.sig;
  end;

  if ant = nil then
  begin
    // Insertar al principio
    nue^.sig := l;
    l := nue;
  end
  else
  begin
    // Insertar entre ant y act
    ant^.sig := nue;
    nue^.sig := act;
  end;
end;


procedure devolverLista(var a:arbol; t1, t2: real; var l:lista);
begin
	if(a <> nil)then begin
		devolverLista(a^.hi, t1, t2, l);
		if(a^.dato.tiempo >= t1) and (a^.dato.tiempo <= t2)then begin
			insertarOrdenado(l, a^.dato);
		end;
		devolverLista(a^.hd, t1, t2, l);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dato.nombre);
		l:= l^.sig;
	end;
end;

procedure alumnoRapido(a:arbol; var nombre:string; var dni:integer; var valorA:real);
begin
	if(a<>nil)then begin
		if(a^.dato.tiempo < valorA)then begin
			valorA := a^.dato.tiempo;
			nombre := a^.dato.nombre;
			dni := a^.dato.dni;
		end;
		alumnoRapido(a^.hi, nombre, dni, valorA);
		alumnoRapido(a^.hd, nombre, dni, valorA);
	end;
end;

var
	a:arbol;
	l:lista;
	nombre:string;
	dni:integer;
	valorAlto :real;
begin
	valorAlto := 9999;
	a := nil;
	l := nil;
	cargarArbol(a);
	devolverLista(a, 1.5, 3.5, l);
	imprimirLista(l);
	alumnoRapido(a, nombre, dni, valorAlto);
	writeln(nombre, ' ',dni);		//reviso si devuelve el mas rapido xd
end.
