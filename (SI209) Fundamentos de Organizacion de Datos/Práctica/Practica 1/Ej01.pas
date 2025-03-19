{1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita 
incorporar datos al archivo. Los números son ingresados desde teclado. La carga finaliza 
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del 
archivo debe ser proporcionado por el usuario desde teclado.}

program ej01;
type
	archivo=file of integer;
var
	arc_logico:archivo;
	nro:integer;
	arc_fisico:string[12];
begin
	writeln('Nombre del archivo: ');
	readln(arc_fisico);
	assign(arc_logico, arc_fisico + '.dat');		//asignas el nombre al archivo
	rewrite(arc_logico);	//creas el archivo
	read(nro);
	while(nro<>30000)do begin
		write(arc_logico, nro);		// cargas el archivo
		read(nro);
	end;
	
	close(arc_logico);	//cerras y ponen el EOF
end.
