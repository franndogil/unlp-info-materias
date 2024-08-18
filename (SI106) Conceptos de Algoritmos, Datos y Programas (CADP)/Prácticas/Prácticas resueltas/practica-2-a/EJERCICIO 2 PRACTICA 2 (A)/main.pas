program alcance2;
 var a,b: integer;
 procedure uno;
 begin
     b := 3;
     writeln(b);
 end;
 begin
     a:= 1;
     b:= 2;
     uno;   //imprime 3
     writeln(b, a); //imprime 3 y 1
 end.
 
 //el ultimo write imprime 3 proque el programa usa variables globales
 