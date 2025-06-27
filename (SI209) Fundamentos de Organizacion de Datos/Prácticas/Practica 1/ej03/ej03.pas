{3. Realizar un programa que presente un menú con opciones para: 
a. Crear un archivo de registros no ordenados de empleados y completarlo con 
datos ingresados desde teclado. De cada empleado se registra: número de 
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con 
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido. 
b. Abrir el archivo anteriormente generado y 
i. 
Listar en pantalla los datos de empleados que tengan un nombre o apellido 
determinado, el cual se proporciona desde el teclado. 
ii. 
Listar en pantalla los empleados de a uno por línea.  
iii. 
Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse. 
NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario. }

program ej03;
type
	empleado = record
		numEmp:integer;
		apellido:string;
		nombre:string;
		edad:integer;
		dni:longint;
	end;
	
	archivo = file of empleado;
	
//-------------------------------------------------
procedure leerEmpleado(var emp:empleado);
begin
	writeln('Ingrese el numero de empleado: ');
	readln(emp.numEmp);
	writeln('Ingrese el apellido: ');
	readln(emp.apellido);
	if(emp.apellido<>'fin')then begin
		writeln('Ingrese el nombre: ');
		readln(emp.nombre);
		writeln('Ingrese la edad: ');
		readln(emp.edad);
		writeln('Ingrese el DNI: ');
		readln(emp.dni);
	end;
end;
//------------------------------------------------------
procedure listarDeterminado(var arcLogico:archivo);
var
	emp:empleado;
	apeNomDet:string;
begin
	writeln('Ingrese el nombre o el apellido a buscar: ');
	readln(apeNomDet);
	reset(arcLogico);
	read(arcLogico, emp);
	while(not eof(arcLogico))do begin
		read(arcLogico, emp);
		if(emp.apellido = apeNomDet)then begin
			writeln('Numero: ', emp.numEmp, ' Apellido: ', emp.apellido, ' Nombre: ', emp.nombre, ' Edad: ', emp.edad, ' DNI: ', emp.dni);
		end;
		if(emp.nombre = apeNomDet)then begin
			writeln('Numero: ', emp.numEmp, ' Apellido: ', emp.apellido, ' Nombre: ', emp.nombre, ' Edad: ', emp.edad, ' DNI: ', emp.dni);
		end;
	end;
	close(arcLogico);
end;
//------------------------------------------------------
procedure listarTodos(var arcLogico:archivo);
var
	emp:empleado;
begin
	reset(arcLogico);
	while(not eof(arcLogico))do begin
		read(arcLogico, emp);
		writeln('Numero: ', emp.numEmp, ' Apellido: ', emp.apellido, ' Nombre: ', emp.nombre, ' Edad: ', emp.edad, ' DNI: ', emp.dni);
	end;
	close(arcLogico);
end;
//------------------------------------------------------
procedure listarMayoresSetenta(var arcLogico:archivo);
var
	emp:empleado;
begin
	reset(arcLogico);
	while(not eof(arcLogico))do begin
		read(arcLogico, emp);
		if(emp.edad > 70)then
			writeln('Numero: ', emp.numEmp, ' Apellido: ', emp.apellido, ' Nombre: ', emp.nombre, ' Edad: ', emp.edad, ' DNI: ', emp.dni);
	end;
	close(arcLogico);
end;
//------------------------------------------------------
procedure menuAccionesDos(var arcLogico:archivo);
var
	opciones:integer;
begin
	writeln('Ingrese alguna de las siguientes opciones: ');
	writeln('1. Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado.');
	writeln('2. Listar en pantalla los empleados de a uno por línea.');
	writeln('3. Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse.');
	readln(opciones);
	
	case opciones of
		1: listarDeterminado(arcLogico);
		2: listarTodos(arcLogico);
		3: listarMayoresSetenta(arcLogico);
	end;
end;
//------------------------------------------------------
procedure crearArchivoNuevo(var arcLogico:archivo);
var
	arcFisico:string;
	emp:empleado;
begin
	writeln('Ingrese el nombre del archivo a crear: ');
	readln(arcFisico);
	assign(arcLogico, arcFisico + '.dat');
	rewrite(arcLogico);
	leerEmpleado(emp);
	while(emp.apellido <> 'fin')do begin
		write(arcLogico, emp);
		leerEmpleado(emp);
	end;
	Close(arcLogico);
end;
//-----------------------------------------------------------
procedure procesarArchivo(var arcLogico:archivo);
var
	arcFisico:string;
begin
	writeln('Ingrese el nombre del archivo a procesar: ');
	readln(arcFisico);
	assign(arcLogico, arcFisico + '.dat');
	menuAccionesDos(arcLogico);
end;

procedure menuAcciones(var arcLogico:archivo);
var
	opciones:integer;
begin
	repeat
		writeln('Ingrese una opcion: ');
		writeln('1. Crear un archivo');
		writeln('2. Procesar un archivo');
		writeln('3. Salir');
		readln(opciones);
	
		case opciones of
			1: crearArchivoNuevo(arcLogico);
			2: procesarArchivo(arcLogico);
		end;
	until(opciones=3);
end;

var
	arcLogico:archivo;
begin
	menuAcciones(arcLogico);
end.
