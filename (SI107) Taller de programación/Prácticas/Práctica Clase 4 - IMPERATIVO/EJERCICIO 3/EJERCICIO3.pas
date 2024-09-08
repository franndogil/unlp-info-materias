{3. Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

program ejercicio3;
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
		dato:venta;
		HI:arbol;
		HD:arbol;
	end;
	
procedure Procesar_venta(var v:venta);
begin
	v.codv:=random(30)-1;
	v.codpv:=random(100)+1;
	v.cantuv:=random(15);
	v.preu:=random(50);
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
		if(v.codpv<=a^.dato.codpv)then
			Agregar(a^.HI, v)
		else
			Agregar(a^.HD, v);
	end;
end;

procedure Generar_arbol(var a:arbol);		//PUNTO A
var
	v:venta;
begin
	Procesar_venta(v);
	while(v.codv<>-1)do begin
		Agregar(a, v);
		Procesar_venta(v);
	end;
end;

procedure Imprimir_arbol(a:arbol);		//PUNTO B
begin
	if (a<>nil)then begin
		Imprimir_arbol(a^.HD);
		writeln('------------------------------------');
		writeln('Codigo de producto: ', a^.dato.codpv);
		writeln('Codigo de venta: ', a^.dato.codv);
		writeln('Cantidad de unidades vendidas: ', a^.dato.cantuv);
		writeln('Precio Unitario: ', a^.dato.preu:2:2);
		Imprimir_arbol(a^.HI);
	end;
end;

procedure Cod_may_uven(a:arbol; var cod:integer; var cant:integer);		//PUNTO C
begin
	if(a<>nil)then begin
		if(a^.dato.cantuv>=cant)then begin
			cant:=a^.dato.cantuv;
			cod:=a^.dato.codpv;
		end;
		Cod_may_uven(a^.HI, cod, cant);
		Cod_may_uven(a^.HD, cod, cant);
	end;
end;

procedure Cant_men_val(a:arbol; par:integer; var cant:integer);		//PUNTO D
begin
	if(a<>nil)then begin
		if(a^.dato.codpv<par)then
			cant:=cant+1;
		Cant_men_val(a^.HI, par, cant);
		Cant_men_val(a^.HD, par, cant);
	end;
end;

procedure Mont_tot(a:arbol; min:integer; max:integer; var monto:real);	//PUNTO E MAL RESUELTO
var
	monto_act:real;
begin
	monto_act:=0;
	if(a<>nil)then begin
		if(a^.dato.codpv>min)then begin
			if(a^.dato.codpv<max)then begin
				monto_act:=a^.dato.preu*a^.dato.cantuv;
				monto:=monto+monto_act;
			end
			else
				Mont_tot(a^.HI, min, max, monto);
		end
		else
			Mont_tot(a^.HD, min, max, monto);
	end
end;

function Monto_total(a:arbol; min:integer; max:integer):real;		//PUNTO E
var
	monto_act:real;
begin
	monto_act:=0;
	if(a = nil)then
		Monto_total:=0
	else begin
		if(a^.dato.codpv > min)then begin
			if(a^.dato.codpv < max)then begin
				monto_act:=a^.dato.cantuv*a^.dato.preu;
				Monto_total:=monto_act + Monto_total(a^.HI, min, max) + Monto_total(a^.HD, min, max);
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
	codmcuv, cantmuv, par, cantmenp, min, max:integer;
begin
	randomize;
	a:=nil;
	codmcuv:=0;
	cantmuv:=0;
	cantmenp:=0;
	Generar_arbol(a);		//PUNTO A
	Imprimir_arbol(a);		//PUNTO B
	
	writeln('---------------------------------------------------------------');
	Cod_may_uven(a, codmcuv, cantmuv);														//PUNTO C
	Writeln('Codigo de producto con mayor cantidad de unidades vendidas: ', codmcuv);
	
	writeln('----------------------------------------------------------------------------------------------------');
	par:=10;
	Cant_men_val(a, par, cantmenp);															//PUNTO D
	writeln('Cantidad de codigos que existen en el arbol que son menores que el valor recibido como parametro: ', cantmenp);
	
	{monto:=0;			//MAAAAAAAAL(SOLO ME GUARDA EL MAS GRANDE)
	min:=5;
	max:=20;
	Mont_tot(a, min, max, monto);
	writeln('Monto total entre todos los códigos de productos comprendidos entre los valores recibidos: ', monto:2:2);}
	
	writeln('-------------------------------------------------------------------------------------------------');		//PUNTO E
	min:=5;
	max:=20;
	writeln('Monto total entre todos los codigos de productos comprendidos entre los valores recibidos: ',Monto_total(a, min, max):2:2);
end.






