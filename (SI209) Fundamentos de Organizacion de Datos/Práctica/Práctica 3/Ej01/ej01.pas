{1. Modificar el ejercicio 4 de la práctica 1 (programa de gestión de empleados), 
agregándole una opción para realizar bajas copiando el último registro del archivo en 
la posición del registro a borrar y luego truncando el archivo en la posición del último 
registro de forma tal de evitar duplicados. }

program ej01;
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
procedure agregarUnEmpleado(var arcLogico:archivo);
var
	emp:empleado;
begin
	reset(arcLogico);
	writeln('Ingrese los datos del nuevo empleado: ');
	leerEmpleado(emp);
	seek(arcLogico, fileSize(arcLogico));	
	write(arcLogico, emp);
	close(arcLogico);
end;
//------------------------------------------------------
procedure modificarEdad(var arcLogico:archivo);
var
	numEmp:integer;
	emp:empleado;
begin
	reset(arcLogico);
	writeln('Ingrese el numero de empleado a modificar edad: ');
	readln(numEmp);
	read(arcLogico, emp);
	while(not eof(arcLogico) and (numEmp<>emp.numEmp))do begin
		read(arcLogico, emp);
	end;
	if(emp.numEmp = numEmp)then begin
		writeln('El empleado existe en el archivo, ingrese la edad: ');
		read(emp.edad);
		seek(arcLogico, filepos(arcLogico)-1);
		write(arcLogico, emp);
	end;
	close(arcLogico);
end;
//------------------------------------------------------
procedure exportToText(var arcLogico:archivo);
var
	arcTexto: text;		//gracias juampi
	emp: empleado;
begin
	reset(arcLogico);
	assign(arcTexto, 'todos_empleados.txt');
	rewrite(arcTexto);	//creo el archivo de texto
	while(not eof(arcLogico))do begin
		read(arcLogico, emp);
		writeln(arcTexto, emp.numEmp,' ',emp.apellido,' ',emp.nombre,' ',emp.edad,' ',emp.dni);
	end;
	close(arcTexto);
	close(arcLogico);
end;
//------------------------------------------------------
procedure exportToTextDni(var arcLogico:archivo);
var
	arcTexto: text;
	emp: empleado;
begin
	reset(arcLogico);
	assign(arcTexto, 'faltaDNIEmpleado.txt');
	rewrite(arcTexto);	//creo el archivo de texto
	while(not eof(arcLogico))do begin
		read(arcLogico, emp);
		if(emp.dni = 00)then begin
			writeln(arcTexto, emp.numEmp,' ',emp.apellido,' ',emp.nombre,' ',emp.edad,' ',emp.dni);
		end;
	end;
	close(arcLogico);
	close(arcTexto)
end;
//------------------------------------------------------------------
procedure eliminarEmpleado(var arcLogico:archivo);
var
	emp, ultEmp:empleado;
	eliEmp:string;
begin
	writeln('Ingrese el nombre del empleado a eliminar: ');
	readln(eliEmp);
	reset(arcLogico);
	//primero debo obtener el ultimo elemento del archivo para poder ubicarlo
	seek(arcLogico, fileSize(arcLogico)-1);	
	read(arcLogico, ultEmp);	//guardo el ultimo empleado 
	//comienza la busqueda del registro a borrar
	seek(arcLogico, 0);		//posiciono el puntero al principio del archivo y comienzo a recorrerlo
	read(arcLogico, emp);
	while (not eof(arcLogico))and(emp.nombre <> eliEmp)do
		read(arcLogico, emp);
	if(emp.nombre = eliEmp) then begin
		seek(arcLogico, filePos(arcLogico)-1);	//me posiciono sobre el registro a eliminar
		write(arcLogico, ultEmp);	//escribo el ultimo registro en la posicion del registro a eliminar
		//falta truncar el archivo
		seek(arcLogico, fileSize(arcLogico)-1);	//me posiciono sobre el ultimo elemento y trunco
        truncate(arcLogico);
        writeln('Se encontro el empleado y fue eliminado correctamente.');
	end
	else
		writeln('No se encontro el empleado :(');
	close(arcLogico);	//cierro el archivo
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
	writeln('4. Agregar un empleado.');
	writeln('5. Modificar edad de un empleado.');
	writeln('6. Exportar el archivo a texto.');
	writeln('7. Exportar los empleados que no tengan el DNI cargado.');
	writeln('8. Eliminar un epleado.');

	readln(opciones);
	
	case opciones of
		1: listarDeterminado(arcLogico);
		2: listarTodos(arcLogico);
		3: listarMayoresSetenta(arcLogico);
		4: agregarUnEmpleado(arcLogico);
		5: modificarEdad(arcLogico);
		6: exportToText(arcLogico);
		7: exportToTextDni(arcLogico);
		8: eliminarEmpleado(arcLogico);
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

//------------------------------------------------------------------

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
