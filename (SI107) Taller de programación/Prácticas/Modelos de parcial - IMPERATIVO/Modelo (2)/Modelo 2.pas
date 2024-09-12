program DOGIL;
type
	rango_diag='A'..'F';
		
	atencion=record
		matm:integer;
		dnip:integer;
		dia:integer;
		diag:rango_diag;
	end;

	reg_arb=record
		matm:integer;
		cant:integer;
	end;

	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:reg_arb;
		HI:arbol;
		HD:arbol;
	end;

	lista=^nodo_lista;
	
	nodo_lista=record
		dato:integer;
		sig:lista;
	end;

	vector=array[1..6] of lista;

procedure Inicializar_vector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 6 do begin
		v[i]:=nil;
	end;
end;

procedure Cargar_atencion(var at:atencion);
var
	va:array[1..6] of char = ('A', 'B', 'C', 'D', 'E', 'F');
begin
	at.matm:=random(100)+1;
	at.dnip:=random(100);
	at.dia:=random(31)+1;
	at.diag:=va[random(6)+1];
end;

procedure Agregar_arbol(var a:arbol; at:atencion);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.matm:=at.matm;
		a^.dato.cant:=1;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(at.matm=a^.dato.matm)then
			a^.dato.cant:=a^.dato.cant+1
		else begin
			if(at.matm<a^.dato.matm)then
				Agregar_arbol(a^.HI, at)
			else
				Agregar_arbol(a^.HD, at);
		end;
	end;
end;

procedure Insertar_Adelante(var l:lista; dni:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=dni;
	nue^.sig:=l;
	l:=nue;
end;

procedure Agregar_vector(var v:vector; at:atencion);
var
	i:integer;
begin
	if(at.diag='A')then
		i:=1;
	if(at.diag='B')then
		i:=2;
	if(at.diag='C')then
		i:=3;
	if(at.diag='D')then
		i:=4;
	if(at.diag='E')then
		i:=5;
	if(at.diag='F')then
		i:=6;

	Insertar_Adelante(v[i], at.dnip);
end;

procedure leerAtencion(var a:arbol; var v:vector);
var
	at:atencion;
begin
	Cargar_atencion(at);
	while(at.dnip<>0)do begin
		Agregar_arbol(a, at);
		Agregar_vector(v, at);
		Cargar_atencion(at);
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HI);
		
		writeln('---------------------------------------------------');
		writeln('Matricula del medico: ', a^.dato.matm);
		writeln('Cantidad de atenciones realizadas: ', a^.dato.cant);
		
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Imprimir_lista(l:lista);
begin
	while(l<>nil)do begin
		writeln('DNI: ', l^.dato);
		l:=l^.sig;
	end;
end;

procedure Actualizar_diag(var diag:rango_diag; i:integer);
begin
	if(i=1)then
		diag:='A';
	if(i=2)then
		diag:='B';
	if(i=3)then
		diag:='C';
	if(i=4)then
		diag:='D';
	if(i=5)then
		diag:='E';
	if(i=6)then
		diag:='F';
end;

procedure Imprimir_vector(v:vector);
var
	i:integer;
	aux:rango_diag;
begin
	for i:=1 to 6 do begin
		writeln(' ');
		Actualizar_diag(aux, i);
		writeln('Diag: ', aux);
		Imprimir_lista(v[i]);
	end;
end;
	
procedure Modulo_b(a:arbol; matming:integer; var cant:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.matm>matming)then begin
			cant:=cant+a^.dato.cant;
			Modulo_b(a^.HI, matming, cant);		//DEBO PASAR LOS DOS HIJOS DE FORMA OBLIGATORIA PARA SEGUIR RECORRIENDO
			Modulo_b(a^.HD, matming, cant);
		end
		else
			Modulo_b(a^.HD, matming, cant);
	end;
end;

procedure Recorrer_lista(l:lista; var cant:integer);
begin
	while(l<>nil)do begin
		cant:=cant+1;
		l:=l^.sig;
	end;
end;

procedure Modulo_c(v:vector; var diag:rango_diag; i:integer; var maycant:integer);		//MAL
var
	cant:integer;
begin
	cant:=0;
	if(i<7)then begin
		Recorrer_lista(v[i], cant);
		if(cant>maycant)then begin
			maycant:=cant;
			Actualizar_diag(diag, i);
		end;
		i:=i+1;
		Modulo_c(v, diag, i, maycant);
	end;
end;

var
	a:arbol;
	v:vector;
	cant, matming, maycant, i:integer;
	diag:rango_diag;
begin
	randomize;
	a:=nil;
	Inicializar_vector(v);
	
	leerAtencion(a, v);		//PUNTO A
	Imprimir_arbol(a);		//PRUEBA PUNTO A I
	Imprimir_vector(v);		//PRUEBA PUNTO A II
	
	cant:=0;
	matming:=95;
	Modulo_b(a, matming, cant);		//PUNTO B
	writeln(' ');
	writeln('Cantidad total de atenciones realizadas por los medicos con matricula superior a ', matming, ':  ',cant);
	
	maycant:=0;
	i:=1;
	Modulo_c(v, diag, i, maycant);		//PUNTO C
	writeln('Diagnostico con mayor cantidad de pacientes atendidos: ', diag);
end.	
