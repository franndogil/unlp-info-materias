{ Descargar el programa ImperativoEjercicioClase3.pas de la clase anterior e incorporar lo
necesario para:
i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.
iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
leídos y retorne la cantidad solicitada.}
program ejercicio2;
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
		if (s.num<=a^.dato.num)then
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

procedure Soc_mas_grande(a:arbol; var nums:integer);	//PUNTO I
begin
	if(a<>nil)then begin
		if(a^.dato.num>=nums)then
			nums:=a^.dato.num;
		Soc_mas_grande(a^.HI, nums);
		Soc_mas_grande(a^.HD, nums);
	end;
end;

procedure Soc_mas_chico(a:arbol; var nums:integer; var soc:socio);	//PUNTO II
begin
	if (a<>nil)then begin
		if(a^.dato.num<=nums)then begin
			nums:=a^.dato.num;
			soc:=a^.dato;
		end;
		Soc_mas_chico(a^.HI, nums, soc);
		Soc_mas_chico(a^.HD, nums, soc);
	end;
end;

procedure Ver_o_fal(a:arbol; num:integer; var ok:boolean);
begin
	if(a<>nil)then begin
		if(a^.dato.num=num)and(ok<>true)then
			ok:=true;
		Ver_o_fal(a^.HI, num, ok);
		Ver_o_fal(a^.HD, num, ok);
	end;
end;

procedure Busqueda_eficiente(a:arbol; par1:integer; par2:integer; var cant:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.num>par1)then begin
			if(a^.dato.num<par2)then
				cant:=cant+1
			else
				Busqueda_eficiente(a^.HI, par1, par2, cant);
		end
		else
			Busqueda_eficiente(a^.HD, par1, par2, cant);
	end;
end;

var
	a:arbol;
	nummay, aux, aux2, aux3, cantimpar, cantsoc, numsocmasg, numsocmasc, par1, par2, cantbe:integer;
	nombus:string;
	ok, ok1:boolean;
	prom:real;
	socmc:socio;
begin
	randomize;
	ok:=false;
	ok1:=false;
	prom:=0;
	a:=nil;
	nummay:=0;
	aux:=0;
	aux2:=0;
	aux3:=0;
	par1:=0;
	par2:=0;
	cantbe:=0;
	cantimpar:=0;
	cantsoc:=0;
	numsocmasg:=0;
	numsocmasc:=9999;
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
	
	Soc_mas_grande(a, numsocmasg);	//PUNTO I
	writeln('El numero de socio mas grande es: ', numsocmasg);	
	
	Soc_mas_chico(a, numsocmasc, socmc);	//PUNTO II
	writeln('Socio con numero mas chico: ');	
	writeln('Numero de socio: ', socmc.num);	
	writeln('Nombre: ', socmc.nom);		
	writeln('Edad: ', socmc.edad);		
	writeln('Ingrese un valor entero: ');	
	
	read(aux3);						
	Ver_o_fal(a, aux3, ok1);				//PUNTO III
	if(ok1=true)then
		writeln('Existe un socio con ese valor')
	else
		writeln('No existe un socio con ese valor');
		
		
	writeln('Ingrese el primer parametro: ');	//PUNTO IV	(no funciona)
	readln(par1);
	writeln('Ingrese el segundo parametro: ');
	readln(par2);
	Busqueda_eficiente(a, par1, par2, cantbe);
	writeln(cantbe);
end.
