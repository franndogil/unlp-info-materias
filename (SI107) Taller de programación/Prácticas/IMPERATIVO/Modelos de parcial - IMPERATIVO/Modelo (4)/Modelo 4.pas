program DOGIL;
type
	rango_mes=1..12;
	rango_diag='L'..'P';
	
	atencion=record
		matm:integer;
		dnip:integer;
		mes:rango_mes;
		diag:rango_diag;
	end;

	reg_arbol=record
		dnip:integer;
		diag:rango_diag;
	end;

	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:reg_arbol;
		HI:arbol;
		HD:arbol;
	end;
	
	vector=array[1..12] of arbol;

procedure Generar_atencion(var at:atencion);
var
	v:array[1..5] of char = ('L','M','N','O','P');
begin
	at.matm:=random(100);
	if(at.matm<>0)then begin
		at.dnip:=random(100)+1;
		at.mes:=random(12)+1;
		at.diag:=v[random(5)+1];
	end;
end;

procedure Agregar_arbol(var a:arbol; at:atencion);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.dnip:=at.dnip;
		a^.dato.diag:=at.diag;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(at.dnip<a^.dato.dnip)then
			Agregar_arbol(a^.HI, at)
		else
			Agregar_arbol(a^.HD, at);
	end;
end;

procedure Cargar_vector(var v:vector; at:atencion);
begin
	Agregar_arbol(v[at.mes], at);
end;

procedure Generar_vector(var v:vector);
var
	at:atencion;
begin
	Generar_atencion(at);
	while(at.matm<>0)do begin
		Cargar_vector(v, at);
		Generar_atencion(at);
	end;
end;

procedure Inicializar_vector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 12 do begin
		v[i]:=nil;
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HI);
		
		writeln('Dni del paciente: ', a^.dato.dnip);
		writeln('Diagnostico: ', a^.dato.diag);
		writeln('');
		
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Imprimir_vector(v:vector);
var
	i:integer;
begin
	for i:=1 to 12 do begin
		writeln('');
		writeln('---------------------');
		writeln('Mes ', i, ':' );
		writeln('---------------------');
		writeln('');
		Imprimir_arbol(v[i]);
	end;
end;

procedure Recorrer_arbol(a:arbol; var cant:integer);
begin
	if(a<>nil)then begin
		cant:=cant+1;
		
		Recorrer_arbol(a^.HI, cant);
		Recorrer_arbol(a^.HD, cant);
	end;
end;

procedure Modulo_b(v:vector; var mesmay:integer; var maycant:integer; var i:integer);
var
	cant:integer;
begin
	cant:=0;
	if(i<13)then begin
		Recorrer_arbol(v[i], cant);
		if(cant>=maycant)then begin
			maycant:=cant;
			mesmay:=i;
		end;
		i:=i+1;
		Modulo_b(v, mesmay, maycant, i);
	end;
end;

procedure Recorrer_arbol_c(a:arbol; dnipin:integer; var ok:boolean);
begin
	if(a<>nil)then begin
		if(dnipin=a^.dato.dnip)then begin
			ok:=true;
		end
		else begin
			if(dnipin<a^.dato.dnip)then
				Recorrer_arbol_c(a^.HI, dnipin, ok)
			else
				Recorrer_arbol_c(a^.HD, dnipin, ok);
		end;
	end;
end;

procedure Modulo_c(v:vector; dnipin:integer; var ok:boolean);
var
	i:integer;
begin
	for i:=1 to 12 do begin
		if(ok<>true)then begin
			Recorrer_arbol_c(v[i], dnipin, ok);
		end;
	end;
end;


var
	v:vector;
	mesmay, maycant, i, dnipin:integer;
	ok:boolean;
begin
	randomize;
	Inicializar_vector(v);
	Generar_vector(v);		//PUNTO A
	Imprimir_vector(v);
	
	mesmay:=0;
	maycant:=0;				//PUNTO B
	i:=1;
	Modulo_b(v, mesmay, maycant, i);
	writeln('Mes con mayor cantidad de atenciones: ', mesmay);
	
	dnipin:=10;
	ok:=false;
	Modulo_c(v, dnipin, ok);		//PUNTO C
	if(ok=true)then
		writeln('El dni ', dnipin, ' fue atendido.')
	else
		writeln('El dni ', dnipin, ' no fue atendido.');
	
end.
