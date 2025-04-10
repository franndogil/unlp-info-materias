{3. A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un 
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas 
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos 
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de 
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos 
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle. 
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle      
pueden venir 0, 1 ó más registros por cada provincia.}

program ej03;
const
	valorAlto='ZZZ';
type
	infoMaestro = record
		nombre:string;
		alfabetizados:integer;
		encuestados:integer;
	end;
	
	infoDetalle = record
		nombre:string;
		codLoc:integer;
		alfabetizados:integer;
		encuestados:integer;
	end;

	maestro = file of infoMaestro;
	detalle = file of infoDetalle;
//-------------------------------------------------------
procedure leer(var det:detalle; var dato: infoDetalle);
begin
    if(not eof(det)) then
        read(det, dato)
    else
        dato.nombre:= valorAlto;
end;
//-------------------------------------------------------
procedure minimo(var regd1, regd2, min:infoDetalle; var det1, det2: detalle);
begin
	if(regd1.nombre<=regd2.nombre)then begin
		min:=regd1;
		leer(det1, regd1);
	end
	else begin
		min:=regd2;
		leer(det2, regd2);
	end;
end;
//-------------------------------------------------------
procedure actualizarMaestro(var mae:maestro; var det1:detalle; var det2:detalle);
var
	nombreMaestro, nombreDetalleUno, nombreDetalleDos:string;
	regd1, regd2, min: infoDetalle;
	regm: infoMaestro;
begin
	writeln('Ingrese el nombre del archivo maestro: ');
	readln(nombreMaestro);
	writeln('Ingrese el nombre del archivo maestro: ');
	readln(nombreDetalleUno);
	writeln('Ingrese el nombre del archivo maestro: ');
	readln(nombreDetalleDos);
	
	assign(mae, nombreMaestro); assign(det1, nombreDetalleUno); assign(det2, nombreDetalleDos);
	reset(mae); reset(det1); reset(det2);
	leer(det1, regd1); leer(det2, regd2);	
	minimo(regd1, regd2, min, det1, det2);	//leo el minimo
	
	while(min.nombre<>valorAlto)do begin
		read(mae, regm);
		while(regm.nombre <> min.nombre)do begin
			read(mae, regm);
			while(regm.nombre = min.nombre)do begin
				regm.alfabetizados := regm.alfabetizados + min.alfabetizados; //actualizo todo
				regm.encuestados := regm.encuestados + min.encuestados;
				minimo(regd1, regd2, min, det1, det2);
			end;
			seek(mae, filepos(mae)-1);
			write(mae, regm);
		end;
	end;
	
	close(mae); close(det1); close(det2); 
end;
//----------------------------------------------------------------
var
	mae:maestro;
	det1, det2:detalle;
	opciones:char;
begin
	repeat
		writeln('Ingrese una de las siguientes opciones: ');
		writeln('1. Actualizar archivo maestro.');
		writeln('2. Salir.');
		readln(opciones);
		
		case opciones of
			'1': actualizarMaestro(mae, det1, det2);
		end;
	until(opciones = '2');
end.
