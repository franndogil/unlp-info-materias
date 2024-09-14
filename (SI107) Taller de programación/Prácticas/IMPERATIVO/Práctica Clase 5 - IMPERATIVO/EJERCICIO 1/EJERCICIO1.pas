{1. El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}

program ejercicio1;
const
	dimF=300;
type
	oficina=record
		codi:integer;
		dni:integer;
		vale:real;
	end;
	
	vector=array[1..dimF] of oficina;

procedure Generar_oficina(var o:oficina);
begin
	writeln('Ingrese codigo de identificacion: ');
	read(o.codi);
	o.dni:=random(1000);
	o.vale:=random(200);
end;

procedure Generar_vector(var v:vector; var dimLog:integer);
var
	o:oficina;
begin
	Generar_oficina(o);
	while(o.codi<>0)and(dimLog<300)do begin
		dimLog:=dimLog+1;
		v[dimLog]:=o;
		Generar_oficina(o);
	end;
end;

procedure Imprimir_vector(v:vector; dimLog:integer);		//PUNTO A
var
	i:integer;
begin
	for i:=1 to dimLog do begin
		writeln('------------------------------');
		writeln('Codigo de identificacion: ', v[i].codi);
		writeln('DNI: ', v[i].dni);
		writeln('Valor de la expensa: ', v[i].vale:2:2);
	end;
end;

procedure Ordenamiento_de_vector(var v:vector; dimLog:integer);		//PUNTO B	(POR SELECCIÓN)  APRENDER BIEN
var 
	i, j, pos:integer; 
	item:oficina;		
begin
 for i:=1 to (dimLog-1) do begin {busca el mínimo y guarda en pos la posición}
          pos:=i;
          for j:=i+1 to dimLog do
             if (v[j].codi<v[pos].codi)then 
				pos:=j;

         {intercambia v[i] y v[p]}
         item:=v[pos];   
         v[pos]:=v[i];   
         v[i]:=item;
      end;
end;

procedure Busqueda_dicotomica(v:vector; cod:integer; dimLog:integer; var res:integer);		//PUNTO C
var
	i, mitad:integer;
begin
	mitad:=dimLog mod 2;
	if(cod >= mitad)then begin
		for i:=mitad to dimLog do begin
			if(v[i].codi=cod)then
				res:=i;
		end;
	end
	else begin
		for i:=1 to mitad-1 do begin
			if(v[i].codi=cod)then
				res:=i;
		end;
	end;
end;

procedure Monto_total_expensas(v:vector; dimLog:integer; posact:integer; var monto:real);	//PUNTO D
begin
	posact:=posact+1;
	monto:=monto+v[posact].vale;
	if(posact<dimLog)then
		Monto_total_expensas(v, dimLog, posact, monto);
end;

var
	v:vector;
	i, dimL, cod, res:integer;
	monto:real;
begin
	randomize;
	dimL:=0;
	res:=0;
	cod:=0;
	monto:=0;
	i:=0;
	
	Generar_vector(v, dimL);
	writeln('---------------IMPRESION DEL VECTOR---------------');		//PUNTO A
	Imprimir_vector(v, dimL);
	
	Ordenamiento_de_vector(v, dimL);
	writeln('---------------IMPRESION DEL VECTOR ORDENADO---------------');		//PUNTO B
	Imprimir_vector(v, dimL);
	
	writeln('---------------BUSQUEDA DICOTOMICA---------------');		//PUNTO C
	writeln('Ingrese el codigo a buscar: ');
	read(cod);
	Busqueda_dicotomica(v, cod, dimL, res);
	writeln('Respuesta: ', res);
	
	Monto_total_expensas(v, dimL, i, monto);							//PUNTO D
	writeln('El monto total de las expensas fue de: ', monto:2:2);
end.
