program julio;

type
	llamada = record
		nivImp : integer;
		sector : integer;
		empAfe : integer;
	end;
	
	arbol =^nodoArbol;
	
	nodoArbol = record
		dato : llamada;
		hi : arbol;
		hd : arbol;
	end;
	
	vector = array[1..100] of llamada;

procedure randomizarLlamada(var lla:llamada);
begin
	lla.nivImp := random(5)+1;
	lla.sector := random(50)+1;
	lla.empAfe := random(200)+1;
end;

procedure seleccion(var v:vector; dimLog:integer);
var
	i, j, pos:integer;
	item: llamada;
begin
	for i:=1 to dimLog - 1 do begin
		pos := i;
		for j:= i+1 to dimLog do
			if (v[j].nivImp < v[pos].nivImp)or((v[j].nivImp = v[pos].nivImp)and(v[j].sector < v[pos].sector))then
				pos := j;
		item := v[pos];
		v[pos] := v[i];
		v[i] := item;
	end;
end;

procedure simulacion(var v:vector);
var
	lla:llamada;
	i:integer;
begin
	for i:= 1 to 100 do begin
		randomizarLlamada(lla);
		v[i] := lla;
	end;
	seleccion(v, 100);
end;

procedure estructuraEficienteRecursiva(lla:llamada; var a:arbol);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=lla;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else begin
		if(lla.empAfe < a^.dato.empAfe)then
			estructuraEficienteRecursiva(lla, a^.hi)
		else
			estructuraEficienteRecursiva(lla, a^.hd);
	end;
end;

procedure estructuraEficiente(v:vector; nivel:integer; var a:arbol);
var
	i:integer;
begin
	for i:= 1 to 100 do begin
		if(v[i].nivImp = nivel)then 
			estructuraEficienteRecursiva(v[i], a);
	end;
end;

procedure sectorMayor(var a:arbol; var nSector:integer; var empAfe:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.empAfe >= empAfe)then begin
			empAfe := a^.dato.empAfe;
			nSector := a^.dato.sector;
		end;
		
		sectorMayor(a^.hi, nSector, empAfe);
		sectorMayor(a^.hd, nSector, empAfe);
	end;
end;

procedure imprimirArbol(var a:arbol);
begin
	if(a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln('------------------------');
		writeln('nivImp: ', a^.dato.nivImp);
		writeln('sector: ', a^.dato.sector); 
		writeln('empAfe: ', a^.dato.empAfe); 
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin
	for i:=1 to 100 do begin
		writeln('Nivel de importancia: ', v[i].nivImp);
		writeln('Sector: ', v[i].sector);
	end;
end;

var
	v:vector;
	a:arbol;
	nSector, empAfe:integer;
begin
	randomize;
	nSector := 0;
	empAfe:= 0;
	a:= nil;
	simulacion(v);
	imprimirVector(v);
	estructuraEficiente(v, 2, a);	//hardcode
	imprimirArbol(a);
	sectorMayor(a, nSector, empAfe);
	writeln('Sector del problema con mayor cantidad de empleados afectados: ', nSector);
end.
