program alcance3;
var 
    a: integer;
procedure uno;
var 
    b: integer;
begin
    b:= 2;
    writeln(b);
end;
begin
    a:= 1;
    uno;
    writeln(a, b);
end.
 
//el programa principal no reconoce la variable b ya que esta declarada como
//variable local y no como variable global