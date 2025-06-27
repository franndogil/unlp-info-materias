{1. El encargado de ventas de un negocio de productos de limpieza desea administrar el 
stock de los productos que vende. Para ello, genera un archivo maestro donde figuran 
todos los productos que comercializa. De cada producto se maneja la siguiente 
información: código de producto, nombre comercial, precio de venta, stock actual y 
stock mínimo. Diariamente se genera un archivo detalle donde se registran todas las 
ventas de productos realizadas. De cada venta se registran: código de producto y 
cantidad de unidades vendidas. Resuelve los siguientes puntos:  
a. Se pide realizar un procedimiento que actualice el archivo maestro con el 
archivo detalle, teniendo en cuenta que: 
i. 
ii. 
Los archivos no están ordenados por ningún criterio. 
Cada registro del maestro puede ser actualizado por 0, 1 ó más registros 
del archivo detalle. 
b. ¿Qué cambios realizaría en el procedimiento del punto anterior si se sabe que 
cada registro del archivo maestro puede ser actualizado por 0 o 1 registro del 
archivo detalle? }

program ej01;
type
	producto = record
		codP : integer;
		nomC : string;
		preV : real;
		stcA : integer;
		stcM : integer;
	end;
	
	venta = record
		codP : integer;
		cantV : integer;
	end;
	
	maestro = file of producto;
	detalle = file of venta;
	
procedure actualizarMaestro(var mae:maestro; var det:detalle);
var
	regMae : producto;
	regDet : venta;
begin
	reset(mae); reset(det);
	while(not eof(det))do begin
		seek(mae, 0);					//por cada lectura de registro detalle, me posiciono nuevamente sobre el principio del registro maestro
		read(mae, regMae);
		read(det, regDet);
		while(regMae.codP <> regDet. codP)and(not eof(mae))do 	//mientras no se igual y no sea el fin del maestro avanzo al siguiente
			read(mae, regMae);
		if(regMae.codP = regDet.codP)then begin
			regMae.stcA := regMae.stcA - regDet.cantV;	//modifico el registro
			seek(mae, filepos(mae)-1);					//vuelvo una posicion para actualizar el maestro
			write(mae, regMae);							//actualizo el maestro
		end;
	end;
	close(mae); close(det);
end;

begin
end.
	
