{a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se cargan código
de venta, código del producto vendido, cantidad de unidades vendidas y precio
unitario. El ingreso de las ventas finaliza cuando se lee el código de venta 0.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el menor código de producto.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

program ejercicio1;
type
	producto=record
		codp:integer;
		cantuv:integer;
		monto:real;
	end;
	
	venta=record
		codv:integer;
		codpv:integer;
		cantuv:integer;
		preu:real;
	end;
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:venta;
		HI:arbol;
		HD:arbol;
	end;

procedure Leer_venta(var v:venta);
begin
	v.codv:=random(10);
	v.codpv:=random(100)+1;
	v.cantuv:=random(50)+1;
	v.preu:=random(100)+1;
end;

procedure Agregar(var a:arbol; v:venta);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=v;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(a^.dato.codpv<v.codpv)then
			Agregar(a^.HI, v)
		else
			Agregar(a^.HD, v);
	end;
end;
	
procedure Cargar_ventas(var a:arbol);
var
	v:venta;
begin
	Leer_venta(v);
	while(v.codv<>0)do begin
		Agregar(a, v);
		Leer_venta(v);
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HI);
		writeln('-----------------------------------------------');
		writeln('Codigo de venta: ', a^.dato.codv);
		writeln('Codigo de producto vendido: ', a^.dato.codpv);
		writeln('Cantidad de unidades vendidas: ', a^.dato.cantuv);
		writeln('Precio unitario: ', a^.dato.preu:2:2);
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Men_cod_pro(a:arbol; var cod:integer);	//PUNTO C
begin
	if(a<>nil)then begin
		if(a^.dato.codpv<=cod)then
			cod:=a^.dato.codpv;
		Men_cod_pro(a^.HD, cod);
		Men_cod_pro(a^.HI, cod);
	end;
end;

procedure Cant_menores(a:arbol; cod:integer; var cant:integer);		//PUNTO D
begin
	if(a<>nil)then begin
		if(a^.dato.codpv<cod)then
			cant:=cant+1;
		Cant_menores(a^.HD, cod, cant);
		Cant_menores(a^.HI, cod, cant);
	end;
end;

procedure Monto_tot(a:arbol; var monto:real; min:integer; max:integer);		//PUNTO E
var
	montoact:real;
begin
	montoact:=0;
	if(a<>nil)then begin
		if(a^.dato.codpv>min)then begin
			if(a^.dato.codpv<max)then begin
				montoact:=a^.dato.preu*a^.dato.cantuv;
				monto:=monto+montoact;
			end;
		end
		else begin
			if(a^.dato.codpv>max)then
				Monto_tot(a^.HD, monto, min, max);
			if(a^.dato.codpv<min)then
				Monto_tot(a^.HI, monto, min, max);
		end;
	end;
end;

var
	a:arbol;
	mencod, codpro, cantcodpro, min, max:integer;
	monto:real;
begin
	randomize;
	a:=nil;
	mencod:=9999;
	cantcodpro:=0;
	monto:=0;
	min:=9999;
	max:=-1;
	Cargar_ventas(a);	//PUNTO A
	Imprimir_arbol(a);	//PUNTO B
	Men_cod_pro(a, mencod);	//PUNTO C
	writeln('Menor codigo de producto vendido: ', mencod);
	write('Ingrese un codigo de producto: ');
	read(codpro);
	Cant_menores(a, codpro, cantcodpro);	//PUNTO D
	writeln('Cantidad de codigos menores que el codigo ingresado: ', cantcodpro);
	writeln('Ingrese el codigo de producto minimo: ');		//PUNTO E
	readln(min);												//PUNTO E
	writeln('Ingrese el codigo de producto maximo: ');		//PUNTO E
	readln(max);												//PUNTO E
	Monto_tot(a, monto, min, max);								//PUNTO E
	writeln('Monto total vendido entre el producto min y el producto max: ', monto:2:2);	//PUNTO E
end.

