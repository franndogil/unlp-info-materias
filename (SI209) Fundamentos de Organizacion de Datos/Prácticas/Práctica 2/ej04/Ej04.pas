program ej04;
const
	valorAlto = 9999;
type
	producto = record
		codP : integer;
		nom : string;
		desc : string;
		stDis : integer;
		stMin : integer;
		pre : real;
	end;
	
	venta = record
		codP : integer;
		cantV: integer;
	end;
	
	maestro = file of producto;
	detalle = file of venta;
	
	ventas = array[1..31] of detalle;
	
//-------------------------------------------------------------------------------
procedure cargarMaestro(var mae:maestro);
begin
end;
//-------------------------------------------------------------------------------
procedure cargarDetalles(var det:ventas);
begin
end;
//-------------------------------------------------------------------------------
procedure leer(var det:detalle; var regD:venta);
begin
	if(not eof(det)) then
		read(det, regD)
	else
		regD.codP := valorAlto;
end;

//-------------------------------------------------------------------------------
//aca tengo que aplicar el procedimiento MINIMO

procedure actualizarMaestro(var mae:maestro; var det:ventas);
var
	regM : producto;
	regD : venta;
	cont : integer;
begin
	reset(mae);
	cont := 0;
	while(not eof(mae))do begin
		cont := cont + 1;
		read(mae, regM);
		leer(det[cont], regD);
		while(regD.codP<>valorAlto)and(regM.codP = )do begin
		end;
	end;
	close(mae);
end;
//-------------------------------------------------------------------------------
	
var
	mae : maestro;
	det : ventas;
	opciones : char;
begin
	repeat
		writeln('Ingrese una de las siguientes opciones:');
		writeln('1. Cargar maestro.');	//harcode
		writeln('2. Cargar detalles.');	//hardcode
		writeln('3. Actualizar maestro.');
		writeln('4. Salir');
		readln(opciones);
		case opciones of
			'1': cargarMaestro(mae);
			'2': cargarDetalles(det);
			'3': actualizarMaestro(mae, det);
		end;
	until (opciones = '4');
end.
