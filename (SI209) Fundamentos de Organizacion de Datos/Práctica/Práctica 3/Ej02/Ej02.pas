{2. Definir un programa que genere un archivo con registros de longitud fija conteniendo 
información de asistentes a un congreso a partir de la información obtenida por 
teclado. Se deberá almacenar la siguiente información: nro de asistente, apellido y 
nombre, email, teléfono y D.N.I. Implementar un procedimiento que, a partir del 
archivo de datos generado, elimine de forma lógica todos los asistentes con nro de 
asistente inferior a 1000.  
Para ello se podrá utilizar algún carácter especial situándolo delante de algún campo 
String a su elección.  Ejemplo:  ‘@Saldaño’.}

//-------------------------------------------------------

program ej02;
type
	asistente = record
		numero : integer;
		apeNom : string;
		email : string;
		telefono : longint;
		dni : longint;
	end;
	
	archivo = file of asistente;
//-------------------------------------------------
procedure leerAsistente(var asi:asistente);
begin
	writeln('Ingrese el numero de asistente: ');
	readln(asi.numero);
	if(asi.numero<>0)then begin
		writeln('Ingrese el apellido y nombre: ');
		readln(asi.apeNom);
		writeln('Ingrese el email: ');
		readln(asi.email);
		writeln('Ingrese el numero de telefono: ');
		readln(asi.telefono);
		writeln('Ingrese el numero de DNI: ');
		readln(asi.dni);
	end;
end;
//-------------------------------------------------
procedure crearArchivo(var arcLogico:archivo);
var
	archivoFisico : string;
	asi:asistente;
begin
	writeln('Ingrese el nombre del archivo a crear: ');
	readln(archivoFisico);
	assign(arcLogico, archivoFisico);
	rewrite(arcLogico);
	leerAsistente(asi);
	while(asi.numero<>0)do begin
		write(arcLogico, asi);
		leerAsistente(asi);
	end;	
	close(arcLogico);	//cerrar archivo
end;

//------------------------------------------------------
procedure eliminarAsistentesLogica(var arcLogico:archivo);
var
	asi:asistente;
	arcFisico:string;
begin
	writeln('Ingrese el nombre del archivo a procesar: ');
	readln(arcFisico);
	assign(arcLogico, arcFisico);
	reset(arcLogico);
	while(not eof(arcLogico))do begin
		read(arcLogico, asi);
		if(asi.numero < 1000)then begin
			asi.apeNom := '@' + asi.apeNom;		//agrego una arroba para marcar el registro
		end;
		seek(arcLogico, filePos(arcLogico)-1);		//me posiciono sobre el registro a marcar
		write(arcLogico, asi);	//escribo y marco el registro
	end;
	close(arcLogico);
end;
//-------------------------------------------------------
procedure listarAsistentes(var arcLogico:archivo);
var
	asi:asistente;
	arcFisico: string;
begin
	writeln('Ingrese el nombre del archivo a listar: ');
	readln(arcFisico);
	assign(arcLogico, arcFisico);
	reset(arcLogico);
	while(not eof(arcLogico))do begin
		read(arcLogico, asi);
		writeln(asi.numero,' ',asi.apeNom,' ',asi.email,' ',asi.telefono,' ',asi.dni);
	end;
	close(arcLogico);
end;

//-------------------------------------------------------

procedure menuAcciones(var arcLogico:archivo);
var
	opciones : char;
begin
	repeat
		writeln('Ingrese alguna de las siguientes opciones: ');
		writeln('1. Crear archivo de asistentes.');
		writeln('2. Eliminar todos los asistentes con nro de asistente inferior a 1000.');
		writeln('3. Listar a todos los asistentes.');
		writeln('4. Salir.');
		readln(opciones);
		
		case opciones of
			'1': crearArchivo(arcLogico);
			'2': eliminarAsistentesLogica(arcLogico);
			'3': listarAsistentes(arcLogico);
		end;
		
	until(opciones='4');
end;

//-------------------------------------------------------

var
	arcLogico:archivo;
begin
	menuAcciones(arcLogico);
end.
