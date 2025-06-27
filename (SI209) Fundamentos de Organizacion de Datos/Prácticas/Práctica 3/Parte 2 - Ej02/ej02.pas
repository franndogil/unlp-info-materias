{2. Se necesita contabilizar los votos de las diferentes mesas electorales registradas por  
localidad en la provincia de Buenos Aires. Para ello, se posee un archivo con la 
siguiente información: código de localidad, número de mesa y cantidad de votos en 
dicha mesa. Presentar en pantalla un listado como se muestra a continuación: 
Código de Localidad                 
................................                   
................................                   
Total General de Votos:              
NOTAS:  
Total de Votos 
...................... 
...................... 
……………… 
● La información en el archivo no está ordenada por ningún criterio. 
● Trate de resolver el problema sin modificar el contenido del archivo dado. 
● Puede utilizar una estructura auxiliar, como por ejemplo otro archivo, para 
llevar el control de las localidades que han sido procesadas}

program ej02;
type
	mesa = record
		codL : integer;
		codM : integer;
		cantV : integer;
	end;
	
	localidad = record
		codL : integer;
		cantV : integer;
	end;
	
	maestro = file of localidad;
	detalle = file of mesa;
//----------------------------------------------------------------------
procedure actualizarMaestro(var mae:maestro; var det:detalle);
var
	regMae : localidad;
	regDet : mesa;
begin
	reset(mae); reset(det);
	while(not eof(det))do begin
		seek(mae, 0);				//posiciono al maestro al principio
		read(mae, regMae);
		read(det, regDet);
		while(regMae.codL <> regDet.codL)and(not eof(mae))do
			read(mae, regMae);		//avanzo hasta encontrarlo o hasta que se termine el maestro
		if(regMae.codL = regDet.codL)then begin
			regMae.cantV := regMae.cantV + regDet.cantV;	//modifico el registro maestro
			seek(mae, filepos(mae)-1);						//vuelvo uno atras y actualizo el maestro
			write(mae, regMae);
		end;
	end;
	close(mae); close(det);
end;
//----------------------------------------------------------------------
procedure listar(var mae:maestro);
var
	votosTotales : integer;
	regMae : localidad;
begin
	votosTotales := 0;
	reset(mae);
	writeln('Código de Localidad 	|	 Total de votos');
	while(not eof(mae))do begin
		read(mae, regMae);
		Writeln('         ',regMae.codL, '                           ',regMae.cantV);
		votosTotales :=  votosTotales + regMae.cantV;
	end;
	writeln('Total General de Votos: ', votosTotales);
	close(mae);
end;
//----------------------------------------------------------------------
procedure crearDetalle(var det:detalle);
var
  reg: mesa;
begin
  rewrite(det);
  // Hardcodeo de mesas: codL, codM, cantV
  reg.codL := 1; reg.codM := 101; reg.cantV := 120; write(det, reg);
  reg.codL := 2; reg.codM := 201; reg.cantV := 80; write(det, reg);
  reg.codL := 1; reg.codM := 102; reg.cantV := 130; write(det, reg);
  reg.codL := 3; reg.codM := 301; reg.cantV := 200; write(det, reg);
  reg.codL := 2; reg.codM := 202; reg.cantV := 90; write(det, reg);
  close(det);
end;
//----------------------------------------------------------------------
procedure crearMaestro(var mae:maestro);
var
  reg: localidad;
begin
  rewrite(mae);
  // Hardcodeo de localidades: codL, cantV (inicialmente en 0)
  reg.codL := 1; reg.cantV := 0; write(mae, reg);
  reg.codL := 2; reg.cantV := 0; write(mae, reg);
  reg.codL := 3; reg.cantV := 0; write(mae, reg);
  close(mae);
end;
//----------------------------------------------------------------------
procedure verDetalle(var det:detalle);
var
  reg: mesa;
begin
  reset(det);
  writeln('Detalle de mesas:');
  writeln('CodLocalidad | CodMesa | CantVotos');
  while not eof(det) do
  begin
    read(det, reg);
    writeln('     ', reg.codL:3, '        ', reg.codM:4, '      ', reg.cantV:5);
  end;
  close(det);
end;
//----------------------------------------------------------------------
var
  mae: maestro;
  det: detalle;
begin
  assign(mae, 'maestro.dat');
  assign(det, 'detalle.dat');
  crearMaestro(mae);
  crearDetalle(det);
  writeln('--- Archivo Detalle antes de actualizar ---');
  verDetalle(det);
  actualizarMaestro(mae, det);
  writeln('--- Listado de votos por localidad ---');
  listar(mae);
end.
