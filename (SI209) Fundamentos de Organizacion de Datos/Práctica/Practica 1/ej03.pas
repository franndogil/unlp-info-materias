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
		num_emp:integer;
		apellido:string;
		nombre:string;
		edad:integer;
		dni:longint;
	end;
	
	archivo = file of empleado;

procedure leerEmpleado(var emp:empleado);
begin
	writeln('Ingrese el numero de empleado: ');
	readln(emp.num_emp);
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

var
	arc_logico:archivo;
	arc_fisico:string[12];
	emp:empleado;
	op, op2, i, cant_emp:integer;
	apeonom:string;
begin
	cant_emp:=0;
	repeat
		writeln('Ingrese una opcion: ');
		writeln('1. Crear un archivo');
		writeln('2. Procesar un archivo');
		writeln('3. Salir');
		readln(op);
		
		if(op=1)then begin
			writeln('Nombre del archivo: ');
			readln(arc_fisico);
			assign(arc_logico, arc_fisico + '.dat');		//asignas el nombre al archivo
			rewrite(arc_logico);		//creamos el archivo
			leerEmpleado(emp);	
			while (emp.apellido <> 'fin')do begin
				write(arc_logico, emp);
				leerEmpleado(emp);
			end;
			close(arc_logico);
		end
		else begin
			if(op=2)then begin
				writeln('Ingrese el nombre del archivo a abrir: ');
				readln(arc_fisico);
				assign(arc_logico, arc_fisico + '.dat');
				reset(arc_logico);
				cant_emp:=fileSize(arc_logico);
				
				writeln('Ingrese una opcion: ');
				writeln('1. Listar en pantalla los datos de empleados con nombre o apellido determinado.');
				writeln('2. Listar en pantalla a todos los empleados.');
				writeln('3. Listar en pantalla los empleados mayores a 70 años.');
				readln(op2);
				
				if(op2=1)then begin
					writeln('Ingrese el nombre o apellido a buscar: ');
					readln(apeonom);
					for i:=1 to cant_emp do begin
						read(arc_logico, emp);
						if(emp.apellido=apeonom)or(emp.nombre=apeonom)then
							writeln('Codigo de empleado: ',emp.num_emp,' Apellido: ',emp.apellido, ' Nombre: ',emp.nombre, ' Edad: ', emp.edad, ' DNI: ', emp.dni);
					end;
					close(arc_logico);
				end
				else begin
					if(op2=2)then begin
						for i:=1 to cant_emp do begin
							read(arc_logico, emp);
							writeln('Codigo de empleado: ',emp.num_emp,' Apellido: ',emp.apellido, ' Nombre: ',emp.nombre, ' Edad: ', emp.edad, ' DNI: ', emp.dni);
						end;
						close(arc_logico);
					end
					else begin
						if(op2=3)then begin
							for i:=1 to cant_emp do begin
								read(arc_logico, emp);
								if(emp.edad>70)then
									writeln('Codigo de empleado: ',emp.num_emp,' Apellido: ',emp.apellido, ' Nombre: ',emp.nombre, ' Edad: ', emp.edad, ' DNI: ', emp.dni);
								close(arc_logico);
							end;
						end;
					end;
				end;
			end;
		end;
	until(op = 3);
end.
