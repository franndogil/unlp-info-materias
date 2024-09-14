program DOGIL;
const
	max_codm=8;
type
	rango_codm=1..max_codm;
	
	artesania=record
		numid:integer;
		dni:integer;
		codm:rango_codm;
	end;
	
	reg_arbol=record
		dni:integer;
		cant:integer;
	end;
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:reg_arbol;
		HI:arbol;
		HD:arbol;
	end;
	
	reg_vec=record
		codm:rango_codm;
		cant:integer;
	end;
	
	vector=array[rango_codm] of reg_vec;
	
procedure Generar_artesania(var ar:artesania);
begin
	ar.dni:=random(100);
	if(ar.dni<>0)then begin
		ar.numid:=random(100)+1;
		ar.codm:=random(8)+1;
	end;
end;	

procedure Agregar_arbol(var a:arbol; ar:artesania);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.dni:=ar.dni;
		a^.dato.cant:=1;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(ar.dni=a^.dato.dni)then
			a^.dato.cant:=a^.dato.cant+1
		else begin
			if(ar.dni<a^.dato.dni)then
				Agregar_arbol(a^.HI, ar)
			else
				Agregar_arbol(a^.HD, ar);
		end;
	end;
end;

procedure Agregar_vector(var v:vector; ar:artesania);
begin
	v[ar.codm].cant:=v[ar.codm].cant+1;
end;

procedure Generacion_de_estructuras(var a:arbol; var v:vector);
var
	ar:artesania;
begin
	Generar_artesania(ar);
	while(ar.dni<>0)do begin
		Agregar_arbol(a, ar);
		Agregar_vector(v, ar);
		Generar_artesania(ar);
	end;
end;

procedure Inicializar_vector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 8 do begin
		v[i].codm:=i;
		v[i].cant:=0;
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HI);
		
		writeln('-----------------------------------');
		writeln('DNI del artesano: ', a^.dato.dni);
		writeln('Cantidad de artesanias  del artesano: ', a^.dato.cant);
		
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Imprimir_vector(v:vector);
var
	i:integer;
begin
	for i:=1 to 8 do begin
		writeln('-----------------------------------');
		writeln('Codigo del material base: ', v[i].codm);
		writeln('Cantidad de artesanias  del material base: ', v[i].cant);
	end;
end;

procedure Modulo_b(a:arbol; dni:integer; var cant:integer);
begin
	if(a<>nil)then begin
		if(a^.dato.dni<dni)then begin
			cant:=cant+1;
			Modulo_b(a^.HI, dni, cant);
			Modulo_b(a^.HD, dni, cant);
		end
		else
			Modulo_b(a^.HI, dni, cant);
	end;
end;

procedure Ordenamiento_de_vector(var v:vector; dimLog:integer);		//aplicamos IMPERATIVO-ORDENACION-SELECCION
var 
	i, j, pos: integer; 
	item: reg_vec;			//tipoElemento que usaremos
		
begin
	for i:=1 to (dimLog-1) do begin {busca el mínimo y guarda en pos la posición}
		pos := i;
        for j:=i+1 to dimLog do
			if (v[j].cant<v[pos].cant) then 		//aqui realizamos la comparacion de precios
				pos:=j;
         {intercambia v[i] y v[p]}
        item := v[pos];   
        v[pos]:=v[i];   
        v[i]:=item;
	end;
end;

procedure Actualizar_nombre(var nombre:string; i:integer);
begin
	if(i=1)then
		nombre:='Madera';
	if(i=2)then
		nombre:='Yeso';
	if(i=3)then
		nombre:='Ceramica';
	if(i=4)then
		nombre:='Vidrio';
	if(i=5)then
		nombre:='Acero';
	if(i=6)then
		nombre:='Porcelana';
	if(i=7)then
		nombre:='Lana';
	if(i=8)then
		nombre:='Carton';
end;

procedure Modulo_c(var v:vector; var nombre:string; var maycant:integer);
var
	i:integer;
begin
	Ordenamiento_de_vector(v, 8);
	
	for i:=1 to 8 do begin
		if(v[i].cant>=maycant)then begin
			maycant:=v[i].cant;
			Actualizar_nombre(nombre, v[i].codm);
		end;
	end;
end;

var
	a:arbol;
	v:vector;
	cantdni, dniing, maycant:integer;
	nombre:string;
begin
	randomize;
	a:=nil;
	Inicializar_vector(v);
	Generacion_de_estructuras(a, v);	//PUNTO A I Y II
	
	Imprimir_arbol(a);
	Imprimir_vector(v);
	
	cantdni:=0;
	dniing:=10;							//PUNTO B
	Modulo_b(a, dniing, cantdni);
	writeln('La cantidad de artesanos con DNI menor al DNI ingresado es de: ', cantdni);
	
	maycant:=0;
	Modulo_c(v, nombre, maycant);		//PUNTO C
	writeln('El nombre del material base con mayor cantidad de artesanias es: ', nombre);
end.
