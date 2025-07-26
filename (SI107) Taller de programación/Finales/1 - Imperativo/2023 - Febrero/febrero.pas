program febrero;

type
	alumno = record
		dni:integer;
		nombre:string;
		puntaje:real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:alumno;
		hi:arbol;
		hd:arbol;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:alumno;
		sig:lista;
	end;
	
procedure leerAlumno(var a:alumno);
begin
	writeln('Ingrese el DNI del alumno:');
	readln(a.dni);
	if(a.dni<>0)then begin
		writeln('Ingrese el nombre del alumno: ');
		readln(a.nombre);
		writeln('Ingrese el puntaje otorgado a su fotografia: ');
		readln(a.puntaje);
	end;
end;

procedure agregar(var a:arbol; al:alumno);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=al;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else begin
		if(al.dni<a^.dato.dni)then
			agregar(a^.hi, al)
		else
			agregar(a^.hd, al);
	end;
end;

procedure moduloA(var a:arbol);
var
	al:alumno;
begin
	leerAlumno(al);
	while(al.dni<>0)do begin
		agregar(a, al);
		leerAlumno(al);
	end;
end;

procedure insertarOrdenado(var l:lista; al:alumno);
var
	nue, ant, act:lista;
begin
	new(nue);
	nue^.dato := al;
	nue^.sig := nil;
	
	act := l;
	ant := l;
	
	//recorrido bien realizado
	
	while(act<>nil)and(al.puntaje<act^.dato.puntaje)do begin
		ant := act;
		act := act^.sig;
	end;
	
	if(ant = nil)then begin 	//si el anterior es igual a nil es porque no recorrimos un carajo xd, lo inserto al principio
		nue^.sig := l;
		l:= nue;
	end
	else begin			//sino lo inserto entre el ant y el act
		ant^.sig:= nue;
		nue^.sig:= act;
	end;
end;

procedure moduloB(var a:arbol; var l:lista; r1, r2:real);
begin
	if(a<>nil)then begin
		if(a^.dato.puntaje>=r1)and(a^.dato.puntaje<=r2)then begin
			insertarOrdenado(l, a^.dato);
		end;
		moduloB(a^.hi, l, r1, r2);
		moduloB(a^.hd, l, r1, r2);
	end;
end;

procedure moduloC(var a:arbol; var puntaje:real; var dni:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.dni<dni)then begin
			dni := a^.dato.dni;
			puntaje := a^.dato.puntaje;
		end;
		moduloC(a^.hi, puntaje, dni);
		moduloC(a^.hd, puntaje, dni);
	end;
end;

procedure imprimirArbol(var a:arbol);
begin
	if(a<>nil)then begin
		writeln('-----------------------------');
		writeln('Nombre: ', a^.dato.nombre);
		writeln('DNI: ', a^.dato.dni);
		writeln('Puntaje: ', a^.dato.puntaje);
		
		imprimirArbol(a^.hi);
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirLista(var l:lista);
begin
	writeln('Impresion de Lista:');
	while(l<>nil)do begin
		writeln('-----------------------------');
		writeln('Nombre: ', l^.dato.nombre);
		writeln('DNI: ', l^.dato.dni);
		writeln('Puntaje: ', l^.dato.puntaje);
		l:=l^.sig;
	end;
end;

var
	a:arbol;
	l:lista;
	puntaje:real;
	dni:integer;
begin
	a:= nil;
	l:=nil;
	puntaje:=0;
	dni:= 9999;
	moduloA(a);
	imprimirArbol(a);
	moduloB(a, l, 10, 40);
	imprimirLista(l);
	moduloC(a, puntaje, dni);
	writeln('Puntaje: ', puntaje, ' DNI: ', dni)
end.







