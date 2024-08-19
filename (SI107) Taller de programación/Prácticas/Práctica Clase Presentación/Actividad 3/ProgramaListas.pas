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
	
procedure AgregarAdelante(var l:lista; s:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=s;
	nue^.sig:=l;	
	l:=nue;		//realizo el enlace
end;
	
procedure CargarLista(var l:lista);
var
	num:integer;
begin
	randomize;
	num:=0;
	repeat
		num:=random(b-a+1)+a;
		AgregarAdelante(l, num);
	until (num=120);
end;

procedure ImprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dato);
		l:=l^.sig;
	end;
end;

procedure BuscarElemento(l:lista; n:integer ;var valor:boolean);
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
	CargarLista(l);
	ImprimirLista(l);
	writeln('Ingrese el valor a buscar: ');
	readln(n);
	BuscarElemento(l, n, val);
	writeln(val);
end.
	
	
	
