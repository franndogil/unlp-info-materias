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
//-----------------------------------------------------------------------------------------------
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
//-----------------------------------------------------------------------------------------------
procedure crearMaestroHardcodeado(var mae:maestro);
var
  p: producto;
begin
  rewrite(mae);
  // Producto 1
  p.codP := 1; p.nomC := 'Jabon'; p.preV := 100; p.stcA := 50; p.stcM := 10;
  write(mae, p);
  // Producto 2
  p.codP := 2; p.nomC := 'Lavandina'; p.preV := 80; p.stcA := 30; p.stcM := 5;
  write(mae, p);
  // Producto 3
  p.codP := 3; p.nomC := 'Desinfectante'; p.preV := 120; p.stcA := 20; p.stcM := 3;
  write(mae, p);
  close(mae);
end;
//-----------------------------------------------------------------------------------------------
procedure crearDetalleHardcodeado(var det:detalle);
var
  v: venta;
begin
  rewrite(det);
  // Venta para producto 1
  v.codP := 1; v.cantV := 5; write(det, v);
  // Venta para producto 2
  v.codP := 2; v.cantV := 10; write(det, v);
  // Otra venta para producto 1
  v.codP := 1; v.cantV := 2; write(det, v);
  // Venta para producto 3
  v.codP := 3; v.cantV := 7; write(det, v);
  close(det);
end;
//-----------------------------------------------------------------------------------------------
procedure mostrarMaestro(var mae:maestro);
var
  p: producto;
begin
  reset(mae);
  writeln('Codigo | Nombre         | Precio | Stock Act | Stock Min');
  while not eof(mae) do begin
    read(mae, p);
    writeln(p.codP:6, ' | ', p.nomC:14, ' | ', p.preV:6:2, ' | ', p.stcA:9, ' | ', p.stcM:9);
  end;
  close(mae);
end;
//-----------------------------------------------------------------------------------------------
procedure mostrarDetalle(var det:detalle);
var
  v: venta;
begin
  reset(det);
  writeln('Codigo | Cantidad Vendida');
  while not eof(det) do begin
    read(det, v);
    writeln(v.codP:6, ' | ', v.cantV:15);
  end;
  close(det);
end;
//-----------------------------------------------------------------------------------------------
var 
	mae: maestro;
	det: detalle;

begin
  assign(mae, 'maestro.dat');
  assign(det, 'detalle.dat');
  crearMaestroHardcodeado(mae);
  crearDetalleHardcodeado(det);
  writeln('Detalle de ventas:');
  mostrarDetalle(det);
  writeln('Maestro antes de actualizar:');
  mostrarMaestro(mae);
  actualizarMaestro(mae, det);
  writeln('Maestro despues de actualizar:');
  mostrarMaestro(mae);
end.

