//actualizarMaestro creado por mi, le pedi a copilot que me lo harcodee para ahorrarme un poco de tiempo, funciona y recorro una vez cada archivo.

program ej07;
const
	valorAlto = 999;
type
	fecha = record
		dia : integer;
		mes : integer;
		anio : integer;
	end;

	alumno = record
		cod : integer;
		ape : string;
		nom : string;
		curA : integer;
		finA : integer;
	end;
	
	cursada = record
		codA : integer;
		codM : integer;
		aCur : integer;
		res : string;
	end;
	
	finalRendido = record
		codA : integer;
		codM : integer;
		fecha : fecha;
		nota : integer;
	end;
	
	maestro = file of alumno;
	detCur = file of cursada;
	detFin = file of finalRendido;
//-------------------------------------------------------------------------------------------
procedure leerFecha(var f:fecha);
begin
	readln(f.dia);
	readln(f.mes);
	readln(f.anio);
end;
//-------------------------------------------------------------------------------------------
procedure leerCur(var detC:detCur; var regCur:cursada);
begin
	if(not eof(detC))then
		read(detC, regCur)
	else
		regCur.codA := valorAlto;
end;
//-------------------------------------------------------------------------------------------
procedure leerFin(var detF:detFin; var regFin:finalRendido);
begin
	if(not eof(detF))then
		read(detF, regFin)
	else
		regFin.codA := valorAlto;
end;

// Mostrar archivo detalle de cursadas
procedure mostrarDetCur(var detC:detCur);
var
  reg: cursada;
begin
  reset(detC);
  writeln('--- Detalle de Cursadas ---');
  while not eof(detC) do
  begin
    read(detC, reg);
    writeln('Cod Alumno: ', reg.codA, ' | Cod Materia: ', reg.codM, ' | Año: ', reg.aCur, ' | Resultado: ', reg.res);
  end;
  close(detC);
end;

// Mostrar archivo detalle de finales
procedure mostrarDetFin(var detF:detFin);
var
  reg: finalRendido;
begin
  reset(detF);
  writeln('--- Detalle de Finales ---');
  while not eof(detF) do
  begin
    read(detF, reg);
    writeln('Cod Alumno: ', reg.codA, ' | Cod Materia: ', reg.codM, ' | Fecha: ', reg.fecha.dia, '/', reg.fecha.mes, '/', reg.fecha.anio, ' | Nota: ', reg.nota);
  end;
  close(detF);
end;

//-------------------------------------------------------------------------------------------
//debo leer los dos detalles, operar con el mismo alumno y modificar el maestro antes de pasar al siguiente alumno

procedure actualizarMaestro(var mae:maestro; var detC:detCur; var detF:detFin);
var
	regM : alumno;
	regCur : cursada;
	regFin : finalRendido;
	finApr, curApr : integer;
begin
	reset(mae); reset(detC); reset(detF);	//abro los archivos
	while(not eof(mae)) do begin
		finApr := 0;
		curApr := 0;
		read(mae, regM);
		leerCur(detC, regCur);
		leerFin(detF, regFin);
		
		while(regCur.codA <> valorAlto)and(regM.cod = regCur.codA )do begin
			if(regCur.res = 'Aprobado')then
				curApr := curApr + 1;
			leerCur(detC, regCur);
		end;
		while(regFin.codA <> valorAlto)and(regM.cod = regFin.codA)do begin
			if(regFin.nota >= 4)then
				finApr := finApr + 1;
			leerFin(detF, regFin);
		end;
		
		//vuelvo atras 1 pos en todos para luego operar con el siguiente alumno
		seek(mae, filePos(mae)-1);
		seek(detC, filePos(detC)-1);
		seek(detF, filePos(detF)-1);
		
		//actualizo el maestro
		regM.curA := curApr;
		regM.finA := finApr;
		
		write(mae, regM);
		
	end;
	close(mae); close(detC); close(detF);	//cierro los archivos
end;
//-------------------------------------------------------------------------------------------
// Procedimiento para crear un archivo maestro de prueba
procedure crearMaestro(var mae:maestro);
var
  reg: alumno;
