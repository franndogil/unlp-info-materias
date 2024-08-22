program ejer7;
type
	centro=record
		nombre:string;
		univer:string;
		cantinv:integer;
		cantbec:integer;
	end;
procedure LeerCentro(var c:centro);
begin
	writeln('Ingrese el nombre reducido del centro: ');
	readln(c.nombre);
	writeln('Ingrese la universidad a la que pertenece: ');
	readln(c.univer);
	writeln('Ingrese la cantidad de investigadores: ');
	readln(c.cantinv);
	writeln('Ingrese la cantidad de becados: ');
	readln(c.cantbec);
end;
	
procedure Procesar(var unimay:string; var cen1:string; var cen2:string);
var
	c:centro;
	univeract:string;
	cantinvact, cantcen, men1, men2, auxunimay:integer;
begin
	men1:=9999;
	men2:=9999;
	auxunimay:=0;
	LeerCentro(c);
	while(c.cantinv<>0)do begin
		cantinvact:=0;	//cada vez que cambia la universidad se resetea la cantidad de investigadores
		cantcen:=0;		//cada vez que cambia la universidad se resetea la cantidad de centros
		univeract:=c.univer;	//cada vez que cambia la universidad se resetea la universidad actual
		while(c.univer=univeract)do begin	//corte de control
			cantinvact:=cantinvact+c.cantinv;
			cantcen:=cantcen+1;
			if(c.cantbec<men2)then begin
				if(c.cantbec<men1)then begin
					men2:=men1;
					cen2:=cen1;
					
					men1:=c.cantbec;
					cen1:=c.nombre;
				end
				else begin
					men2:=c.cantbec;
					cen2:=c.nombre;
				end;
			end;
			LeerCentro(c);
		end;
		if(cantinvact>=auxunimay)then
			unimay:=univeract;
		writeln('La cantidad total de centros de la universidad ', univeract, ' es de: ', cantcen);
	end;
end;
var
	unimay:string;
	cen1, cen2:string;
begin
	Procesar(unimay, cen1, cen2);
	writeln('La universidad con mayor cantidad de investigadores en sus centros es: ', unimay);
	writeln('Los dos centros con menor cantidad de becarios son: ',cen1, ' y ', cen2);
end.
