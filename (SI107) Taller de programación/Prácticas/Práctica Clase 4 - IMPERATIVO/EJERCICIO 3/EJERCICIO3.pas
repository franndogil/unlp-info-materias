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
		dato:producto;
		HI:arbol;
		HD:arbol;
	end;
	
procedure Procesar_venta(var v:venta);
begin
	v.codv:=random(30)-1;
	v.codpv:=random(100)+1;
	v.cantuv:=random(15)+1;
	v.preu:=random(50)+1;
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
	Procesar_venta(v);
	while(v.codv<>-1)do begin
		p.codp:=v.codpv;
		p.cantuv:=v.cantuv;
		p.montot:=v.cantuv*v.preu;
		Agregar(a, p);
		Procesar_venta(v);
	end;
end;

procedure Imprimir_arbol(a:arbol);		//PUNTO B
begin
	if (a<>nil)then begin
		Imprimir_arbol(a^.HD);
		writeln('------------------------------------');
		writeln('Codigo de producto: ', a^.dato.codp);
		writeln('Cantidad de unidades vendidas: ', a^.dato.cantuv);
		writeln('Monto total: ', a^.dato.montot:2:2);
		Imprimir_arbol(a^.HI);
	end;
end;

procedure Cod_may_uven(a:arbol; var cod:integer; var cant:integer);		//PUNTO C
begin
	if(a<>nil)then begin
		if(a^.dato.cantuv>=cant)then begin
			cant:=a^.dato.cantuv;
			cod:=a^.dato.codp;
		end;
		Cod_may_uven(a^.HI, cod, cant);
		Cod_may_uven(a^.HD, cod, cant);
	end;
end;

procedure Cant_men_val(a:arbol; par:integer; var cant:integer);		//PUNTO D
begin
	if(a<>nil)then begin
		if(a^.dato.codp<par)then
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
		if(a^.dato.codp>min)then begin
			if(a^.dato.codp<max)then begin
				monto_act:=a^.dato.montot;
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
begin
	if(a = nil)then
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






