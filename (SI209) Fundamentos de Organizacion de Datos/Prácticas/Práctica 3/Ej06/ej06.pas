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
//---------------------------------------------------------------------------------------
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
//---------------------------------------------------------------------------------------
procedure compactarMaestro(var mae:maestro; var cop:maestro);
var
	regMae:prenda;
begin
	reset(mae);
	assign(cop, 'copia');
	rewrite(cop);
	while(not eof(mae))do begin
		read(mae, regMae);			//leo cada registro del maestro
		if(regMae.stock>=0)then begin	//si el stock es mayor o igual a cero, lo salvo
			write(cop, regMae);
		end;
	end;
	close(cop);
	close(mae);
	erase(mae);				//si no borro el maestro viejo tira runtime 5
	rename(cop, 'maestro');
end;
//---------------------------------------------------------------------------------------
procedure crearMaestro(var mae: maestro);
var
  reg: prenda;
  i: integer;
begin
  rewrite(mae);
  for i := 1 to 5 do begin
    reg.codP := i;
    reg.desc := 'Prenda ' + Chr(64+i);
    reg.colores[1] := 'Rojo';
    reg.tipo := 'Tipo' + Chr(64+i);
    reg.stock := 10 * i;
    reg.precio := 100 * i;
    write(mae, reg);
  end;
  close(mae);
end;
//---------------------------------------------------------------------------------------
procedure crearDetalle(var det: detalle);
var
  reg: baja;
begin
  rewrite(det);
  reg.codP := 2; write(det, reg);
  reg.codP := 4; write(det, reg);
  close(det);
end;

procedure mostrarMaestro(var mae: maestro);
var
  reg: prenda;
begin
  reset(mae);
  writeln('Contenido del maestro:');
  while not eof(mae) do begin
    read(mae, reg);
    writeln('Cod:', reg.codP, ' Desc:', reg.desc, ' Stock:', reg.stock, ' Precio:', reg.precio:0:2);
  end;
  close(mae);
end;
//---------------------------------------------------------------------------------------
var
  mae, cop: maestro;
  det: detalle;
begin
  assign(mae, 'maestro');
  assign(det, 'detalle');
  crearMaestro(mae);
  crearDetalle(det);

  writeln('--- Maestro original ---');
  mostrarMaestro(mae);

  actualizarMaestro(mae, det);
  writeln('--- Maestro tras baja lógica ---');
  mostrarMaestro(mae);

  compactarMaestro(mae, cop);
  writeln('--- Maestro tras compactación ---');
  mostrarMaestro(mae);
end.
