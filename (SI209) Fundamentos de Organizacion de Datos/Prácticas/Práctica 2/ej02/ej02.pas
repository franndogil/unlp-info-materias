{2. El encargado de ventas de un negocio de productos de limpieza desea administrar el stock 
de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los 
productos que comercializa. De cada producto se maneja la siguiente información: código de 
producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se 
genera un archivo detalle donde se registran todas las ventas de productos realizadas. De 
cada venta se registran: código de producto y cantidad de unidades vendidas. Se pide 
realizar un programa con opciones para: 
a. Actualizar el archivo maestro con el archivo detalle, sabiendo que: 
● Ambos archivos están ordenados por código de producto. 
● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del 
archivo detalle. 
● El archivo detalle sólo contiene registros que están en el archivo maestro. 
b. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo 
stock actual esté por debajo del stock mínimo permitido. 
}

program ej02;
type
	producto = record
		codigo:integer;
		nombre:string;
		precio:real;
		stAct:integer;
		stMin:integer;
	end;
	
	venta = record
		codigo:integer;
		cant:integer;
	end;
	
	archivoMaestro = file of producto;
	archivoDetalle = file of venta;
//----------------------------------------------------------
procedure leerProducto(var pro:producto);
begin
	writeln('Ingrese el codigo del producto: ');
	readln(pro.codigo);
	if(pro.codigo<>0)then begin
		writeln('Ingrese el nombre del producto: ');
		readln(pro.nombre);
		writeln('Ingrese el precio del producto: ');
		readln(pro.precio);
		writeln('Ingrese el stock actual del producto: ');
		readln(pro.stAct);
		writeln('Ingrese el stock minimo del producto: ');
		readln(pro.stMin);
	end;
end;
//----------------------------------------------------------
procedure leerVenta(var ven:venta);
begin
	writeln('Ingrese el codigo de producto vendido: ');
	readln(ven.codigo);
	if(ven.codigo<>0)then begin
		writeln('Ingrese la cantidad vendida: ');
		readln(ven.cant);
	end;
end;
//----------------------------------------------------------
procedure crearMaestro(var aMaestro:archivoMaestro);
var
	nombreArchivo:string;
	pro:producto;
begin
	writeln('Ingrese el nombre del archivo maestro a crear: ');
	readln(nombreArchivo);
	assign(aMaestro, nombreArchivo);
	rewrite(aMaestro);
	leerProducto(pro);
	while(pro.codigo<>0)do begin
		write(aMaestro, pro);
		leerProducto(pro);
	end;
	close(aMaestro);
end;
//----------------------------------------------------------
procedure crearDetalle(var aDetalle:archivoDetalle);
var
	nombreArchivo:string;
	ven:venta;
begin
	writeln('Ingrese el nombre del archivo detalle a crear: ');
	read(nombreArchivo);
	assign(aDetalle, nombreArchivo);
	rewrite(aDetalle);
	leerVenta(ven);
	while(ven.codigo<>0)do begin
		write(aDetalle, ven);
		leerVenta(ven);
	end;
	close(aDetalle);
end;
//----------------------------------------------------------
procedure actualizarMaestro(var aMaestro:archivoMaestro; var aDetalle:archivoDetalle);
var
	nombreMaestro, nombreDetalle:string;
	ven:venta;
	pro:producto;
begin
	writeln('Ingrese el nombre del archivo maestro a actualizar: ');
	readln(nombreMaestro);
	writeln('Ingrese el nombre del archivo detalle a utilizar: ');
	readln(nombreDetalle);
	
	assign(aMaestro, nombreMaestro);
	reset(aMaestro);
	assign(aDetalle, nombreDetalle);
	reset(aDetalle);
	
	while(not eof(aDetalle))do begin
		read(aMaestro, pro);
		read(aDetalle, ven);
		while(pro.codigo <> ven.codigo)do 		//{Se busca en el maestro el producto del detalle}
			read(aMaestro, pro);
		pro.stAct := pro.stAct - ven.cant;		//{Se modifica el stock del producto con la cantidad vendida de ese producto}
		seek(aMaestro, filepos(aMaestro)-1);	//{Se reubica el puntero en el maestro}
		write(aMaestro, pro);					//{Se escribe el producto en el maestro}
	end;
	close(aMaestro);
	close(aDetalle);
end;
//----------------------------------------------------------
procedure exportarMaestroText(var aMaestro:archivoMaestro; var aText:text);
var
	nombreArchivo:string;
	pro:producto;
begin
	writeln('Ingrese el nombre del archivo maestro a exportar: ');
	readln(nombreArchivo);
	assign(aMaestro, nombreArchivo);
	reset(aMaestro);
	assign(aText, nombreArchivo + '.txt');
	rewrite(aText);
	while(not eof(aMaestro))do begin
		read(aMaestro, pro);
		with pro do begin
			writeln(aText, codigo, ' ', nombre, ' ', precio, ' ', stAct, ' ', stMin);
		end;
	end;
	close(aText);
	close(aMaestro);
end;

//----------------------------------------------------------
procedure exportarDetalleText(var aDetalle:archivoDetalle; var aText:text);
var
	nombreArchivo:string;
	ven:venta;
begin
	writeln('Ingrese el nombre del archivo maestro a exportar: ');
	readln(nombreArchivo);
	assign(aDetalle, nombreArchivo);
	reset(aDetalle);
	assign(aText, nombreArchivo + '.txt');
	rewrite(aText);
	while(not eof(aDetalle))do begin
		read(aDetalle, ven);
		with ven do begin
			writeln(aText, codigo, ' ', cant);
		end;
	end;
	close(aText);
	close(aDetalle);
end;
//----------------------------------------------------------
var
	opciones:char;
	aMaestro:archivoMaestro;
	aDetalle:archivoDetalle;
	aText:text;
begin
	repeat
		writeln('Ingrese una de las siguientes opciones: ');
		writeln('1. Crear archivo de productos.');
		writeln('2. Crear archivo de ventas.');
		writeln('3. Actualizar archivo maestro.');
		writeln('4. Exportar archivo maestro.');
		writeln('5. Exportar archivo detalle.');
		writeln('6. Salir.');
		readln(opciones);
		
		case opciones of
			'1': crearMaestro(aMaestro);
			'2': crearDetalle(aDetalle);
			'3': actualizarMaestro(aMaestro, aDetalle);
			'4': exportarMaestroText(aMaestro, aText);
			'5': exportarDetalleText(aDetalle, aText);
		end;
	until (opciones = '6');
end.
