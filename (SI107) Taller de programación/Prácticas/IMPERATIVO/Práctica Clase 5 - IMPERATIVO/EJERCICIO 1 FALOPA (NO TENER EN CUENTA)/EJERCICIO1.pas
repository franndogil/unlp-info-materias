{1. El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}

program ejercicio1;
const
	dimF=300;
type
	oficina=record
		codi:integer;
		dni:integer;
		vale:real;
	end;
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:oficina;
		HI:arbol;
		HD:arbol;
	end;
	
	vector=array[1..dimF] of oficina;

procedure Generar_oficina(var o:oficina);
begin
	o.codi:=random(300);
	o.dni:=random(1000);
	o.vale:=random(200);
end;

procedure Agregar(var a:arbol; o:oficina);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=o;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(o.codi<a^.dato.codi)then 
			Agregar(a^.HI, o)
		else
			Agregar(a^.HD, o);
	end;
end;

procedure Generar_arbol(var a:arbol);
var
	o:oficina;
begin
	Generar_oficina(o);
	while(o.codi<>0)do begin
		Agregar(a, o);
		Generar_oficina(o);
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		
		writeln('---------------------');
		writeln('Codigo de identificacion: ', a^.dato.codi);
		writeln('DNI: ', a^.dato.dni);
		writeln('Valor de la expensa: ', a^.dato.vale:2:2);
			
		Imprimir_arbol(a^.HI);
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Generar_vector(a:arbol; var v:vector; var dimLog:integer);
begin
	if(dimLog<300)and(a<>nil)then begin
		dimLog:=dimLog+1;
		v[dimLog]:=a^.dato;
		Generar_vector(a^.HI, v, dimLog);
		Generar_vector(a^.HD, v, dimLog);
	end;
end;

procedure Imprimir_vector(v:vector; dimLog:integer);
var
	i:integer;
begin
	for i:=1 to dimLog do begin
		writeln('Codigo de identificacion: ', v[i].codi);
		writeln('DNI: ', v[i].dni);
		writeln('Valor de la expensa: ', v[i].vale:2:2);
	end;
end;

var
	a:arbol;
	v:vector;
	dimL:integer;
begin
	randomize;
	a:=nil;
	dimL:=0;
	
	Generar_arbol(a);
	writeln('---------------IMPRESION DEL ARBOL---------------');
	Imprimir_arbol(a);
	
	Generar_vector(a, v, dimL);
	writeln('---------------IMPRESION DEL VECTOR---------------');
	Imprimir_vector(v, dimL);
	
	
end.
	
	
	
	
	
	
