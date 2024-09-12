program DOGIL;
type
	envio=record
		codc:integer;
		dia:integer;
		codp:integer;
		peso:real;
	end;
	
	reg_lista=record
		codc:integer;
		dia:integer;
		peso:real;
	end;
	
	lista=^nodo_lista;
	
	nodo_lista=record
		dato:reg_lista;
		sig:lista;
	end;
	
	reg_arbol=record
		codp:integer;
		envios:lista;
	end;
	
	arbol=^nodo_arbol;
	
	nodo_arbol=record
		dato:reg_arbol;
		HI:arbol;
		HD:arbol;
	end;

procedure Generar_envio(var e:envio);
begin
	e.codc:=random(100);
	e.dia:=random(31)+1;
	e.codp:=random(100)+1;
	e.peso:=random(10)+1;
end;

procedure Agregar_adelante(var l:lista; r:reg_lista);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=r;
	nue^.sig:=l;
	l:=nue;
end;

procedure Agregar_arbol(var a:arbol; e:envio);
var
	aux:reg_lista;
begin
	if(a=nil)then begin
		new(a);
		a^.dato.codp:=e.codp;
		a^.dato.envios:=nil;
		
		aux.codc:=e.codc;
		aux.dia:=e.dia;
		aux.peso:=e.peso;
		
		Agregar_adelante(a^.dato.envios, aux);
		
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if(e.codp=a^.dato.codp)then begin
			aux.codc:=e.codc;
			aux.dia:=e.dia;
			aux.peso:=e.peso;
			Agregar_adelante(a^.dato.envios, aux)
		end
		else begin
			if(e.codp<a^.dato.codp)then
				Agregar_arbol(a^.HI, e)
			else
				Agregar_arbol(a^.HD, e);
		end;
	end;
end;

procedure Generar_arbol(var a:arbol);
var
	e:envio;
begin
	Generar_envio(e);
	while(e.codc<>0)do begin
		Agregar_arbol(a, e);
		Generar_envio(e);
	end;
end;

procedure Imprimir_lista(l:lista);
begin
	while(l<>nil)do begin
		writeln('');
		writeln('Codigo de cliente: ', l^.dato.codc);
		writeln('Dia: ', l^.dato.dia);
		writeln('Peso: ', l^.dato.peso:2:2, ' kgs');
		
		l:=l^.sig;
	end;
end;

procedure Imprimir_arbol(a:arbol);
begin
	if(a<>nil)then begin
		Imprimir_arbol(a^.HI);
		
		writeln('');
		writeln('---------------------------------');
		writeln('Codigo postal: ', a^.dato.codp);
		Imprimir_lista(a^.dato.envios);
		
		Imprimir_arbol(a^.HD);
	end;
end;

procedure Modulo_b(a:arbol; codpin:integer; var envios:lista);
begin
	if(a<>nil)then begin
		if(a^.dato.codp=codpin)then begin
			envios:=a^.dato.envios;
		end
		else begin
			if(codpin<a^.dato.codp)then
				Modulo_b(a^.HI, codpin, envios)
			else
				Modulo_b(a^.HD, codpin, envios);
		end;
	end;
end;

procedure Modulo_c(l:lista; var codc1:integer; var codc2:integer; var mayp:real; var menp:real);
begin
	if(l<>nil)then begin
		if(l^.dato.peso>=mayp)then begin
			mayp:=l^.dato.peso;
			codc1:=l^.dato.codc;
		end;
		if(l^.dato.peso<=menp)then begin
			menp:=l^.dato.peso;
			codc2:=l^.dato.codc;
		end;
		
		l:=l^.sig;
	
		Modulo_c(l, codc1, codc2, mayp, menp);
	end;
end;

var
	a:arbol;
	codpin, codmay, codmen:integer;
	mayp, menp:real;
	envios:lista;
begin
	a:=nil;
	envios:=nil;
	Generar_arbol(a);		//PUNTO A
	Imprimir_arbol(a);
	
	codpin:=97;
	Modulo_b(a, codpin, envios);						//PUNTO B
	writeln('');
	writeln('Codigo postal ingresado: ', codpin);
	writeln('Envios realizados: ');
	Imprimir_lista(envios);
	
	menp:=9999;											//PUNTO C
	mayp:=-1;
	Modulo_c(envios, codmay, codmen, mayp, menp);
	
	writeln('Codigo de cliete del envio con mayor peso: ', codmay);
	writeln('Codigo de cliete del envio con menor peso: ', codmen);
end.