begin
  rewrite(mae);
  // Alumno 1
  reg.cod := 1; reg.ape := 'Perez'; reg.nom := 'Juan'; reg.curA := 0; reg.finA := 0;
  write(mae, reg);
  // Alumno 2
  reg.cod := 2; reg.ape := 'Gomez'; reg.nom := 'Ana'; reg.curA := 0; reg.finA := 0;
  write(mae, reg);
  // Alumno 3
  reg.cod := 3; reg.ape := 'Lopez'; reg.nom := 'Luis'; reg.curA := 0; reg.finA := 0;
  write(mae, reg);
  close(mae);
end;

//-------------------------------------------------------------------------------------------
// Procedimiento para crear un archivo detalle de cursadas de prueba
procedure crearDetCur(var detC:detCur);
var
  reg: cursada;
begin
  rewrite(detC);
  // Alumno 1
  reg.codA := 1; reg.codM := 101; reg.aCur := 2023; reg.res := 'Aprobado'; write(detC, reg);
  reg.codA := 1; reg.codM := 102; reg.aCur := 2023; reg.res := 'Desaprobado'; write(detC, reg);
  // Alumno 2
  reg.codA := 2; reg.codM := 101; reg.aCur := 2023; reg.res := 'Aprobado'; write(detC, reg);
  reg.codA := 2; reg.codM := 103; reg.aCur := 2023; reg.res := 'Aprobado'; write(detC, reg);
  // Alumno 3
  reg.codA := 3; reg.codM := 104; reg.aCur := 2023; reg.res := 'Desaprobado'; write(detC, reg);
  close(detC);
end;

//-------------------------------------------------------------------------------------------
// Procedimiento para crear un archivo detalle de finales de prueba
procedure crearDetFin(var detF:detFin);
var
  reg: finalRendido;
begin
  rewrite(detF);
  // Alumno 1
  reg.codA := 1; reg.codM := 101; reg.fecha.dia := 1; reg.fecha.mes := 6; reg.fecha.anio := 2023; reg.nota := 7; write(detF, reg);
  // Alumno 2
  reg.codA := 2; reg.codM := 101; reg.fecha.dia := 2; reg.fecha.mes := 6; reg.fecha.anio := 2023; reg.nota := 3; write(detF, reg);
  reg.codA := 2; reg.codM := 103; reg.fecha.dia := 3; reg.fecha.mes := 6; reg.fecha.anio := 2023; reg.nota := 8; write(detF, reg);
  // Alumno 3
  reg.codA := 3; reg.codM := 104; reg.fecha.dia := 4; reg.fecha.mes := 6; reg.fecha.anio := 2023; reg.nota := 4; write(detF, reg);
  close(detF);
end;

//-------------------------------------------------------------------------------------------
// Mostrar el archivo maestro
procedure mostrarMaestro(var mae:maestro);
var
  reg: alumno;
begin
  reset(mae);
  writeln('--- Archivo Maestro ---');
  while not eof(mae) do
  begin
    read(mae, reg);
    writeln('Cod: ', reg.cod, ' | Apellido: ', reg.ape, ' | Nombre: ', reg.nom, ' | Cursadas Aprobadas: ', reg.curA, ' | Finales Aprobados: ', reg.finA);
  end;
  close(mae);
end;

//-------------------------------------------------------------------------------------------

var
    mae : maestro;
    detC : detCur;
    detF : detFin;
     opciones:char;
begin
    assign(mae, 'maestro.dat');
    assign(detC, 'detcur.dat');
    assign(detF, 'detfin.dat');
	repeat
        writeln('Ingrese una de las siguientes opciones: ');
        writeln('1. Crear archivos de prueba.');
        writeln('2. Actualizar archivo maestro.');
        writeln('3. Mostrar archivo maestro.');
        writeln('4. Mostrar detalle de cursadas.');
        writeln('5. Mostrar detalle de finales.');
        writeln('6. Salir.');
        readln(opciones);
        
        case opciones of
            '1': begin
                    crearMaestro(mae);
                    crearDetCur(detC);
                    crearDetFin(detF);
                    writeln('Archivos creados.');
                 end;
            '2': actualizarMaestro(mae, detC, detF);
            '3': mostrarMaestro(mae);
            '4': mostrarDetCur(detC);
            '5': mostrarDetFin(detF);
        end;
	until(opciones = '6');
end.
