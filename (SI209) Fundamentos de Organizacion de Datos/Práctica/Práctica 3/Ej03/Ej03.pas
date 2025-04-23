{3. Realizar un programa que genere un archivo de novelas filmadas durante el presente 
año. De cada novela se registra: código, género, nombre, duración, director  y precio. 
El programa debe presentar un menú con las siguientes opciones: 
a. Crear el archivo y cargarlo a partir de datos ingresados por teclado. Se 
utiliza la técnica de lista invertida para recuperar espacio libre en el 
archivo.  Para ello, durante la creación del archivo, en el primer registro del 
mismo se debe almacenar la cabecera de la lista. Es decir un registro 
ficticio, inicializando con el valor cero (0) el campo correspondiente al 
código de novela, el cual indica que no hay espacio libre dentro del 
archivo.}

program ej03;
const
	valorAlto = 9999;
type
	novela = record
		codigo : integer;
		genero : string;
		nombre : string;
		duracion : integer;
		director : string;
		precio : real;
	end;

	archivo = file of novela;
//--------------------------------------------------------------
procedure leerNovela(var nov:novela);
begin
	writeln('Ingrese el codigo de la novela: ');
	readln(nov.codigo);
	if(nov.codigo <> 0)then begin
		writeln('Ingrese el genero de la novela: ');
		readln(nov.genero);
		writeln('Ingrese el nombre de la novela: ');
		readln(nov.nombre);
		writeln('Ingrese la duracion de la novela: ');
		readln(nov.duracion);
		writeln('Ingrese el director de la novela: ');
		readln(nov.director);
		writeln('Ingrese el precio de la novela: ');
		readln(nov.precio);
	end;
end;
//--------------------------------------------------------------
procedure modifNovela(var nov:novela);
begin
	writeln('Ingrese el genero de la novela: ');
	readln(nov.genero);
	writeln('Ingrese el nombre de la novela: ');
	readln(nov.nombre);
	writeln('Ingrese la duracion de la novela: ');
	readln(nov.duracion);
	writeln('Ingrese el director de la novela: ');
	readln(nov.director);
	writeln('Ingrese el precio de la novela: ');
	readln(nov.precio);
end;
//--------------------------------------------------------------
procedure cargarArchivo(var arcLogico:archivo);
var
	arcFisico:string;
	nov:novela;
begin
	writeln('Ingrese el nombre del archivo a crear: ');
	readln(arcFisico);
	assign(arcLogico, arcFisico);
	rewrite(arcLogico);
	nov.codigo := 0; nov.genero := ''; nov.nombre := ''; nov.duracion := 0; nov.director :=''; nov.precio:=0;
	write(arcLogico, nov);
	leerNovela(nov);
	while(nov.codigo<>0)do begin
		write(arcLogico, nov);
		leerNovela(nov);
	end; 
	close(arcLogico);
end;
//--------------------------------------------------------------
procedure darDeAlta(var arcLogico:archivo);
var
	nov, aux, pri:novela;
begin
	reset(arcLogico);
	read(arcLogico, pri);
	leerNovela(nov);
	if(pri.codigo=0)then begin		//guardamos la novela al final de archivo ya que no habian espacios libres
		seek(arcLogico, fileSize(arcLogico));
		if(nov.codigo<>0)then
			write(arcLogico, nov);
	end
	else begin
		seek(arcLogico, pri.codigo * -1);
		read(arcLogico, aux);
		seek(arcLogico, filePos(arcLogico)-1);
		write(arcLogico, nov);
		seek(arcLogico, 0);
		write(arcLogico, aux);
	end;
	
	close(arcLogico);
end;
//--------------------------------------------------------------
procedure modificarNovela(var arcLogico:archivo);
var
	nov:novela;
	codNov:integer;
	ok:boolean;
begin
	reset(arcLogico);
	ok:= true;
	writeln('Ingrese el codigo de la novela a modificar: ');
	readln(codNov);
	while(not eof(arcLogico))and(ok)do begin
		read(arcLogico, nov);
		if(nov.codigo = codNov)then begin
			modifNovela(nov);
			ok:= false;
		end;
	end;
	close(arcLogico);
end;
//--------------------------------------------------------------
procedure eliminarNovela(var arcLogico:archivo);
var
	codNov:integer;
	nov, aux:novela;
	ok:boolean;
begin
	ok:=true;
	reset(arcLogico);
	writeln('Ingrese el codigo de novela a eliminar: ');
	readln(codNov);
	read(arcLogico, aux);
	while(not eof(arcLogico))and(ok)do begin
		read(arcLogico, nov);
		if(nov.codigo = codNov)then begin
			seek(arcLogico, filePos(arcLogico)-1);
			write(arcLogico, aux);
			nov.codigo := (filePos(arcLogico)-1)*-1;
			seek(arcLogico, 0);
			write(arcLogico, nov);
			ok:=false;
		end;
	end;
	close(arcLogico);
end;
//--------------------------------------------------------------
procedure menu2(var arcLogico:archivo);
var
	opciones : char;
	arcFisico : string;
begin
	writeln('Ingrese una de las siguientes opciones: ');
	writeln('1. Dar de alta una novela.');
	writeln('2. Modificar los datos de una novela.');
	writeln('3. Eliminar una novela.');
	readln(opciones);
			
	writeln('Ingrese el nombre del archivo a modificar: ');
	readln(arcFisico);
	assign(arcLogico, arcFisico);
				
	case opciones of
		'1': darDeAlta(arcLogico);
		'2': modificarNovela(arcLogico);
		'3': eliminarNovela(arcLogico);
	end;
end;
//--------------------------------------------------------------
procedure exportToText(var arcLogico:archivo);
var
	arcText:text;
	arcFisico:string;
	nov:novela;
begin
	assign(arcText, 'novelas.txt');
	rewrite(arcText);
	writeln('Ingrese el nombre del archivo a exportar: ');
	read(arcFisico);
	assign(arcLogico, arcFisico);
	reset(arcLogico);
	//seek(arcLogico, 1);
	while(not eof(arcLogico))do begin
		read(arcLogico, nov);
		with nov do
			writeln(arcText, codigo, ' ', genero, ' ', nombre, ' ', duracion, ' ', director, ' ', precio);
	end;
	close(arcLogico);
	close(arcText);
end;
//--------------------------------------------------------------
var
	arcLogico:archivo;
	opciones : char;
begin
	repeat
		writeln('Ingrese una de las siguientes opciones: ');
		writeln('1. Crear un archivo de novelas.');
		writeln('2. Modificar un archivo de novelas.');
		writeln('3. Listar un archivo de novelas.');
		writeln('4. Salir.');
		readln(opciones);
		
		case opciones of
			'1': cargarArchivo(arcLogico);
			'2': menu2(arcLogico);
			'3': exportToText(arcLogico);
		end;
	until(opciones='4');
end.
