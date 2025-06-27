{7. Se cuenta con un archivo que almacena información sobre especies de aves en vía 
de extinción, para ello se almacena: código, nombre de la especie, familia de ave, 
descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice 
un programa que permita borrar especies de aves extintas. Este programa debe 
disponer de dos procedimientos:  
a. Un procedimiento que dada una especie de ave (su código) marque la misma 
como borrada (en caso de querer borrar múltiples especies de aves, se podría 
invocar este procedimiento repetidamente). 
b. Un procedimiento que compacte el archivo, quitando definitivamente las 
especies de aves marcadas como borradas.  Para quitar los registros se deberá 
copiar el último registro del archivo en la posición del registro a borrar y luego 
eliminar del archivo el último registro de forma tal de evitar registros duplicados.  
i. 
Implemente una variante de este procedimiento de compactación del 
archivo (baja física) donde el archivo se trunque una sola vez.}

program ej07;
type
	especie = record
		cod : integer;
		nom : string;
		fam : string;
		desc : string;
		zonaG : string;
	end;
	
	maestro = file of especie;
//--------------------------------------------------------------
procedure bajaEspecies(var mae:maestro; cod:integer);
var
	estado:boolean;
	regMae:especie;
begin
	 reset(mae);
	 estado := true;
	 while(not eof(mae))and(estado)do begin
		read(mae, regMae);
		if(regMae.cod = cod)then begin
			regMae.cod := -1;
			seek(mae, filePos(mae)-1);
			write(mae, regMae);
			estado := false;
		end;
	 end;
	 close(mae);
end;
//--------------------------------------------------------------
procedure compactarMaestro(var mae:maestro);
var
	regMae, regAux:especie;
	pos, ultPos:integer;
begin
	reset(mae);
	pos:=0;
	ultPos:= filesize(mae)-1;
	while(pos <= ultPos)do begin
		seek(mae, pos);
		read(mae, regMae);
		if(regMae.cod = -1)then begin
			seek(mae, ultPos);	//me posiciono sobre el ultimo valido
			read(mae, regAux);	//lo copio
			seek(mae, pos);		//me posiciono sobre el actual
			write(mae, regAux);	//sobreescribo esa posicion
			ultPos := ultPos -1;
		end
		else
			pos:=pos+1;
	end;
	seek(mae, ultPos+1);
	truncate(mae);
	close(mae);
end;
//--------------------------------------------------------------
procedure crearMaestroEjemplo(var mae:maestro);
var
	reg:especie;
begin
	assign(mae, 'maestro');
	rewrite(mae);
	reg.cod := 1; reg.nom := 'Aguila'; reg.fam := 'Accipitridae'; reg.desc := 'Ave rapaz'; reg.zonaG := 'Montañas';
	write(mae, reg);
	reg.cod := 2; reg.nom := 'Condor'; reg.fam := 'Cathartidae'; reg.desc := 'Gran ave voladora'; reg.zonaG := 'Andes';
	write(mae, reg);
	reg.cod := 3; reg.nom := 'Pinguino'; reg.fam := 'Spheniscidae'; reg.desc := 'Ave marina'; reg.zonaG := 'Antartida';
	write(mae, reg);
	reg.cod := 4; reg.nom := 'Paloma'; reg.fam := 'Spheniscidae'; reg.desc := 'Ave voladora'; reg.zonaG := 'Buenos Aires';
	write(mae, reg);
	reg.cod := 5; reg.nom := 'Hornero'; reg.fam := 'Spheniscidae'; reg.desc := 'Ave voladora'; reg.zonaG := 'Antartida';
	write(mae, reg);
	close(mae);
end;
//--------------------------------------------------------------
procedure mostrarMaestro(var mae:maestro);
var
	reg:especie;
begin
	reset(mae);
	writeln('Contenido del archivo:');
	while not eof(mae) do begin
		read(mae, reg);
		writeln('Cod: ', reg.cod, ', Nom: ', reg.nom, ', Fam: ', reg.fam, ', Desc: ', reg.desc, ', Zona: ', reg.zonaG);
	end;
	close(mae);
end;
//--------------------------------------------------------------
var
	mae:maestro;
begin
	crearMaestroEjemplo(mae);
	mostrarMaestro(mae);
	writeln('--- Borro especie con cod=2 ---');
	bajaEspecies(mae, 2);
	writeln('--- Borro especie con cod=3 ---');
	bajaEspecies(mae, 3);
	mostrarMaestro(mae);
	writeln('--- Compacto archivo ---');
	compactarMaestro(mae);
	assign(mae, 'maestro');
	mostrarMaestro(mae);
end.
