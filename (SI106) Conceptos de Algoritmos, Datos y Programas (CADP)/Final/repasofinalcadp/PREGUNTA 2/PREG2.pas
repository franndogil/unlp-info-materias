program pregunta2;
procedure calcular(var total: longInt;var dig3: longInt;var dig1: LongInt; dig2: LongInt);
begin
  total := dig1 + (dig2 mod 3);
  dig3 := dig3 + (total div 2);
end;
var
    dni,dig1,dig2,dig3, total : longInt;
begin
  ReadLn(dni);
  dig1 := dni mod 10;
  dig2 := dni mod 100;
  dig3 := dni mod 1000;
  total := 0;
  calcular(total,dig1,dig2,dig3);
  writeln('Total = ',total);
  writeln('dig1 = ',dig1);
  writeln('dig2 = ',dig2);
  writeln('dig3 = ',dig3);
end.


program preg4;
const
	dimF1=100;
	dimF2=50;
type
	long1=1..dimF1;
	long2=1..dimF2;
	vecint1=array[long1]of integer;
	vecint2=array[long2]of integer;
	
procedure Vectores(v1:vecint1; var v2:vecint2);
var
	i, j:integer;
begin
	i:=0;
	j:=1;
	for i:=1 to dimF2 do begin
		v2[i]:=v1[j];
		j:=j+2;
	end;
end:
