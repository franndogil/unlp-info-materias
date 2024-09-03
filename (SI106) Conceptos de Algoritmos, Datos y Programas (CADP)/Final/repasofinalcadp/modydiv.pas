program ejer1;

function es_par(dni:integer):boolean;
var
	dig, suma:integer;
	ok:boolean;
begin
	dig:=0;
	suma:=0;
	while(dni<>0)do begin
		dig:=dni mod 10;
		suma:=suma+dig;
		dni:=dni div 10;
	end;
	
	if(suma mod 2=0)then
		ok:=true
	else
		ok:=false;
	
	es_par:=ok;
end;

var
	dni:integer;
begin
	write('Ingrese el DNI: ');
	read(dni);
	
	if(es_par(dni))then
		writeln('Es PAR')
	else
		writeln('Es IMPAR');
end.
