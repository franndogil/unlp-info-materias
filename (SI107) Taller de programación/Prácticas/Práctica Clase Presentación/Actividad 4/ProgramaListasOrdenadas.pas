program ProgramaListas;
const
	b=150;
	a=100;
type
	lista=^nodo;
	
	nodo=record
		dato:integer;
		sig:lista;
	end;
	
procedure InsertarOrdenado(var l:lista; num:integer);
var
	nue, act, ant:lista;
begin
	new(nue);
	nue^.dato:=num;
	act:=l;
	ant:=l;
	
	while(act<>nil)and(num>act^.dato)do begin
		ant:=act;
		act:=act^.sig;
	end;
	
	if(act=ant)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;
	
procedure CargarListaOrdenada(var l:lista);
var
	num:integer;
begin
	randomize;
	num:=random(b-a+1)+a;
	while(num<>120)do begin
		num:=random(b-a+1)+a;
		InsertarOrdenado(l, num);
	end;
end;

procedure ImprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dato);
		l:=l^.sig;
	end;
end;

procedure BuscarElementoOrdenado(l:lista; n:integer ;var valor:boolean);
begin
	while(l<>nil)and(valor=false)do begin
		if(l^.dato=n)then begin
			valor:=true;
		end
		else begin
			valor:=false;
		end;
		l:=l^.sig;
	end;
end;

var
	l:lista;
	n:integer;
	val:boolean;
begin
	l:=nil;
	CargarListaOrdenada(l);
	ImprimirLista(l);
	writeln('Ingrese el valor a buscar: ');
	readln(n);
	BuscarElementoOrdenado(l, n, val);
	writeln(val);
end.
	
