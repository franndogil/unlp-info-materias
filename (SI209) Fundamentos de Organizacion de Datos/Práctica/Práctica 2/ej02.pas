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
procedure crearMaestro(var aMaestro:archivoMaestro);
begin
end;
//----------------------------------------------------------
procedure crearDetalle(var aDetalle:archivoDetalle);
begin
end;
//----------------------------------------------------------
procedure actualizarMaestro(var aMaestro:archivoMaestro; var aDetalle:archivoDetalle);
begin
end;
//----------------------------------------------------------
procedure exportarMaestroText(var aMaestro:archivoMaestro);
begin
end;
//----------------------------------------------------------
var
	opciones:char;
	aMaestro:archivoMaestro;
	aDetalle:archivoDetalle;
begin
	repeat
		writeln('Ingrese una de las siguientes opciones: ');
		writeln('1. Crear archivo de productos.');
		writeln('2. Crear archivo de ventas.');
		writeln('3. Actualizar archivo maestro.');
		writeln('4. Exportar archivo maestro.');
		writeln('5. Salir.');
		readln(opciones);
		
		case opciones of
			'1': crearMaestro(aMaestro);
			'2': crearDetalle(aDetalle);
			'3': actualizarMaestro(aMaestro, aDetalle);
			'4': exportarMaestroText(aMaestro);
		end;
	until (opciones = '5');
end.
