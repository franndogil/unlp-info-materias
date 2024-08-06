program Ejercicio3;
 procedure suma(num1: integer; num2:integer);
 begin
 num2 := num1 + num2;
 num1 := 0;
 end;
 var
 i, x : integer;
 begin
 read(x); { leo la variable x }
 for i:= 1 to 5 do
 suma(i,x);         //10+1=11       11+2=13     13+3=16         16+4=20     20+5=25    
 write(x); { imprimo las variable x }
 end.