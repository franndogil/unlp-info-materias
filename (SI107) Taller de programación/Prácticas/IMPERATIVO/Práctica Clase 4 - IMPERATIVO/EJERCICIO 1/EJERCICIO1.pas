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
		montot:real;
	end;
	
	venta=record
		codv:integer;
		codpv:integer;
		cantuv:integer;
		preu:real;
	end;
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:producto;
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

procedure Agregar(var a:arbol; p:producto);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=p;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(p.codp=a^.dato.codp)then begin
			a^.dato.cantuv:=a^.dato.cantuv+p.cantuv;
			a^.dato.montot:=a^.dato.montot+p.montot;
		end
		else begin
			if(p.codp<a^.dato.codp)then
				Agregar(a^.HI, p)
			else
				Agregar(a^.HD, p);
		end;
	end;
end;

procedure Generar_arbol(var a:arbol);		//PUNTO A
var
	v:venta;
	p:producto;
begin
	Leer_venta(v);
	while(v.codv<>0)do begin
		p.codp:=v.codpv;
		p.cantuv:=v.cantuv;
		p.montot:=v.preu*v.cantuv;
		Agregar(a, p);
		Leer_venta(v);
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HD);
		writeln('-----------------------------------------------');
		writeln('Codigo de producto vendido: ', a^.dato.codp);
		writeln('Cantidad de unidades vendidas: ', a^.dato.cantuv);
		writeln('Monto total: ', a^.dato.montot:2:2);
		Imprimir_arbol(a^.HI);
	end;
end;

procedure Men_cod_pro(a:arbol; var cod:integer);	//PUNTO C
begin
	if(a<>nil)then begin
		if(a^.dato.codp<=cod)then
			cod:=a^.dato.codp;
		Men_cod_pro(a^.HD, cod);
		Men_cod_pro(a^.HI, cod);
	end;
end;

procedure Cant_menores(a:arbol; cod:integer; var cant:integer);		//PUNTO D
begin
	if(a<>nil)then begin
		if(a^.dato.codp<cod)then
			cant:=cant+1;
		Cant_menores(a^.HD, cod, cant);
		Cant_menores(a^.HI, cod, cant);
	end;
end;

function Monto_total(a:arbol; min:integer; max:integer):real;		//PUNTO E
begin
	if(a=nil)then
		Monto_total:=0
	else begin
		if(a^.dato.codp > min)then begin
			if(a^.dato.codp < max)then begin
				Monto_total:=a^.dato.montot + Monto_total(a^.HI, min, max) + Monto_total(a^.HD, min, max);
			end
			else
				Monto_total:=Monto_total(a^.HI, min, max);
		end
		else
			Monto_total:=Monto_total(a^.HD, min, max);
	end;
end;

var
	a:arbol;
	mencod, codpro, cantcodpro, min, max:integer;
begin
	randomize;
	a:=nil;
	mencod:=9999;
	cantcodpro:=0;
	min:=9999;
	max:=-1;
	Generar_arbol(a);	//PUNTO A
	Imprimir_arbol(a);	//PUNTO B
	
	Men_cod_pro(a, mencod);	//PUNTO C
	writeln('Menor codigo de producto vendido: ', mencod);
	write('Ingrese un codigo de producto: ');
	
	read(codpro);
	Cant_menores(a, codpro, cantcodpro);	//PUNTO D
	writeln('Cantidad de codigos menores que el codigo ingresado: ', cantcodpro);
	
	min:=5;
	max:=20;								
	writeln('Monto total vendido entre el producto min y el producto max: ', Monto_total(a, min, max):2:2);	//PUNTO E
end.

