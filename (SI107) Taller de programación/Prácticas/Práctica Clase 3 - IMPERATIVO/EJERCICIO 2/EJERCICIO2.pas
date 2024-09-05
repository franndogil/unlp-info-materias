{2. Escribir un programa que:
A. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. 
Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
B. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
C. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
D. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas}

program ejer2;
const
	max_dia=31;
	max_mes=12;
	min_ano=2000;
	max_ano=2024;
type
	rango_dia=1..max_dia;
	rango_mes=1..max_mes;
	rango_ano=min_ano..max_ano;
	
	fecha=record
		dia:rango_dia;
		mes:rango_mes;
		ano:rango_ano;
	end;
	
	venta=record
		codp:integer;
		fe:fecha;
		cantv:integer;
	end;
	
	arbol=^nodo;
	
	nodo=record
		dato:venta;
		HD:arbol;
		HI:arbol;
	end;
	
	producto=record
		codp:integer;
		cantv:integer;
	end;
	
	arbol2=^nodo2;
	
	nodo2=record
		dato:producto;
		HD:arbol2;
		HI:arbol2;
	end;
	
	lista=^nodol;
	
	regislista=record
		fe:fecha;
		cantv:integer;
	end;
	
	nodol=record
		dato:regislista;
		sig:lista;
	end;
	
	regisarbol=record
		codp:integer;
		info:lista;
	end;
	
	arbol3=^nodo3;
	
	nodo3=record
		dato:regisarbol;
		HD:arbol3;
		HI:arbol3;
	end;
	
procedure Generar_fecha(var fe:fecha);
begin
	fe.dia:=random(max_dia)+1;
	fe.mes:=random(max_mes)+1;
	fe.ano:=random(max_ano-min_ano+1)+min_ano;
end;

procedure Generacion_de_venta(var v:venta);
begin
	v.codp:=random(10);
	Generar_fecha(v.fe);
	v.cantv:=random(10)+1;	
end;

procedure Generacion_de_arbol_1(var a1:arbol; v:venta);		//PUNTO A.I
begin
	if (a1 = nil) then begin
		new(a1);
		a1^.dato:= v; 
		a1^.HI:= nil; 
		a1^.HD:= nil;
   end
   else
		if (v.codp <= a1^.dato.codp) then
			Generacion_de_arbol_1(a1^.HI, v)
		else 
			Generacion_de_arbol_1(a1^.HD, v);   
end;

procedure Generacion_de_arbol_2(var a2:arbol2; v:venta);		//PUNTO A.II
begin
	if (a2 = nil) then begin
		new(a2);
		a2^.HI:= nil;
		a2^.HD:= nil;
		a2^.dato.codp:=v.codp;
		a2^.dato.cantv:=v.cantv;
   end
   else begin
		if(v.codp=a2^.dato.codp)then
			a2^.dato.cantv:=a2^.dato.cantv+v.cantv
		else begin
			if (v.codp < a2^.dato.codp) then
				Generacion_de_arbol_2(a2^.HI, v)
			else 
				Generacion_de_arbol_2(a2^.HD, v);
		end;
	end;
end;

procedure AgregarAdelante(var l:lista; v:venta);
var
	aux:lista;
begin
	new(aux);
	aux^.dato.fe:=v.fe;
	aux^.dato.cantv:=v.cantv;
	aux^.sig:=l;
	l:=aux;
end;

procedure Generacion_de_arbol_3(var a3:arbol3; v:venta);		//PUNTO A.III
begin
	if (a3 = nil) then begin
		new(a3);
		a3^.HI:= nil;
		a3^.HD:= nil;
		a3^.dato.info:=nil;
		a3^.dato.codp:=v.codp;
		AgregarAdelante(a3^.dato.info, v);
   end
   else begin
		if(v.codp=a3^.dato.codp)then
			AgregarAdelante(a3^.dato.info, v)
		else begin
			if (v.codp < a3^.dato.codp) then
				Generacion_de_arbol_3(a3^.HI, v)
			else 
				Generacion_de_arbol_3(a3^.HD, v);
		end;
	end;
end;

procedure Generacion_de_arboles(var a1:arbol; var a2:arbol2; var a3:arbol3);		//PUNTO A
var
	v:venta;
