{1. Una empresa posee un archivo con información de los ingresos percibidos por diferentes 
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado, 
nombre y monto de la comisión. La información del archivo se encuentra ordenada por 
código de empleado y cada empleado puede aparecer más de una vez en el archivo de 
comisiones.  
Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En 
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una 
única vez con el valor total de sus comisiones. 
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser 
recorrido una única vez. }

program ej01;
type
	empleado = record
		codigo:integer;
		nombre:string;
		monto:real;
	end;
	
	archivo = file of empleado;
//------------------------------------------------------------	
procedure leerEmpleado(var emp:empleado);
begin
	writeln('Ingrese el codigo de empleado: ');
	readln(emp.codigo);
	if(emp.codigo<>0)then begin
		writeln('Ingrese el nombre: ');
		readln(emp.nombre);
		writeln('Ingrese el monto: ');
		readln(emp.monto);
	end;
end;
//------------------------------------------------------------
procedure crearArchivo(var arcCompleto:archivo);
var
	emp:empleado;
	nombreArchivo:string;
begin
	writeln('Ingrese el nombre del archivo a crear: ');
	readln(nombreArchivo);
	assign(arcCompleto, nombreArchivo);
	rewrite(arcCompleto);
	
	leerEmpleado(emp);
	while(emp.codigo<>0)do begin
		write(arcCompleto, emp);
		leerEmpleado(emp);
	end;
	close(arcCompleto);
end;
	
//------------------------------------------------------------					VOY A TENER QUE HACER UN CORTE DE CONTROL CON EL CODIGO DE EMPLEADO
procedure compactarArchivo(var arcCompleto:archivo; var arcCompacto:archivo);
var
	nombreArcCompleto:string;
	emp, empAux:empleado;
	codEmpAct:integer;
	montoEmpAct:real;
	nomEmpAct:string;
begin
	writeln('Ingrese el nombre del archivo a compactar: ');
	readln(nombreArcCompleto);
	assign(arcCompleto, nombreArcCompleto);
	reset(arcCompleto);
	assign(arcCompacto, nombreArcCompleto + 'COM');
	rewrite(arcCompacto);
	while(not eof(arcCompleto))do begin		//mientras no sea el fin del archivo completo
		read(arcCompleto, emp);
		codEmpAct:=emp.codigo;
		nomEmpAct:=emp.nombre;
		montoEmpAct:=0;
		while(not eof(arcCompleto))and(codEmpAct = emp.codigo)do begin		//CORTE DE CONTROL (mientras no sea el fin del archivo completo y el codigo sea igual al codigo actual leido)
			read(arcCompleto, emp);
			if emp.codigo = codEmpAct then 
				montoEmpAct := montoEmpAct + emp.monto; // acumulamos montos
		end;

		empAux.monto:=montoEmpAct;
		empAux.nombre:=nomEmpAct;
		empAux.codigo:=codEmpAct;

		write(arcCompacto, empAux);		//escribo en el archivo compacto el empleado con la suma de todos sus montos
		
	end;
	close(arcCompleto);
	close(arcCompacto);
	writeln('Archivo compactado correctamente');
end;
//------------------------------------------------------------
procedure exportToText(var arc:archivo; var arcText:Text);
var
	nombreArchivo:string;
	emp:empleado;
begin
	writeln('Ingrese el nombre del archivo a exportar: ');
	readln(nombreArchivo);
	assign(arc, nombreArchivo);
	reset(arc);
	
	assign(arcText, nombreArchivo + '.txt');
	rewrite(arcText);
	
	while(not eof(arc))do begin
		read(arc, emp);
		writeln(arcText, emp.codigo, ' ', emp.nombre, ' ', emp.monto);
	end;
	
	close(arc);
	close(arcText);
end;
//------------------------------------------------------------

var
	arcCompleto:archivo;
	arcCompacto:archivo;
	arcText: Text;
	opciones:char;
begin
	repeat
		writeln('Ingrese una de las siguientes opciones:');
		writeln('1. Crear un archivo.');
		writeln('2. Compactar un archivo.');
		writeln('3. Exportar a texto un archivo.');
		writeln('4. Salir');
		readln(opciones);
		case opciones of
			'1': crearArchivo(arcCompleto);
			'2': compactarArchivo(arcCompleto, arcCompacto);
			'3': exportToText(arcCompacto, arcText);
		end;
	until (opciones = '4');
end.
