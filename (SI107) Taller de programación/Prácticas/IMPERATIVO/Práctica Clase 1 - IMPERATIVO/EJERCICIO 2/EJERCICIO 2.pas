{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de 
las expensas de dichas oficinas. 
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina 
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura 
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la 
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program ejer2;
const
	maxofi=300;
type
	rango_ofi=1..maxofi;
	
	oficina=record
		cod:integer;
		dni:integer;
		val:real;
	end;
	
	vecofi=array[rango_ofi]of oficina;

procedure LeerOficina(var ofi:oficina);
begin
	writeln('Ingrese el codigo de identificacion: ');
	readln(ofi.cod);
	if(ofi.cod<>-1)then begin
		writeln('Ingrese el DNI del propietario: ');
		readln(ofi.dni);
		writeln('Ingrese el valor de la expensa: ');
		readln(ofi.val);
	end;
end;

procedure CargarVector(var v:vecofi; var dimLog:integer);
var
	i:integer;
	ofi:oficina;
begin
	i:=0;
	LeerOficina(ofi);
	while(ofi.cod<>-1)and(i<50)do begin
		i:=i+1;
		v[i]:=ofi;
		LeerOficina(ofi);
	end;
	dimLog:=i;
end;

procedure ImprimirVector(v:vecofi; dimLog:integer);		//de mas pero me sirve para ver que guarde bien los datos
var
	i:integer;
	aux:oficina;
begin
	i:=0;
	for i:=1 to dimLog do begin
		aux:=v[i];
		writeln('Codigo de identificacion: ', aux.cod);
		writeln('DNI del propietario: ', aux.dni);
		writeln('Valor de la expensa: ', aux.val);
	end;
end;

procedure OrdenacionPorInsercion(var v:vecofi; dimLog:integer);	//empezamos a analizar desde la segunda pos del vector
var
	i, j:rango_ofi;
	actual:oficina;		//va a ser nuestro auxiliar para no perder oficinas
begin									//ejemplo de la primera vuelta
	for i:=2 to dimLog do begin
		actual:=v[i];					//actual toma la 2da pos del vector
		j:=i-1;							//j=2-1=1 (uno)
		while(j>0)and(v[j].cod>actual.cod)do begin	//mientras j sea mayor a 0 (es uno 1) y el cod del anterior (pos 1) sea mayor al cod de
													//la pos 2 (actual)
			v[j+1]:=v[j];		//el actual (pos 2) va a tomar la pos del anterior (pos 1)	
			j:=j-1;		//disminuyo j (J=1-1=0)
		end;	//sale del while pues j ya vale 0 y es condicion
		v[j+1]:=actual; //el anterior (pos 1) toma la pos del actual (pos 2)
	end;
end;

procedure OrdenacionPorSeleccion(var v:vecofi; dimLog:integer);
var
	i, j, pos:rango_ofi;
	item:oficina;
begin
	for i:=1 to dimLog-1 do begin
		pos:=i;
		for j:=i+1 to dimLog do begin
			if(v[j].cod<v[pos].cod)then		//comparo por cod de identificacion
				pos:=j;
			item:=v[pos];
			v[pos]:=v[i];
			v[i]:=item;
		end;
	end;
end;

var
	v:vecofi;
	dimL:integer;
begin
	CargarVector(v, dimL);
	writeln('Vector tal cual fue ingresado: ');
	ImprimirVector(v, dimL);
	OrdenacionPorInsercion(v, dimL);
	writeln('Vector ordenado por insercion: ');
	ImprimirVector(v, dimL);
	OrdenacionPorSeleccion(v, dimL);
	writeln('Vector ordenado por seleccion: ');
	ImprimirVector(v, dimL);
end.
