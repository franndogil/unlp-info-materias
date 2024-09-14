{3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados}

program	ejercicio3;
const
	max_rubro=10;
type
	rango_rubro=1..max_rubro;
	
	producto=record
		cod:integer;
		rub:rango_rubro;
		sto:integer;
		pru:real;
	end;
	
	arbol1=^nodo_arbol1;
	
	nodo_arbol1=record
		dato:producto;
		HI:arbol1;
		HD:arbol1;
	end;
	
	rubyarb=record
		rub:rango_rubro;
		productos:arbol1;
	end;
	
	arbol2=^nodo_arbol2;
	
	nodo_arbol2=record
		dato:rubyarb;
		HI:arbol2;
		HD:arbol2;
	end;
	
procedure Cargar_producto(var p:producto);
begin
	p.cod:=random(100);
	p.rub:=random(10)+1;
	p.sto:=random(100);
	p.pru:=random(100)+1;
end;	

procedure Agregar_2(var a:arbol1; p:producto);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=p;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(p.cod<a^.dato.cod)then
			Agregar_2(a^.HI, p)
		else
			Agregar_2(a^.HD, p);
	end;
end;

procedure Agregar(var a:arbol2; p:producto);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.rub:=p.rub;
		a^.dato.productos:=nil;
		Agregar_2(a^.dato.productos, p);
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(p.rub=a^.dato.rub)then
			Agregar_2(a^.dato.productos, p)
		else begin
			if(p.rub<a^.dato.rub)then
				Agregar(a^.HI, p)
			else
				Agregar(a^.HD, p);
		end;
	end;
end;

procedure Modulo_a(var a:arbol2);
var
	p:producto;
begin
	Cargar_producto(p);
	while(p.cod<>0)do begin
		Agregar(a, p);
		Cargar_producto(p);
	end;
end;

procedure Imprimir_estructura_2(a:arbol1);
begin
	if(a<>nil)then begin
		Imprimir_estructura_2(a^.HI);
		
		writeln('------------------------');
		writeln('Codigo de producto: ', a^.dato.cod);
		writeln('Stock: ', a^.dato.sto);
		writeln('Precio unitario: ', a^.dato.pru:2:2);
		
		Imprimir_estructura_2(a^.HD);
	end;
end;

procedure Imprimir_estructura(a:arbol2);
begin
	if(a<>nil)then begin
		Imprimir_estructura(a^.HI);
		
		writeln('------------------------');
		writeln('------------------------');
		writeln('------------------------');
		writeln('Rubro: ', a^.dato.rub);
		Imprimir_estructura_2(a^.dato.productos);
		
		Imprimir_estructura(a^.HD);
	end;
end;

procedure Recorrer_arbol_interno(a:arbol1; cod:integer; var ok:boolean);
begin
	if(a<>nil)then begin
		if(cod=a^.dato.cod)then
			ok:=true
		else begin
			if(cod<a^.dato.cod)then
				Recorrer_arbol_interno(a^.HI, cod, ok)
			else
				Recorrer_arbol_interno(a^.HD, cod, ok)
		end;
	end;
end;

procedure Modulo_b(a:arbol2; rub:integer; cod:integer; var ok:boolean);
begin
	if(a<>nil)then begin
		if(a^.dato.rub=rub)then
			Recorrer_arbol_interno(a^.dato.productos, cod, ok)
		else begin
			if(rub<a^.dato.rub)then
				Modulo_b(a^.HI, rub, cod, ok)
			else
				Modulo_b(a^.HD, rub, cod, ok);
		end;
	end;
end;

var
	a:arbol2;
	rub, cod:integer;
	ok:boolean;
begin
	a:=nil;
	ok:=false;
	
	Modulo_a(a);				//PUNTO A
	Imprimir_estructura(a);
	
	rub:=8;
	cod:=12;
	Modulo_b(a, rub, cod, ok);		//PUNTO B
	if(ok=true)then
		writeln('El codigo ', cod, ' existe en el rubro ', rub)
	else
		writeln('El codigo ', cod, ' no existe en el rubro ', rub);
end.
