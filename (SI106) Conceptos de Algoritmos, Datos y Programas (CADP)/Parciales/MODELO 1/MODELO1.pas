program MODELO1;
const
	max_nota=10;
	max_eval=10;
type
	rango_eval=1..max_eval;
	rango_nota=-1..max_nota;
	
	vecnotas=array[rango_eval]of rango_nota;
	
	alumno=record
		dni:integer;
		nombre:string;
		apellido:string;
		aing:integer;		//año de ingreso
		notas:vecnotas;
	end;

	lista=^nodo;
	
	nodo=record
		dato:alumno;
		sig:lista;
	end;
	
procedure Leer_notas(var v:vecnotas);
var
	i:integer;
begin
	i:=0;
	for i:=1 to max_nota do begin
		write('Ingrese la nota numero ', i, ':');
		readln(v[i]);
	end;
end;
	
procedure Leer_alumno(var a:alumno);
begin
	write('Ingrese el DNI: ');
	readln(a.dni);
	write('Ingrese el nombre: ');
	readln(a.nombre);
	write('Ingrese el apellido: ');
	readln(a.apellido);
	write('Ingrese el año de ingreso: ');
	readln(a.aing);
	writeln('Ingrese la nota obtenida en las 10 autoevaluaciones: ');
	Leer_notas(a.notas);
end;

procedure Agregar_adelante(var l:lista; a:alumno);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:=a;
	nuevo^.sig:=l;
	l:=nuevo;
end;

Procedure Cargar_alumnos(var l:lista);
var
	a:alumno;
begin
	repeat
		Leer_alumno(a);
		Agregar_adelante(l, a);
	until (a.dni=3301);		//en realidad es 33016244 pero no entra en el tipo de dato integer
end;	

function cumple_cond(v:vecnotas):boolean;
var
	i, cont, aprobados:integer;
	ok:boolean;
begin
	i:=0;
	cont:=0;
	aprobados:=0;
	for i:=1 to 10 do begin
		if(v[i]>=6)then
			aprobados:=aprobados+1;
		if(v[i]>=0)then
			cont:=cont+1;
	end;
	if(cont>=8)and(aprobados>=4)then
		ok:=true
	else
		ok:=false;
	cumple_cond:=ok;
end;

function es_par(dni:integer):boolean;
var
	dig, suma:integer;
	ok:boolean;
begin
	dig:=0;
	suma:=0;
	while(dni<>0)do begin
		dig:=dni mod 10;
		suma:=suma+dig;
		dni:=dni div 10;
	end;
	if(suma mod 2=0)then
		ok:=true
	else
		ok:=false;
		
	es_par:=ok;
end;

function cumple_cond_2(v:vecnotas):boolean;
var
	i, cont:integer;
	ok:boolean;
begin
	i:=0;
	cont:=0;
	for i:=1 to 10 do
		if(v[i]>=0)then
			cont:=cont+1;
	if(cont=10)then
		ok:=true
	else
		ok:=false;
		
	cumple_cond_2:=ok;
end;

procedure Procesar(l:lista);
var
	porcentaje:real;
	cont, contp:integer;
begin
	cont:=0;
	contp:=0;
	porcentaje:=0;
	while(l<>nil)do begin
		cont:=cont+1;
		if(cumple_cond(l^.dato.notas))then
			writeln('DNI: ', l^.dato.dni);
		if(es_par(l^.dato.dni))then begin
			writeln('Apellido: ', l^.dato.apellido);
			writeln('Nombre: ', l^.dato.nombre);
		end;
		if(l^.dato.aing=2020)then
			if(cumple_cond_2(l^.dato.notas))then
				contp:=contp+1;
		l:=l^.sig;
	end;
	porcentaje:=contp/cont*100;
	writeln('Porcentaje: ', porcentaje);
end;

var		//programa principal
	l:lista;
begin
	l:=nil;
	Cargar_alumnos(l);
	Procesar(l);
end.
