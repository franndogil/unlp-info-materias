{6. Agregar al menú del programa del ejercicio 5, opciones para: 
a. Añadir uno o más celulares al final del archivo con sus datos ingresados por 
teclado. 
b. Modificar el stock de un celular dado. 
c. Exportar el contenido del archivo binario a un archivo de texto denominado: 
”SinStock.txt”, con aquellos celulares que tengan stock 0. 
NOTA: Las búsquedas deben realizarse por nombre de celular. }

program ej06;
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
			writeln(arcText, nombre);
		end;
	end;
	close(arcText);
	close(arcLogico);
end;
//----------------------------------------------------
procedure leerCelular(var celu:celular);
begin
	writeln('Ingrese el codigo de celular:');
	readln(celu.codigo);
	writeln('Ingrese la marca:');
	readln(celu.marca);
	writeln('Ingrese el nombre:');
	readln(celu.nombre);
	writeln('Ingrese el precio:');
	readln(celu.precio);
	writeln('Ingrese la descripcion:');
	readln(celu.desc);
	writeln('Ingrese el stock minimo:');
	readln(celu.minStock);
	writeln('Ingrese el sotck disponible:');
	readln(celu.dispStock);
end;

//----------------------------------------------------
procedure agregarCelulares(var arcLogico:archivo);
var
	nombreArchivo:string;
	cantCelu, i:integer;
	celu:celular;
begin
	readln;
	writeln('Ingrese el nombre del archivo a modificar: ');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	writeln('Ingrese la cantidad de celulares a agregar: ');
	readln(cantCelu);
	for i:=1 to cantCelu do begin
		leerCelular(celu);
		seek(arcLogico, filesize(arcLogico));
		write(arcLogico, celu);
	end;
	close(arcLogico);
end;

//----------------------------------------------------
procedure modificarStock(var arcLogico:archivo);
var
	nombreArchivo:string;
	nombreCelu:string;
	celu:celular;
begin
	readln;
	writeln('Ingrese el nombre del archivo a abrir: ');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	writeln('Ingrese el nombre del celular a modificar el stock: ');
	readln(nombreCelu);
	while(not eof(arcLogico))do begin
		read(arcLogico, celu);
		if(celu.nombre = nombreCelu)then begin
			writeln('Ingrese el nuevo stock del celular: ');
			readln(celu.dispStock);
			seek(arcLogico, filepos(arcLogico)-1);
			write(arcLogico, celu);
		end;
	end;
	close(arcLogico);
end;

//----------------------------------------------------
procedure exportToTextSinStock(var arcLogico:archivo; var arcText:Text);
var
	nombreArchivo:string;
	celu:celular;
begin
	readln;
	writeln('Ingrese el nombre del archivo a exportar: ');
	readln(nombreArchivo);
	assign(arcLogico, nombreArchivo);
	reset(arcLogico);
	assign(arcText, 'SinStock.txt');
	rewrite(arcText);
	while(not eof(arcLogico))do begin
		read(arcLogico, celu);
		if(celu.dispStock = 0)then begin
			with celu do begin
				writeln(arcText, codigo, ' ',precio, ' ',marca);
				writeln(arcText, dispStock, ' ',minStock, ' ',desc);
				writeln(arcText, nombre);
			end;
		end;
	end;
	close(arcLogico);
	close(arcText);
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
		writeln('5. Agregar uno o mas celulares al archivo.');
		writeln('6.	Modificar el stock de un celular.');
		writeln('7. Exportar celulares sin stock.');
		writeln('8. Salir');
		read(opciones);
		
		case opciones of
			'1': crearArchivoRegistros(arcLogico, arcText);
			'2': listarCelularesStock(arcLogico);
			'3': listarCelularesDesc(arcLogico);
			'4': exportToText(arcLogico, arcText);
			'5': agregarCelulares(arcLogico);
			'6': modificarStock(arcLogico);
			'7': exportToTextSinStock(arcLogico, arcText);
		end;
	until(opciones = '8');
end.
