{3. Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program ejer3;
const
	max_dia=31;
	max_mes=12;
	max_anio=2024;
type
	rango_dia=1..max_dia;
	rango_mes=1..max_mes;
	rango_anio=2020..max_anio;
	
	fecha=record
		dia:rango_dia;
		mes:rango_mes;
		anio:rango_anio;
	end;

	finalR=record
		legajo:integer;
		codm:integer;
		fe:fecha;
		nota:integer;
	end;
	
	lista=^nodo;
	
	nodo=record
		dato:finalR;
		sig:lista;
	end;
	
	alumno=record
		legajo:integer;
		finales:lista;
	end;
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;
	
	alumno2=record
		legajo:integer;
		prom:real;
	end;
	
	lista2=^nodo_lista2;
	
	nodo_lista2=record
		dato:alumno2;
		sig:lista2;
	end;
	
procedure Leer_final(var f:finalR);
begin
	f.legajo:=random(10);
	if(f.legajo<>0)then begin
		f.codm:=random(10);
		f.nota:=random(10);
		f.fe.dia:=random(30)+1;
		f.fe.mes:=random(12)+1;
		f.fe.anio:=random(4)+2020;
	end;
end;

procedure Agregar_adelante(var l:lista; f:finalR);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=f;
	nue^.sig:=l;
	l:=nue;
end;

procedure Agregar(var a:arbol; f:finalR);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.legajo:=f.legajo;
		a^.dato.finales:=nil;
		Agregar_adelante(a^.dato.finales, f);
	end
	else begin
		if(a^.dato.legajo=f.legajo)then begin
			Agregar_adelante(a^.dato.finales, f);
		end
		else begin
			Agregar(a^.HI, f);
			Agregar(a^.HD, f);
		end;
	end;
end;

procedure Generar_arbol(var a:arbol);		//PUNTO A
var
	f:finalR;
begin
	Leer_final(f);
	while(f.legajo<>0)do begin
		Agregar(a, f);
		Leer_final(f);
	end;
end;

procedure Imprimir_fecha(fe:fecha);
begin
	writeln('Dia: ', fe.dia);
	writeln('Mes: ', fe.mes);
	writeln('Anio: ', fe.anio);
end;

procedure Imprimir_finales(l:lista);
begin
	while(l<>nil)do begin
		writeln('Codigo de materia: ', l^.dato.codm);
		Imprimir_fecha(l^.dato.fe);
		writeln('Nota: ', l^.dato.nota);
		l:=l^.sig;
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		writeln('------------------------------------------------');
		writeln('Numero de legajo: ', a^.dato.legajo);
		writeln('Finales que rindio: ');
		Imprimir_finales(a^.dato.finales);
		Imprimir_arbol(a^.HI);
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Cant_legajo_impar(a:arbol; var cant:integer);		//PUNTO B
begin
	if(a<>nil)then begin
		if(a^.dato.legajo mod 2=1)then
			cant:=cant+1;
		Cant_legajo_impar(a^.HI, cant);
		Cant_legajo_impar(a^.HD, cant);
	end;
end;

procedure Sumar(l:lista; var cant:integer);
begin
	while(l<>nil)do begin
		if(l^.dato.nota>=4)then
			cant:=cant+1;
		l:=l^.sig;
	end;
end;

procedure Cant_finales_aprobados(a:arbol);		//PUNTO C
var
	cant:integer;
begin
	cant:=0;
	if(a<>nil)then begin
		Sumar(a^.dato.finales, cant);
		writeln('---------------------');
		writeln('Legajo: ', a^.dato.legajo);
		writeln('Cantidad de finales aprobados: ', cant);
		
		Cant_finales_aprobados(a^.HI);
		Cant_finales_aprobados(a^.HD);
	end;
end;

procedure Sumar2(l:lista; var suma:real; var cant:integer);
begin
	while(l<>nil)do begin
		suma:=suma+l^.dato.nota;
		cant:=cant+1;
		l:=l^.sig;
	end;
end;

procedure Agregar_adelante_2(var l:lista2; a:alumno2);
var
	nue:lista2;
begin
	new(nue);
	nue^.dato:=a;
	nue^.sig:=l;
	l:=nue;
end;

procedure Leg_y_prom(a:arbol; var l:lista2; val:real);
var
	cant:integer;
	prom, suma:real;
	aux:alumno2;
begin
	suma:=0;
	cant:=0;
	prom:=0;
	if(a<>nil)then begin
		Sumar2(a^.dato.finales, suma, cant);
		prom:=suma/cant;
		if(prom>val)then begin
			aux.legajo:=a^.dato.legajo;
			aux.prom:=prom;
			Agregar_adelante_2(l, aux);
		end;
		Leg_y_prom(a^.HI, l, val);
		Leg_y_prom(a^.HD, l, val);
	end;
end;

procedure Imprimir_lista(l:lista2);
begin
	while(l<>nil)do begin
		writeln('----------------------------');
		writeln('Legajo: ', l^.dato.legajo);
		writeln('Promedio: ', l^.dato.prom:2:2);
		l:=l^.sig;
	end;
end;

var
	a:arbol;
	cantlegimpar:integer;
	l:lista2;
	valor:real;
begin
	randomize;
	a:=nil;
	l:=nil;
	valor:=0;
	cantlegimpar:=0;
	Generar_arbol(a);		//PUNTO A
	Imprimir_arbol(a);		//PUNTO A
	Cant_legajo_impar(a, cantlegimpar);									//PUNTO B
	writeln('Cantidad de alumnos con legajo impar: ', cantlegimpar);	//PUNTO B
	Cant_finales_aprobados(a);		//PUNTO C
	write('Ingrese promedio: ');	//PUNTO D
	readln(valor);					//PUNTO D
	Leg_y_prom(a, l, valor);		//PUNTO D
	Imprimir_lista(l);				//PUNTO D
end.
	
