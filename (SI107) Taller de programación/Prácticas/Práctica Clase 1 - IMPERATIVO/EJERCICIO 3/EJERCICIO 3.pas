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
  max=8;
type
  rango_gen=1..max;
  
  pelicula=record
    codp:integer;
    codg:rango_gen;
    punt:integer;
  end;
  
  pelicula2=record
	codp:integer;
	punt:integer;
  end;
  
  lista=^nodo;
  
  nodo=record
    dato:pelicula;
    sig:lista;
  end;
  
  veclis=array[rango_gen] of lista;
  vecmax=array[rango_gen] of pelicula2;

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

procedure AgregarAtras(var l:lista; p:pelicula);
var
  nue, aux:lista;
begin
  new(nue);
  nue^.dato:=p;
  nue^.sig:=nil;
  if(l=nil) then
    l:=nue
  else begin
    aux:=l;
    while(aux^.sig<>nil) do
      aux:=aux^.sig;
    aux^.sig:=nue;
  end;
end;

procedure InicializarListas(var v:veclis);
var
  i:integer;
begin
  for i:=1 to max do
    v[i]:=nil;
end;

procedure CargarListas(var v:veclis);
var
  p:pelicula;
begin
  LeerPelicula(p);
  while(p.codp<>-1)do begin
    AgregarAtras(v[p.codg], p);
    LeerPelicula(p);
  end;
end;

procedure ImprimirLista(l:lista);
begin
  while(l<>nil)do begin
    writeln('Codp: ', l^.dato.codp);
    writeln('Codg: ', l^.dato.codg);
    writeln('Punt: ', l^.dato.punt);
    l:=l^.sig;
  end;
end;

procedure ImprimirVecListas(v:veclis);
var
  i:integer;
begin
  for i:=1 to max do begin
    ImprimirLista(v[i]);
  end;
end;

procedure ProcesarLista(l:lista; var codpmax:integer; var puntmax:integer);
var
  aux:integer;
begin
  aux:=0;
  while(l<>nil)do begin
    if(l^.dato.punt>aux)then begin
      aux:=l^.dato.punt;
      codpmax:=l^.dato.codp;
      puntmax:=l^.dato.punt;
    end;
  l:=l^.sig;
  end;
end;

procedure ProcesarVecLis(v:veclis; var vp:vecmax);
var
  i, codpmax, puntmax: integer;
begin
  i:=0;
  for i:=1 to max do begin
    ProcesarLista(v[i], codpmax, puntmax);
    vp[i].codp:=codpmax;
    vp[i].punt:=puntmax;
  end;
end;

procedure ImprimirVector(v:vecmax);
var
  i:integer;
begin
  for i:=1 to max do begin
    writeln('Cod. de pelicula: ',v[i].codp);
    writeln('Punt. de pelicula: ',v[i].punt);
  end;
end;

procedure OrdenarVector(var v:vecmax);
var
	i, j, pos:rango_gen;
	item:integer;
begin
	for i:=1 to 7 do begin
		pos:=i;
		for j:=i+1 to 8 do begin
			if(v[j].punt<v[pos].punt)then	
				pos:=j;
			item:=v[pos].punt;
			v[pos]:=v[i];
			v[i].punt:=item;
		end;
	end;
end;

procedure ProcesarVector(vm:vecmax);		//REVISAR PORQUE FUNCIONA MAL
var
	i, puntmax, puntmin, codpmax, codpmin:integer;
begin
	i:=0;
	puntmax:=0;
	puntmin:=9999;
	codpmax:=0;
	codpmin:=0;
	for i:=1 to max do begin
		if(vm[i].punt>puntmax)then begin
			puntmax:=vm[i].punt;
			codpmax:=vm[i].codp;
		end;
		if(vm[i].punt<puntmin)then begin
			puntmin:=vm[i].punt;
			codpmin:=vm[i].codp;
		end;
	end;
	writeln('Cod. de pelicula con mayor puntaje: ', codpmax);
	writeln('Cod. de pelicula con menor puntaje: ', codpmin);
end;

var
  vl:veclis;
  vm:vecmax;
begin
  InicializarListas(vl);
  CargarListas(vl);
  {ImprimirVecListas(v);}
  ProcesarVecLis(vl, vm);
  {ImprimirVector(vm);}
  OrdenarVector(vm);
  {ImprimirVector(vm);}
  ProcesarVector(vm);
end.
