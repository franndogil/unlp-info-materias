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
	assign(arc_logico, arc_fisico);
	rewrite(arc_logico);
	read(nro);
	while(nro<>30000)do begin
		write(arc_logico, nro);
		read(nro);
	end;
	close(arc_logico);
end.
