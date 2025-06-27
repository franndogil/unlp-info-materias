{5. Realizar un programa para una tienda de celulares, que presente un menú con 
opciones para: 
a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos 
ingresados desde un archivo de texto denominado “celulares.txt”. Los registros 
correspondientes a los celulares deben contener: código de celular, nombre, 
descripción, marca, precio, stock mínimo y stock disponible. 
b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al 
stock mínimo. 
c. Listar en pantalla los celulares del archivo cuya descripción contenga una 
cadena de caracteres proporcionada por el usuario. 
d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado 
“celulares.txt” con todos los celulares del mismo. El archivo de texto generado 
podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que 
debería respetar el formato dado para este tipo de archivos en la NOTA 2. 
NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el 
usuario. 
NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique 
en tres  líneas consecutivas. En la primera se especifica: código de celular,  el precio y 
marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera 
nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo 
“celulares.txt”. }

program ej05;
type
	celular = record
		codigo:integer;
		nombre:string;
		desc:string;
		marca:string;
		precio:real;
		minStock:integer;
		dispStock:integer;
	end;
	
	archivo = file of celular;
//----------------------------------------------------
procedure crearArchivoRegistros(var arcLogico: archivo; var arcText: Text);
var
	celu: celular;
	nombreArchivo: string[12];
begin
	readln;		//debia limpiar el buffer de entrada
	write('Nombre del archivo a crear:'); readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcText);
	rewrite(arcLogico);
	while (not eof(arcText)) do begin
		with celu do begin
			readln(arcText, codigo, precio, marca);
			readln(arcText, dispStock, minStock, desc);
			readln(arcText, nombre);
			write(arcLogico, celu);
		end;
	end;
	close(arcLogico); 
	close(arcText);
end;
//----------------------------------------------------
procedure imprimirCelular(celu:celular);
begin
	write('Codigo: ', celu.codigo, ' Marca: ', celu.marca, ' Nombre: ', celu.nombre, ' Descripcion: ', celu.desc, ' Precio: ', celu.precio, ' Stock Minimo:', celu.minStock, ' Stock Disponible: ', celu.dispStock);
end;

//----------------------------------------------------
procedure listarCelularesStock(var arcLogico:archivo);
var
	celu:celular;
	nombreArchivo:string;
begin
	readln;
	writeln('Ingrese el nombre del archivo a abrir: ');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	while(not eof(arcLogico))do begin
		read(arcLogico, celu);
		if(celu.dispStock < celu.minStock)then begin
			imprimirCelular(celu);
		end;
	end;
	close(arcLogico);
end;

//----------------------------------------------------
procedure listarCelularesDesc(var arcLogico:archivo);
var
	nombreArchivo:string;
	descripPersonalizada:string;
	celu:celular;
begin
	readln;
	writeln('Ingrese el nombre del archivo a abrir: ');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	writeln('Ingrese la descripcion buscada: ');
	readln(descripPersonalizada);
	readln;
	while(not eof(arcLogico))do begin
		read(arcLogico, celu);
		if(descripPersonalizada = celu.desc)then
			imprimirCelular(celu);
	end;
	close(arcLogico);
end;
//----------------------------------------------------
procedure exportToText(var arcLogico:archivo; var arcText: Text);
var
	celu:celular;
	nombreArchivo:string;
begin
	readln;
	writeln('Ingrese el nombre del archivo a exportar: ');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	assign(arcText, 'celulares.txt');
	rewrite(arcText);
	while(not eof(arcLogico))do begin
		read(arcLogico, celu);
		with celu do begin
			writeln(arcText, codigo, ' ',precio, ' ',marca);
			writeln(arcText, dispStock, ' ',minStock, ' ',desc);
			writeln(arcText, nombre)
		end;
	end;
	close(arcText);
	close(arcLogico);
end;

//----------------------------------------------------

var
	arcLogico: archivo;
	arcText: Text;
	opciones:char;
begin
	assign(arcText, 'celulares.txt');
	
	repeat
		writeln('Ingrese alguna de las siguentes opciones: ');
		writeln('1. Crear un archivo de registros no ordenados de celulares y cargarlo con datos ingresados desde un archivo de texto denominado "celulares.txt".');
		writeln('2. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al stock mínimo.');
		writeln('3. Listar en pantalla los celulares del archivo cuya descripción contenga una cadena de caracteres proporcionada por el usuario. ');
		writeln('4. Exportar a un archivo de texto.');
		writeln('5. Salir');
		read(opciones);
		
		case opciones of
			'1': crearArchivoRegistros(arcLogico, arcText);
			'2': listarCelularesStock(arcLogico);
			'3': listarCelularesDesc(arcLogico);
			'4': exportToText(arcLogico, arcText);
		end;
	until(opciones = '5');
end.
