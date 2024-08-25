{4.- Una librería requiere el procesamiento de la información de sus productos. De cada 
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. 
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y 
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza 
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que 
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos 
métodos vistos en la teoría. 
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}

program ejer4;
const
	max_rubro=8;
	max_rubro3=30;
type
	rango_rub=1..max_rubro;
	rango_rub3=1..max_rubro3;
	
	producto=record
		codp:integer;
		codr:rango_rub;
		precio:real;
	end;
	
	lista=^nodo;
	
	nodo=record
		dato:producto;
		sig:lista;
	end;
	
	veclistas=array[rango_rub]of lista;
	vecrubro=array[rango_rub3]of producto;
	
	
procedure LeerProducto(var p:producto);
begin
	writeln('Ingrese el codigo de producto: ');
	readln(p.codp);
	writeln('Ingrese el codigo de rubro del producto: ');
	readln(p.codr);
	writeln('Ingrese el precio del producto: ');
	readln(p.precio);
end;

procedure InicializarVectorListas(var v:veclistas);
var
	i:integer;
begin
	for i:=1 to max_rubro do begin
		v[i]:=nil;
	end;
end;

procedure InsertarOrdenado(var l:lista; codp:integer; p:producto);
var
	nue, act, ant:lista;
begin
	new(nue);
	nue^.dato:=p;
	act:=l;
	ant:=l;
	
	while(act<>nil)and(codp>act^.dato.codp)do begin
		ant:=act;
		act:=act^.sig;
	end;
	
	if(act=ant)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure CargarProductos(var vl:veclistas);
var
	p:producto;
begin
	InicializarVectorListas(vl);
	LeerProducto(p);
	while(p.precio<>0)do begin
		InsertarOrdenado(vl[p.codr], p.codp, p);	//pongo v[p.codr] porque el procedimiento recibe "listas" y v es un vector de listas
		LeerProducto(p);
	end;
end;

procedure ImprimirVecListasPorRubros(vl: veclistas);		//punto b
var
	i:integer;
begin
	i:=0;
	for i:=1 to max_rubro do begin
		writeln('Rubro numero:', i);
		while (vl[i]<>nil)do begin
			writeln('Cod. del producto: ',vl[i]^.dato.codp);
			vl[i]:=vl[i]^.sig;
		end;
	end;
end;

procedure GenerarVector(vl:veclistas; var vr3:vecrubro; var dimLog:integer);
var
	i:integer;
begin
	i:=0;
	while((vl[3]<>nil)and(i<30))do begin
		i:=i+1;
		vr3[i]:=vl[3]^.dato;
		vl[3]:=vl[3]^.sig;	//enlace al siguiente
	end;
	dimLog:=i;
end;

procedure ImprimirVector(vr3:vecrubro; dimLog:integer);		//para probar
var
	i:integer;
begin
	i:=0;
	for i:=1 to dimLog do begin
		writeln('Cod. producto: ', vr3[i].codp);
		writeln('Cod. rubro: ',vr3[i].codr);
		writeln('Precio: ',vr3[i].precio:2:2);
	end;
end;

procedure OrdenamientoDeVector(var vr3:vecrubro; dimLog:integer);		//aplicamos IMPERATIVO-ORDENACION
var 
	i, j, pos: integer; 
	item: producto;			//tipoElemento que usaremos
		
begin
	for i:=1 to (dimLog-1) do begin {busca el mínimo y guarda en pos la posición}
		pos := i;
        for j:=i+1 to dimLog do
			if (vr3[j].precio<vr3[pos].precio) then 		//aqui realizamos la comparacion de precios
				pos:=j;
         {intercambia v[i] y v[p]}
        item := vr3[pos];   
        vr3[pos]:=vr3[i];   
        vr3[i]:=item;
	end;
end;

procedure ImprimirPreciosVector(vr3:vecrubro; dimLog:integer);		//para probar
var
	i:integer;
begin
	i:=0;
	for i:=1 to dimLog do begin
		writeln('Precio: ',vr3[i].precio:2:2);
	end;
end;

procedure CalculoDePromedio(vr3:vecrubro; dimLog:integer; var p:real);
var
	i:integer;
	aux:real;
begin
	aux:=0;
	for i:=1 to dimLog do begin
		aux:=aux+vr3[i].precio;
	end;
	p:=aux/dimLog;
end;

var
	vl:veclistas;
	vr3:vecrubro;
	dimL:integer;
	promedio:real;
begin
	dimL:=0;
	promedio:=0;
	CargarProductos(vl);
	ImprimirVecListasPorRubros(vl);
	writeln('GENERACION DEL VECTOR EN PROCESO...');
	GenerarVector(vl, vr3, dimL);
	ImprimirVector(vr3, dimL);	//para probar
	writeln('ORDENAMIENTO EN PROCESO...');
	OrdenamientoDeVector(vr3, dimL);
	writeln('PRECIOS DEL VECTOR RESULTANTE: ');
	ImprimirPreciosVector(vr3, dimL);
	CalculoDePromedio(vr3, dimL, promedio);
	writeln('Precio promedio de los precios del vector resultante: ', promedio:2:2);
end.
