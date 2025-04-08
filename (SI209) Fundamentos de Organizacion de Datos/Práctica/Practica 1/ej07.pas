{7. Realizar un programa que permita: 
a) Crear un archivo binario a partir de la información almacenada en un archivo de 
texto. El nombre del archivo de texto es: “novelas.txt”. La información en el 
archivo de texto consiste en: código  de novela, nombre, género y precio de 
diferentes novelas argentinas. Los datos de cada novela se almacenan en dos 
líneas en el archivo de texto. La primera línea contendrá la siguiente información: 
código novela, precio y género, y la segunda línea almacenará el nombre de la 
novela. 
b) Abrir el archivo binario y permitir la actualización del mismo. Se debe poder 
agregar una novela y modificar una existente. Las búsquedas se realizan por 
código de novela. 
NOTA: El nombre del archivo binario es proporcionado por el usuario desde el teclado.}

program ejer07;

type
	novela = record
		codigo:integer;
		nombre:string;
		genero:string;
		precio:real;
	end;
	
	archivo = file of novela;

//-----------------------------------------------------
procedure crearArchivoBinario(var arcLogico:archivo; var arcText:Text);
var
	nombreText:string;
	nombreBin:string;
	nove:novela;
begin
	writeln('Ingrese el nombre del archivo de texto: ');
	readln(nombreText);
	assign(arcText, nombreText + '.txt');
	reset(arcText);
	writeln('Ingrese el nombre del archivo binario: ');
	readln(nombreBin);
	assign(arcLogico, nombreBin);
	rewrite(arcLogico);
	while(not eof(arcText))do begin
		readln(arcText, nove.codigo, nove.precio, nove.genero);
		readln(arcText, nove.nombre);
		write(arcLogico, nove);
	end;
	close(arcLogico);
	close(arcText);
end;
//-----------------------------------------------------
procedure leerNovela(var nove:novela);
begin
	writeln('Ingrese el codigo de la novela:');
	readln(nove.codigo);
	writeln('Ingrese el nombre de la novela:');
	readln(nove.nombre);
	writeln('Ingrese el genero de la novela:');
	readln(nove.genero);
	writeln('Ingrese el precio de la novela:');
	readln(nove.precio);
end;
//-----------------------------------------------------
procedure agregarNovela(var arcLogico:archivo);
var
	nombreArchivo:string;
	nove:novela;
begin
	writeln('Ingrese el nombre del archivo a abrir: ');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	while(not eof(arcLogico))do begin
		leerNovela(nove);
		seek(arcLogico, filesize(arcLogico));
		write(arcLogico, nove);
	end;
	close(arcLogico);
end;
//-----------------------------------------------------
procedure modifCodigo(var nove:novela);
var
	nueCod:integer;
begin
	writeln('Ingrese el nuevo codigo de la novela: ');
	readln(nueCod);
	nove.codigo := nueCod;
end;

//-----------------------------------------------------
procedure modifNombre(var nove:novela);
var
	nueNom:string;
begin
	writeln('Ingrese el nuevo nombre de la novela: ');
	readln(nueNom);
	nove.nombre := nueNom;
end;

//-----------------------------------------------------
procedure modifGenero(var nove:novela);
var
	nueGen:string;
begin
	writeln('Ingrese el nuevo genero de la novela: ');
	readln(nueGen);
	nove.genero := nueGen;
end;

//-----------------------------------------------------
procedure modifPrecio(var nove:novela);
var
	nuePre:real;
begin
	writeln('Ingrese el nuevo precio de la novela: ');
	readln(nuePre);
	nove.precio := nuePre;
end;

//-----------------------------------------------------
procedure modificarNovela(var arcLogico:archivo);
var
	nombreArchivo:string;
	codNovela:integer;
	opciones:char;
	nove:novela;
begin
	writeln('Ingrese el nombre del archivo a abrir: ');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	writeln('Ingrese el codigo de la novela a buscar: ');
	readln(codNovela);
	while(not eof(arcLogico))do begin
		read(arcLogico, nove);
		if(nove.codigo = codNovela)then begin
			writeln('Ingrese la caracteristica que desea modificar: ');
			writeln('1. Modificar el codigo.');
			writeln('2. Modificar el nombre.');
			writeln('3. Modificar el genero.');
			writeln('4. Modificar el precio.');
			readln(opciones);
			
			case opciones of
				'1': modifCodigo(nove);
				'2': modifNombre(nove);
				'3': modifGenero(nove);
				'4': modifPrecio(nove);
			end;
			
			seek(arcLogico, filepos(arcLogico)-1);
			write(arcLogico, nove);
		end;
	end;
	close(arcLogico);
end;
//-----------------------------------------------------
procedure exportToText(var arcLogico:archivo; var arcText:Text);
var
	nombreArchivo:string;
	nove:novela;
begin
	writeln('Ingrese el nombre del archivo a exportar:');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	assign(arcText, 'novelas.txt');
	rewrite(arcText);
	while(not eof(arcLogico))do begin
		read(arcLogico, nove);
		with nove do begin
			writeln(arcText, codigo, ' ', precio, '  ', genero);
			writeln(arcText, nombre);
		end;
	end;
	close(arcText);
	close(arcLogico);
end;

var
	arcText: Text;
	arcLogico: archivo;
	opciones:char;
begin
	assign(arcText, 'novelas.txt');
	repeat
		writeln('Ingrese una opcion para continuar: ');
		writeln('1. Crear un archivo binario.');
		writeln('2. Agregar una novela.');
		writeln('3. Modificar una novela.');
		writeln('4. ExportToText.');
		writeln('5. Salir.');
		readln(opciones);
		
		case opciones of
			'1': crearArchivoBinario(arcLogico, arcText);
			'2': agregarNovela(arcLogico);
			'3': modificarNovela(arcLogico);
			'4': exportToText(arcLogico, arcText);
		end;
		
	until(opciones = '5');
end.
