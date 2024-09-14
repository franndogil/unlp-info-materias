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
	rangorubro=1..max_rubro;
	
	producto=record
		cod:integer;
		rubro:rangorubro;
		stock:integer;
		preu:real;
	end;
	
	lista=^nodo_lista;
	
	nodo_lista=record
		dato:producto;
		sig:lista;
	end;
	
	rubros=record
		rubro:integer;
		productos:lista;
	end;
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:rubros;
		HI:arbol;
		HD:arbol;
	end;
	
	regisvec=record
		cod:integer;
		stock:integer;
	end;
	
	vecrubro=array[rangorubro] of regisvec;
	vcant=array[rangorubro] of integer;

procedure Cargar_producto(var p:producto);
begin
	p.cod:=random(100);
	p.rubro:=random(10)+1;
	p.stock:=random(100);
	p.preu:=random(100)+1;
end;

procedure Insertar_ordenado(var l:lista; cod:integer; p:producto);
var
	nue, ant, act:lista;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=nil;
	
	ant:=l;
	act:=l;
	
	while(act<>nil)and(cod<act^.dato.cod)do begin
		ant:=act;
		act:=act^.sig;
	end;
	
	if(act=l)then begin
		nue^.sig:=l;
		l:=nue;
	end
	else begin
		ant^.sig:=nue;
		nue^.sig:=act;
	end;
end;

procedure Agregar(var a:arbol; p:producto);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.rubro:=p.rubro;
		a^.dato.productos:=nil;
		Insertar_ordenado(a^.dato.productos, p.cod, p);
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(p.rubro=a^.dato.rubro)then
			Insertar_ordenado(a^.dato.productos, p.cod, p)
		else begin
			if(p.rubro<a^.dato.rubro)then
				Agregar(a^.HI, p)
			else
				Agregar(a^.HD, p);
		end;
	end;
end;

procedure Modulo_a(var a:arbol);
var
	p:producto;
begin
	Cargar_producto(p);
	while(p.cod<>0)do begin
		Agregar(a, p);
		Cargar_producto(p);
	end;
end;

procedure Imprimir_lista(l:lista);
begin
	while(l<>nil)do begin
		writeln('-----------------------------');
		writeln('Codigo:', l^.dato.cod);
		writeln('Stock: ', l^.dato.stock);
		writeln('Precio unitario: ', l^.dato.preu:2:2);
		l:=l^.sig;
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HI);
		
		writeln('-----------------------------');
		writeln('-----------------------------');
		writeln('-----------------------------');
		writeln('Rubro: ', a^.dato.rubro);
		Imprimir_lista(a^.dato.productos);
		
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Recorrer_lista(l:lista; cod:integer; var ok:boolean);
begin
	while(l<>nil)do begin
		if(l^.dato.cod=cod)then
			ok:=true;
		l:=l^.sig;
	end;
end;

procedure Modulo_b(a:arbol; rubro:integer; cod:integer; var ok:boolean);
begin
	if(a<>nil)then begin
		if(a^.dato.rubro=rubro)then
			Recorrer_lista(a^.dato.productos, cod, ok)
		else
			Modulo_b(a^.HI, rubro, cod, ok);
			Modulo_b(a^.HD, rubro, cod, ok);
	end;
end;

procedure Cargar_vector(var v:vecrubro; i:integer; l:lista);
var
	maxcod, mstock:integer;
begin
	maxcod:=0;
	while(l<>nil)do begin
		if(l^.dato.cod>=maxcod)then begin
			maxcod:=l^.dato.cod;
			mstock:=l^.dato.stock;
		end;
		l:=l^.sig;
	end;
	v[i].cod:=maxcod;
	v[i].stock:=mstock;
end;

procedure Modulo_c(a:arbol; var v:vecrubro);
begin
	if(a<>nil)then begin
		Cargar_vector(v, a^.dato.rubro, a^.dato.productos);
		
		Modulo_c(a^.HI, v);
		Modulo_c(a^.HD, v);
	end;
end;

procedure Inicializar_vector(var v:vcant);
var
	i:integer;
begin
	for i:=1 to 10 do 
		v[i]:=0;
end;

procedure Chequeo(i:integer; l:lista; min:integer; max:integer; var v:vcant);
var
	cant:integer;
begin
	cant:=0;
	while(l<>nil)do begin
		if(l^.dato.cod<max)and(l^.dato.cod>min)then
			cant:=cant+1;
		l:=l^.sig;
	end;
	v[i]:=cant;
end;

procedure Modulo_d(a:arbol; min:integer; max:integer; var v:vcant);
begin
	if(a<>nil)then begin
		
		Chequeo(a^.dato.rubro, a^.dato.productos, min, max, v);
		
		Modulo_d(a^.HI, min, max, v);
		Modulo_d(a^.HD, min, max, v);
	end;
end;

var
	a:arbol;
	vr:vecrubro;
	vc:vcant;
	ok:boolean;
	rubro, cod, i, min, max:integer;
begin
	randomize;
	a:=nil;
	ok:=false;
	
	Modulo_a(a);		//PUNTO A
	Imprimir_arbol(a);
	
	
	rubro:=8;
	cod:=13;															//PUNTO B
	Modulo_b(a, rubro, cod, ok);
	if(ok=true)then
		writeln('El codigo ', cod, ' existe para el rubro ', rubro)
	else
		writeln('El codigo ', cod, ' no existe para el rubro ', rubro);
	
	Modulo_c(a, vr);		//PUNTO C
	
	for i:=1 to 10 do begin						//DEMOSTRACION PUNTO C
		writeln('-------------------------');
		writeln('Rubro: ', i);
		writeln('Codigo: ', vr[i].cod);
		writeln('Stock: ', vr[i].stock);
	end;
	
	
	min:=2;
	max:=7;
	Inicializar_vector(vc);
	Modulo_d(a, min, max, vc);		//PUNTO D
	
	for i:=1 to 10 do begin						//DEMOSTRACION PUNTO 
		writeln('-------------------------');
		writeln('Rubro: ', i);
		writeln('Cantidad de productos con codigos entre los dos valores ingresados: ', vc[i]);

	end;
end.
		
		
