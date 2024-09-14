program Dogil;
type
	rango_gen=1..7;

	libro=record
		isbn:integer;
		coda:integer;
		codg:rango_gen;
	end;
	
	reg_arbol=record
		coda:integer;
		cant:integer;
	end;
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:reg_arbol;
		HI:arbol;
		HD:arbol;
	end;
	
	reg_vec=record
		codg:rango_gen;
		cant:integer;
	end;
	
	vector = array[rango_gen] of reg_vec;

procedure Generar_libro(var l:libro);
begin
	l.isbn:=random(100);
	if(l.isbn<>0)then begin
		l.coda:=random(100)+1;
		l.codg:=random(7)+1;
	end;
end;

procedure Agregar_arbol(var a:arbol; l:libro);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.coda:=l.coda;
		a^.dato.cant:=1;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(a^.dato.coda=l.coda)then
			a^.dato.cant:=a^.dato.cant+1
		else begin
			if(l.coda<a^.dato.coda)then
				Agregar_arbol(a^.HI, l)
			else
				Agregar_arbol(a^.HD, l);
		end;
	end;
end;

procedure Agregar_vector(var v:vector; l:libro);
begin
	v[l.codg].cant:=v[l.codg].cant+1;
end;

procedure Modulo_a(var a:arbol; var v:vector);
var
	l:libro;
begin
	Generar_libro(l);
	while(l.isbn<>0)do begin
		Agregar_arbol(a, l);
		Agregar_vector(v, l);
		Generar_libro(l);
	end;
end;

procedure Inicializar_vector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 7 do begin
		v[i].codg:=i;
		v[i].cant:=0;
	end;
end;

procedure Ordenamiento_de_vector(var v:vector; dimLog:integer);
var
	i, j, pos:integer;
	item:reg_vec;
begin
	for i:=1 to (dimLog-1)do begin
		pos:=i;
		for j:=i+1 to dimLog do
			if(v[j].cant<v[pos].cant)then
				pos:=j;
		
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;
end;

procedure Actualizar_nombre(var nombreg:string; i:integer);
begin
	if(i=1)then
		nombreg:='Literario';
	if(i=2)then
		nombreg:='Filosofía';
	if(i=3)then
		nombreg:='Biología';
	if(i=4)then
		nombreg:='Arte';
	if(i=5)then
		nombreg:='Computación';
	if(i=6)then
		nombreg:='Medicina';
	if(i=7)then
		nombreg:='Ingeniería';
end;

procedure Modulo_b(var v:vector; var nombreg:string; var maycant:integer);
var
	i:integer;
begin
	Ordenamiento_de_vector(v, 7);
	
	for i:=1 to 7 do begin
		if(v[i].cant>=maycant)then begin
			maycant:=v[i].cant;
			Actualizar_nombre(nombreg, v[i].codg);
		end;
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HI);
		
		writeln('');
		writeln('--------------------------------------');
		writeln('Codigo de autor: ',a^.dato.coda);
		writeln('Cantidad de libros: ',a^.dato.cant);
		
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Imprimir_vector(v:vector);
var
	i:integer;
begin
	for i:=1 to 7 do begin
		writeln('');
		writeln('------------------------------');
		writeln('Codigo de genero: ', v[i].codg);
		writeln('Cantidad de libros del genero: ', v[i].cant);
	end;
end;

procedure Modulo_c(a:arbol; min:integer; max:integer; var cant:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.cant>=min)then begin
			if(a^.dato.cant<=max)then begin
				cant:=cant+1;
				Modulo_c(a^.HI, min, max, cant);
				Modulo_c(a^.HD, min, max, cant);
			end
			else
				Modulo_c(a^.HI, min, max, cant);		
		end
		else
			Modulo_c(a^.HD, min, max, cant);
	end;
end;

var
	v:vector;
	a:arbol;
	nombreg:string;
	maycant, cant, min, max:integer;
begin
	randomize;
	a:=nil;
	Inicializar_vector(v);
	
	Modulo_a(a, v);
	Imprimir_arbol(a);
	Imprimir_vector(v);
	
	maycant:=0;
	Modulo_b(v, nombreg, maycant);
	writeln('');
	writeln('Nombre de genero con mayor cantidad de libros: ', nombreg);
	
	cant:=0;
	min:=10;
	max:=30;
	Modulo_c(a, min, max, cant);
end.