begin
	Generacion_de_venta(v);
	while(v.codp<>0)do begin
		Generacion_de_arbol_1(a1, v);
		Generacion_de_arbol_2(a2, v);
		Generacion_de_arbol_3(a3, v);
		Generacion_de_venta(v);
	end;
	
end;

procedure Imprimir_arbol_ventas(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol_ventas(a^.HD);
		writeln('Dia: ', a^.dato.fe.dia);
		writeln('Codigo de producto: ',a^.dato.codp);
		writeln('Cantidad vendida: ',a^.dato.cantv);
		Imprimir_arbol_ventas(a^.HI);
	end;
end;

procedure Cant_vendidos_fecha(a:arbol; dia:integer; var cant:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.fe.dia=dia)then
			cant:=cant+ a^.dato.cantv;
		Cant_vendidos_fecha(a^.HI, dia, cant);
		Cant_vendidos_fecha(a^.HD, dia, cant);
	end;
end;

procedure Cod_may_uni_ven(a2:arbol2; var cod:integer; cantmax:integer);
begin
	if(a2<>nil)then begin
		if(a2^.dato.cantv>cantmax)then begin
			cod:=a2^.dato.codp;
			cantmax:=a2^.dato.cantv;
		end;
		Cod_may_uni_ven(a2^.HI, cod, cantmax);
		Cod_may_uni_ven(a2^.HD, cod, cantmax);
	end;
end;

procedure Imprimir_arbol_productos(a:arbol2);
begin
	if(a<>nil)then begin
		writeln('Codp: ', a^.dato.codp);
		writeln('Cant ventas: ', a^.dato.cantv);
		Imprimir_arbol_productos(a^.HI);
		Imprimir_arbol_productos(a^.HD);
	end;
end;

procedure recorrer_lista(var l:lista; var cant:integer);
begin
	cant:=0;
	while(l<>nil)do begin
		cant:=cant+1;
		l:=l^.sig;
	end;
end;

procedure Cod_may_ventas(a:arbol3; var cod:integer; var cant:integer);
var
	cantact:integer;
begin
	if(a<>nil)then begin
		if(a^.dato.info<>nil)then begin
			recorrer_lista(a^.dato.info, cantact);
			if(cantact>cant)then begin
				cant:=cantact;
				cod:=a^.dato.codp;
			end;
		end;
		Cod_may_ventas(a^.HI, cod, cant);
		Cod_may_ventas(a^.HD, cod, cant);
	end;
end;

procedure Imprimir_lista(l:lista);
begin
	while(l<>nil)do begin
		writeln('Dia:', l^.dato.fe.dia);
		writeln('Cantidad: ', l^.dato.cantv);
		l:=l^.sig;
	end;
end;

procedure Imprimir_arbol(a:arbol3);
begin
	if(a<>nil)then begin
		if(a^.dato.info<>nil)then begin
			writeln('CODP: ',a^.dato.codp);
			Imprimir_lista(a^.dato.info);
			writeln('');	//para emprolijar
		end;
		Imprimir_arbol(a^.HD);
		Imprimir_arbol(a^.HI);
	end;
end;

procedure Inicializar_fecha(var fe:fecha);
begin
	fe.dia:=10;
	fe.mes:=11;
	fe.ano:=2024;
end;

var
	a1:arbol;
	a2:arbol2;
	a3:arbol3;
	fe:fecha;
	cant, cant1, cant2, codmayu, codmayv:integer;
begin
	randomize;
	a1:=nil;
	a2:=nil;
	a3:=nil;
	cant:=0;
	cant1:=0;
	codmayu:=0;
	cant2:=0;
	codmayv:=0;
	Inicializar_fecha(fe);
	Generacion_de_arboles(a1, a2, a3);		//PUNTO A
	Imprimir_arbol_ventas(a1);
	Cant_vendidos_fecha(a1, fe.dia, cant);		//PUNTO B
	writeln('Cantidad: ', cant);
	writeln('ARBOL 2 IMPRESO:');
	Imprimir_arbol_productos(a2);
	Cod_may_uni_ven(a2, codmayu, cant1);
	writeln('El codigo con mayor cantidad de unidades vendidas es: ', codmayu);		//PUNTO C
	writeln('ARBOL3 IMPRESO:');
	Imprimir_arbol(a3);
	Cod_may_ventas(a3, codmayv, cant2);
	writeln('El codigo con mayor cantidad de ventas es: ', codmayv);	//PUNTO D
end.

