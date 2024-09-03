program ejer1;
const
	max_elem=100;
	max_char=26;
type
	rango_elem=1..max_elem;
	rango_char=1..max_char;
	
	vec_elem=array[rango_elem]of char;
	vec_char=array[rango_char]of integer;

procedure InicializarVector(var v:vec_char);
var
	i:integer;
begin
	for i:=1 to 26 do begin
		v[i]:=0;
	end;
end;

procedure Generacion(ve:vec_elem; var vc:vec_char; dimLog:integer);
var
	char_act:char;
	i, j:integer;
begin
	i:=1;
	j:=1;
	while(i<dimLog)do begin
		char_act:=ve[i];
		while(char_act=ve[i])do begin
			vc[j]:=vc[j]+1;
			i:=i+1;
		end;
		j:=j+1;
	end;
end;

procedure CargarVector(var ve:vec_elem; var dimLog:integer);
var
	i:integer;
begin
	for i:=1 to 35 do begin
		ve[i]:='a';
	end;
	for i:=36 to max_elem do begin
		ve[i]:='b';
	end;
	dimLog:=max_elem;
end;

procedure ImprimirVector(vc:vec_char);
var
	i:integer;
begin
	for i:=1 to 26 do
		writeln(vc[i]);
end;

var
	v1:vec_elem;
	v2:vec_char;
	dimL:integer;
begin
	dimL:=0;
	CargarVector(v1, dimL);		//se dispone
	InicializarVector(v2);
	Generacion(v1, v2, dimL);
	ImprimirVector(v2);
end.
