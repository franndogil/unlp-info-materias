{2. Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

program ejercicio2;
const
	max_afab=2018;
	min_afab=2010;
type
	rangoafab=min_afab..max_afab;
	
	auto=record
		patente:integer;
		afab:rangoafab;
		marca:string;
		modelo:string;
	end;
	
	arbolpat=^nodo_arbolpat;
	
	nodo_arbolpat=record
		dato:auto;
		HI:arbolpat;
		HD:arbolpat;
	end;
	
	lista=^nodo_lista;
	
	nodo_lista=record
		dato:auto;
		sig:lista;
	end;
	
	marymod=record
		marca:string;
		modelos:lista;
	end;
	
	anyau=record
		afab:rangoafab;
		modelos:lista;
	end;
	
	arbolmar=^nodo_arbolmar;
	
	nodo_arbolmar=record
		dato:marymod;
		HI:arbolmar;
		HD:arbolmar;
	end;
	
	arbolfab=^nodo_arbolfab;
	
	nodo_arbolfab=record
		dato:anyau;
		HI:arbolfab;
		HD:arbolfab;
	end;

procedure Generar_auto(var au:auto);
begin
	writeln('Ingrese la patente (de enteros): ');
	readln(au.patente);
	writeln('Ingrese el año de fabricacion (2010-2018): ');
	readln(au.afab);
	writeln('Ingrese la marca: ');
	readln(au.marca);
	writeln('Ingrese el modelo: ');
	readln(au.modelo);
end;

procedure Generar_arbol_pat(var a1:arbolpat; au:auto);
begin
	if(a1=nil)then begin
		new(a1);
		a1^.dato:=au;
		a1^.HI:=nil;
		a1^.HD:=nil;
	end
	else begin
		if(au.patente<a1^.dato.patente)then
			Generar_arbol_pat(a1^.HI, au)
		else
			Generar_arbol_pat(a1^.HD, au);
	end;
end;

procedure Agregar_adelante(var l:lista; au:auto);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=au;
	nue^.sig:=l;
	l:=nue;
end;

procedure Generar_arbol_mar(var a2:arbolmar; au:auto);
begin
	if(a2=nil)then begin
		new(a2);
		a2^.dato.marca:=au.marca;
		a2^.dato.modelos:=nil;
		Agregar_adelante(a2^.dato.modelos, au);
		a2^.HI:=nil;
		a2^.HD:=nil;
	end
	else begin
		if(au.marca=a2^.dato.marca)then
			Agregar_adelante(a2^.dato.modelos, au)
		else begin
			if(au.marca<a2^.dato.marca)then
				Generar_arbol_mar(a2^.HI, au)
			else
				Generar_arbol_mar(a2^.HD, au);
		end;
	end;
end;


procedure Generar_estructuras(var a1:arbolpat; var a2:arbolmar);
var
	au:auto;
begin
	Generar_auto(au);
	while(au.marca<>'MMM')do begin
		Generar_arbol_pat(a1, au);
		Generar_arbol_mar(a2, au);
		Generar_auto(au);
	end;
end;

procedure Imprimir_estructura_pat(var a1:arbolpat);
begin
	if(a1<>nil)then begin
		Imprimir_estructura_pat(a1^.HI);
		
		writeln('----------------------------');
		writeln('Patente: ',a1^.dato.patente);	
		writeln('Año de fabricacion: ',a1^.dato.afab);	
		writeln('Marca: ',a1^.dato.marca);	
		writeln('Modelo: ',a1^.dato.modelo);	
			
		Imprimir_estructura_pat(a1^.HD);
	end;
end;

procedure Imprimir_lista(l:lista);
begin
	while(l<>nil)do begin
		writeln('-----------------------------');
		writeln('Modelo: ', l^.dato.modelo);
		writeln('Año de fabricacion: ', l^.dato.afab);
		writeln('Patente: ', l^.dato.patente);
		l:=l^.sig;
	end;
end;

procedure Imprimir_estructura_mar(a2:arbolmar);
begin
	if(a2<>nil)then begin
		writeln('-----------------------------');
		writeln('Marca: ', a2^.dato.marca);
		Imprimir_lista(a2^.dato.modelos);
			
		Imprimir_estructura_mar(a2^.HI);
		Imprimir_estructura_mar(a2^.HD);
	end;
end;

procedure Modulo_b(a1:arbolpat; mar:string; var cant:integer);
begin
	if(a1<>nil)then begin
		if(a1^.dato.marca=mar)then
			cant:=cant+1;
		Modulo_b(a1^.HI, mar, cant);
		Modulo_b(a1^.HD, mar, cant);
	end;
end;	

procedure Sumar(l:lista; var cant:integer);
begin
	while(l<>nil)do begin
		cant:=cant+1;
		l:=l^.sig;
	end;
end;

procedure Modulo_c(a2:arbolmar; mar:string; var cant:integer);
begin
	if(a2^.dato.marca=mar)then
		Sumar(a2^.dato.modelos, cant)
	else begin
		Modulo_c(a2^.HI, mar, cant);
		Modulo_c(a2^.HD, mar, cant);
	end;
end;

procedure Generar_arbol_afab(var a3:arbolfab; au:auto);
begin
	if(a3=nil)then begin
		new(a3);
		a3^.dato.afab:=au.afab;
		a3^.dato.modelos:=nil;
		Agregar_adelante(a3^.dato.modelos, au);
		a3^.HI:=nil;
		a3^.HD:=nil;
	end
	else begin
		if(au.afab=a3^.dato.afab)then 
			Agregar_adelante(a3^.dato.modelos, au)
		else begin
			if(au.afab<a3^.dato.afab)then
				Generar_arbol_afab(a3^.HI, au)
			else
				Generar_arbol_afab(a3^.HD, au);
		end;
	end;
end;

procedure Modulo_d(a1:arbolpat; var a3:arbolfab);
begin
	if(a1<>nil)then begin
		Generar_arbol_afab(a3, a1^.dato);
		Modulo_d(a1^.HI, a3);
		Modulo_d(a1^.HD, a3);
	end;
end;

procedure Imprimir_lista_2(l:lista);
begin
	while(l<>nil)do begin
		writeln('-----------------------------');
		writeln('Marca: ', l^.dato.marca);
		writeln('Modelo: ', l^.dato.modelo);
		writeln('Patente: ', l^.dato.patente);
		l:=l^.sig;
	end;
end;

procedure Imprimir_estructura_afab(a3:arbolfab);
begin
	if(a3<>nil)then begin
		writeln('-----------------------------');
		writeln('Año de fabricacion: ', a3^.dato.afab);
		Imprimir_lista_2(a3^.dato.modelos);
			
		Imprimir_estructura_afab(a3^.HI);
		Imprimir_estructura_afab(a3^.HD);
	end;
end;

procedure Modulo_e(a1:arbolpat; pat:integer; var modelo:string);
begin
	if(a1<>nil)then begin
		if(a1^.dato.patente=pat)then 
			modelo:=a1^.dato.modelo;
		Modulo_e(a1^.HI, pat, modelo);
		Modulo_e(a1^.HD, pat, modelo);
	end;
end;

procedure Recorrer_lista(l:lista; pat:integer; var modelo:string);
begin
	while(l<>nil)do begin
		if(l^.dato.patente=pat)then
			modelo:=l^.dato.modelo;
		l:=l^.sig;
	end;
end;

procedure Modulo_f(a2:arbolmar; pat:integer; var modelo:string);
begin
	if(a2<>nil)then begin
		
		Recorrer_lista(a2^.dato.modelos, pat, modelo);
	
		Modulo_f(a2^.HI, pat, modelo);
		Modulo_f(a2^.HD, pat, modelo);
	end;
end;

var
	a1:arbolpat;
	a2:arbolmar;
	a3:arbolfab;
	cant, cant2, pat:integer;
	mar, modelo, modelo1:string;
begin
	a1:=nil;
	a2:=nil;
	a3:=nil;
	cant:=0;
	cant2:=0;
	
	Generar_estructuras(a1, a2);	//PUNTO A
	
	writeln('------------IMPRESION DE ESTRUCTURA POR PATENTE------------');	//CHEQUEO PUNTO A I
	Imprimir_estructura_pat(a1);
	writeln('------------IMPRESION DE ESTRUCTURA POR MARCA------------');	//CHEQUEO PUNTO A II
	Imprimir_estructura_mar(a2);
	
	writeln('---------MODULO B---------');
	mar:='Ford';
	Modulo_b(a1, mar, cant);																	//PUNTO B
	writeln('La cantidad de autos de la marca: ', mar,' que posee la agencia es de: ', cant);
	
	writeln('---------MODULO C---------');
	Modulo_c(a2, mar, cant2);																	//PUNTO C
	writeln('La cantidad de autos de la marca: ', mar,' que posee la agencia es de: ', cant2);
	
	Modulo_d(a1, a3);													//PUNTO D
	writeln('------------IMPRESION DE ESTRUCTURA POR AÑO------------');	//CHEQUEO PUNTO D
	Imprimir_estructura_afab(a3);
	
	pat:=10;
	Modulo_e(a1, pat, modelo);
	writeln('El modelo del auto con la patente ', pat, ' es:', modelo);	//PUNTO E
	
	Modulo_f(a2, pat, modelo1);
	writeln('El modelo del auto con la patente ', pat, ' es:', modelo1);	//PUNTO E
end.
