{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de 
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje 
promedio otorgado por las críticas. 
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de 
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el 
código de la película -1. 
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje 
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos 
métodos vistos en la teoría. 
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje, 
del vector obtenido en el punto c).}

program ejer3;
const
	maxgen=8;
type
	rango_gen=1..maxgen;
	
	pelicula=record
		codp:integer;
		codg:rango_gen;
		punt:real;
	end;
	
	lista=^nodo;
	
	nodo=record
		dato:pelicula;
		sig:lista;
	end;
	
	vecgen=array[rango_gen] of integer;
	
procedure InsertarOrdenado(var l:lista; num:integer; p:pelicula);
var
	nue, act, ant:lista;
begin
	new(nue);
	nue^.dato:=p;
	act:=l;
	ant:=l;
	
	while(act<>nil)and(num>act^.dato.codp)do begin
		ant:=act;
		act:=act^.sig;
	end;
	
	if(act=ant)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure LeerPelicula(var p:pelicula);
begin
	writeln('Ingrese el codigo de la pelicula: ');
	readln(p.codp);
	if(p.codp<>-1)then begin
		writeln('Ingrese el codigo de genero: ');
		readln(p.codg);
		writeln('Ingrese el puntaje de la pelicula : ');
		readln(p.punt);
	end;
end;
	
procedure CargarLista(var l:lista);
var
	p:pelicula;
begin
	LeerPelicula(p);
	while(p.codp<>-1)do begin
		InsertarOrdenado(l, p.codg, p);	//se ordena por codigo de genero
		LeerPelicula(p);
	end;
end;

procedure ImprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln('Codigo de pelicula: ', l^.dato.codp);
		writeln('Genero de pelicula: ', l^.dato.codg);
		writeln('Puntaje de pelicula: ', l^.dato.punt);
		l:=l^.sig;
	end;
end;

procedure Procesar(l:lista; var v:vecgen; dimLog:integer);
var
	i, genact, codpmax:integer;
	puntmax:real;
begin
	i:=0;
	while(l<>nil)do begin
		i:=i+1;
		dimLog:=dimLog+1;
		puntmax:=0;
		genact:=l^.dato.codg;
		while(l^.dato.codg=genact)do begin
			if(l^.dato.punt>puntmax)then begin
				puntmax:=l^.dato.punt;
				codpmax:=l^.dato.codp;
			end;
			l:=l^.sig;
		end;
		v[i]:=codpmax;
	end;
end;

procedure ImprimirVector(v:vecgen; dimLog:integer);
var
	i:integer;
begin
	i:=0;
	for i:=1 to dimLog do
		writeln(v[i]);
end;

var
	l:lista;
	v:vecgen;
	dimL:integer;
begin
	dimL:=0;
	l:=nil;
	CargarLista(l);
	ImprimirLista(l);
	Procesar(l, v, dimL);
	ImprimirVector(v, dimL);
end.
