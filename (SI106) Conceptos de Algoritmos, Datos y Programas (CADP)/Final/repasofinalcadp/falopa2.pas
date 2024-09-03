program ejer1;
const
	max_fact=2000;
type
	rango_fact=1..max_fact;
	
	factura=record
		num:integer;
		codc:integer;
		cods:integer;
		monto:real;
	end;
	
	vec_facturas=array[rango_fact]of factura;

procedure Procesar(v:vec_facturas; dimL:integer; var cod:integer);
var
	cant, i, codsact, maycant:integer;
begin
	i:=0;
	maycant:=0;
	while(i<=dimL)do begin
		i:=i+1;
		codsact:=v[i].cods;
		cant:=0;
		while(i<=dimL)and(codsact=v[i].cods)do begin
			cant:=cant+1;
			i:=i+1;
		end;
		if(cant>=maycant)then begin
			maycant:=cant;
			cod:=codsact;
		end;
	end;
end;

var
	dimL:integer;
	facturas:vec_facturas;
	codsm:integer;
begin
	dimL:=0;
	{Cargar_facturas(facturas, dimL);	//se dispone}
	Procesar(facturas, dimL, codsm);
	writeln(codsm);
end.
