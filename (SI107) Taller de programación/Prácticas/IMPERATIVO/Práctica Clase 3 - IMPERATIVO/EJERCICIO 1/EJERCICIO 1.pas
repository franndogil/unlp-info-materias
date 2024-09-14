{1. Descargar el programa ImperativoEjercicioClase3.pas que contiene parte del código del
siguiente enunciado a resolver. Implementar lo indicado en el código.
Escribir un programa que:
a. Implemente un módulo que almacene información de socios de un club en un árbol binario
de búsqueda. De cada socio se debe almacenar número de socio, nombre y edad. La carga
finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio. La
información de cada socio debe generarse aleatoriamente.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
1. Informar los datos de los socios en orden creciente.
2. Informar los datos de los socios en orden decreciente.
3. Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
4. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios
que se les aumentó la edad.
5. Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar
a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
6. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
7. Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que
retorne el promedio de las edades de los socios.
}

program ejercicio1;
type
	socio=record
		num:integer;
		nom:string;
		edad:integer;
	end;
	
	arbol=^nodoArbol;
	
	nodoArbol=record
		dato:socio;
		HI:arbol;
		HD:arbol;
	end;
	
procedure Cargar_socio(var s:socio);
var
	vNombres:array[0..9] of string=('Franco', 'Sabrina', 'Ivan', 'Mica', 'Leo', 'Guido','Pelusa', 'Mabel', 'Cami', 'Lili');
begin
	s.num:=random(50);
	if(s.num<>0)then begin
		s.nom:=vNombres[random(10)];
		s.edad:=random(30)+20;
	end;
end;

procedure Insertar_elemento(var a:arbol; s:socio);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=s;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if (s.num<a^.dato.num)then
			Insertar_elemento(a^.HI, s)
		else
			Insertar_elemento(a^.HD, s);
	end;
end;

procedure Generar_arbol(var a:arbol);
var
	s:socio;
begin
	Cargar_socio(s);
	while(s.num<>0)do begin
		Insertar_elemento(a, s);
		Cargar_socio(s);
	end;
end;

procedure Imprimir_arbol(a:arbol);					//PUNTO A
begin
	if (a<>nil) then begin
		writeln('Codigo de socio: ', a^.dato.num);
		writeln('Nombre: ', a^.dato.nom);
		writeln('Edad: ', a^.dato.edad);
		Imprimir_arbol(a^.HD);
		Imprimir_arbol(a^.HI);
	end;
end;

procedure Imprimir_arbol_creciente(a:arbol);		//PUNTO B.1
begin
	if(a<>nil)then begin
		Imprimir_arbol_creciente(a^.HI);
		writeln('Codigo de socio: ', a^.dato.num);
		writeln('Nombre: ', a^.dato.nom);
		writeln('Edad: ', a^.dato.edad);
		Imprimir_arbol_creciente(a^.HD);
	end;
end;

procedure Imprimir_arbol_decreciente(a:arbol);		//PUNTO B.2
begin
	if(a<>nil)then begin
		Imprimir_arbol_decreciente(a^.HD);
		writeln('Codigo de socio: ', a^.dato.num);
		writeln('Nombre: ', a^.dato.nom);
		writeln('Edad: ', a^.dato.edad);
		Imprimir_arbol_decreciente(a^.HI);
	end;
end;

procedure Mayor_edad(a:arbol; var nummay:integer; var edad:integer);	//PUNTO B.3
begin
	if(a<>nil)then begin
		if(a^.dato.edad>edad)then begin
			edad:=a^.dato.edad;
			nummay:=a^.dato.num;
		end;
		Mayor_edad(a^.HI, nummay, edad);
		Mayor_edad(a^.HD, nummay, edad);
	end;
end;

procedure Edad_impar(a:arbol; var cantimpar:integer);		//PUNTO B.4
begin
	if(a<>nil)then begin
		if(a^.dato.edad  mod 2=1)then begin
			cantimpar:=cantimpar+1;
			a^.dato.edad:=a^.dato.edad+1;
		end;
		Edad_impar(a^.HI, cantimpar);
		Edad_impar(a^.HD, cantimpar);
	end;
end;

procedure Busqueda(a:arbol; nombus:string; var ok:boolean);		//PUNTO B.5
begin
	if(a<>nil)and(ok=false)then begin
		if(a^.dato.nom=nombus)then
			ok:=true;
		Busqueda(a^.HI, nombus, ok);
		Busqueda(a^.HD, nombus, ok);
	end;
end;

procedure Cant_socios(a:arbol; var cantsoc:integer);		//PUNTO B.6
begin
	if(a<>nil)then begin
		cantsoc:=cantsoc+1;
		Cant_socios(a^.HI, cantsoc);
		Cant_socios(a^.HD, cantsoc);
	end;
end;

procedure Prom_edades(a:arbol; var prom:real; var suma:integer; cantsoc:integer);	//PUNTO B.7
begin
	if(a<>nil)then begin
		suma:=suma+a^.dato.edad;
		prom:=suma/cantsoc;
		Prom_edades(a^.HI, prom, suma,cantsoc);
		Prom_edades(a^.HD, prom, suma,cantsoc);
	end;
	
end;

var
	a:arbol;
	nummay, aux, aux2, cantimpar, cantsoc:integer;
	nombus:string;
	ok:boolean;
	prom:real;
begin
	ok:=false;
	prom:=0;
	a:=nil;
	nummay:=0;
	aux:=0;
	aux2:=0;
	cantimpar:=0;
	cantsoc:=0;
	Generar_arbol(a);										//PUNTO A
	writeln('Impresion del Arbol en cualquier orden: ');	//PUNTO B.0
	Imprimir_arbol(a);
	writeln('Impresion de Arbol en orden creciente: ');		//PUNTO B.1
	Imprimir_arbol_creciente(a);
	writeln('Impresion de Arbol en orden decreciente: ');	//PUNTO B.2
	Imprimir_arbol_decreciente(a);
	Mayor_edad(a, nummay, aux);								//PUNTO B.3
	writeln('Numero de socio con mayor edad: ', nummay);	
	Edad_impar(a, cantimpar);								//PUNTO B.4
	writeln('Cantidad de socios que se les aumento la edad: ', cantimpar);
	writeln('Ingrese el nombre a buscar: ');				//PUNTO B.5
	read(nombus);
	Busqueda(a, nombus, ok);
	if(ok=true)then
		writeln('El nombre si existe en la estructura')
	else
		writeln('El nombre no existe en la estructura');
	Cant_socios(a, cantsoc);								//PUNTO B.6
	writeln('Cantidad de socios: ', cantsoc);
	Prom_edades(a, prom, aux2, cantsoc);					//PUNTO B.7				
	writeln('El promedio de edades es de: ', prom:2:2, ' años.');
end.
