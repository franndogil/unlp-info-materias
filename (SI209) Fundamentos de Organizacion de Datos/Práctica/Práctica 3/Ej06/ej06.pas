{6. Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado con 
la información correspondiente a las prendas que se encuentran a la venta. De cada 
prenda se registra: cod_prenda, descripción, colores, tipo_prenda, stock y 
precio_unitario. Ante un eventual cambio de temporada, se deben actualizar las 
prendas a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las 
prendas que quedarán obsoletas. Deberá implementar un procedimiento que reciba 
ambos archivos y  realice la baja lógica de las prendas, para ello deberá modificar el 
stock de la prenda correspondiente a valor negativo. 
Adicionalmente, deberá implementar otro procedimiento que se encargue de 
efectivizar las bajas lógicas que se realizaron sobre el archivo maestro con la 
información de las prendas a la venta. Para ello se deberá utilizar una estructura 
auxiliar (esto es, un archivo nuevo),  en el cual se copien únicamente aquellas prendas 
que no están marcadas como borradas. Al finalizar este proceso de compactación 
del archivo, se deberá renombrar el archivo nuevo con el nombre del archivo maestro 
original. }

program ej06;

type
	prenda = record
		codP : integer;
		desc : string;
		colores : array [1..10] of string;
		tipo : string;
		stock : integer;
		precio : real;
	end;
	
	baja = record
		codP : integer;
	end;
	
	maestro = file of prenda;
	detalle = file of baja;

procedure actualizarMaestro(var mae: maestro; var det: detalle);
var
  regBaja: baja;
  regMae: prenda;
  encontrado: boolean;
begin
  reset(mae); reset(det);
  while not eof(det) do begin
    read(det, regBaja);
    seek(mae, 0); 		// Buscar desde el principio para cada código
    encontrado := false;
    while (not eof(mae)) and (not encontrado) do begin
      read(mae, regMae);
      if (regMae.codP = regBaja.codP) then begin
        regMae.stock := -1; 	// Baja lógica
        seek(mae, filepos(mae)-1);
        write(mae, regMae);
        encontrado := true;
      end;
    end;
  end;
  close(mae); close(det);
end;

begin
end.
