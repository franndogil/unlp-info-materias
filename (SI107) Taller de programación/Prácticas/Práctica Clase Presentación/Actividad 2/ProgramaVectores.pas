program ProgramaVectores;
const
	maxvalores=50;
type
	rangovalores=1..maxvalores;
	vectorint=array[rangovalores] of integer;

procedure CargarVector(var v:vectorint; a:integer; b:integer);
var
	i:integer;
begin
	randomize;
	i:=0;
	for i:=1 to maxvalores do begin
		v[i]:=random(b-a+1)+a;
	end;
end;

procedure ImprimirVector(v:vectorint);
var
	i:integer;
begin
	i:=0;
	for i:=1 to maxvalores do 
		writeln(v[i]);
end;

var
	v:vectorint;
	a, b: integer;

begin
	writeln('Ingrese el rango: ');
	writeln('Minimo: ');
	readln(a);
	writeln('Maximo: ');
	readln(b);
	CargarVector(v, a, b);
	ImprimirVector(v);
end.
