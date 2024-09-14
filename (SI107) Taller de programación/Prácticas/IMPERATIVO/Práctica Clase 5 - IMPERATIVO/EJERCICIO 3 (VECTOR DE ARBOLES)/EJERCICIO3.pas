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

program ejercicio3;
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
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:producto;
		HI:arbol;
		HD:arbol;
	end;
	
	vec=array[rango_rubro] of arbol;
	
	codysto=record
		cod:integer;
		sto:integer;
	end;
	
	vcys=array[rango_rubro] of codysto;

procedure Generar_producto(var p:producto);
begin
	p.cod:=random(100);
	p.rub:=random(10)+1;
	p.sto:=random(100);
	p.pru:=random(100)+1;
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
		if(p.cod<a^.dato.cod)then
			Agregar(a^.HI, p)
		else
			Agregar(a^.HD, p);
	end;
end;

procedure Cargar_vector(var v:vec);
var
	p:producto;
begin
	Generar_producto(p);
	while(p.cod<>0)do begin
		Agregar(v[p.rub], p);
		Generar_producto(p);
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HI);
	
		writeln('-----------------------------');
		writeln('Codigo: ', a^.dato.cod);
		writeln('Stock: ', a^.dato.sto);
		writeln('Precio unitario: ', a^.dato.pru:2:2);
		
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Imprimir_vector(v:vec);
var
	i:integer;
begin
	for i:=1 to max_rubro do begin
		writeln('-----------------------------');
		writeln('-----------------------------');
		writeln('-----------------------------');
		writeln('RUBRO: ', i);
		Imprimir_arbol(v[i]);
	end;
end;

procedure Inicializar_vector(var v:vec);
var
	i:integer;
begin
	for i:=1 to max_rubro do
		v[i]:=nil;
end;

procedure Recorrer_arbol(a:arbol; cod:integer; var ok:boolean);
begin
	if(a<>nil)then begin
		if(a^.dato.cod=cod)then
			ok:=true
		else begin
			if(cod<a^.dato.cod)then
				Recorrer_arbol(a^.HI, cod, ok)
			else
				Recorrer_arbol(a^.HD, cod, ok);
		end;
	end;
end;

procedure Modulo_b(v:vec; rub:integer; cod:integer; var ok:boolean);
begin
	Recorrer_arbol(v[rub], cod, ok);
end;

procedure Recorrer_arbol_2(a:arbol; var v2:vcys);
begin
	if(a<>nil)then begin
		if(a^.dato.cod>v)
	end;
end;

procedure Modulo_c(v:vec; var v2:vcys);
var
	i:integer;
begin
	for i:=1 to max_rubro do begin
		Recorrer_arbol_2(v[i], v2);
	end;
end;

var
	v:vec;
	v2:vcys;
	rub, cod:integer;
	ok:boolean;
begin
	Inicializar_vector(v);
	Cargar_vector(v);			//PUNTO A
	Imprimir_vector(v);
	
	rub:=8;
	cod:=13;					//PUNTO B
	Modulo_b(v, rub, cod, ok);
	if(ok=true)then
		writeln('El codigo ', cod,' esta en el rubro ',rub)
	else
		writeln('El codigo ', cod,' no esta en el rubro ',rub);
	
	Modulo_c(v, v2);
end.
		
		
		
