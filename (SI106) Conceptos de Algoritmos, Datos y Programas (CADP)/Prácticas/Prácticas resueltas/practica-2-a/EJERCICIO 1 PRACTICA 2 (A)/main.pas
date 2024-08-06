 program alcance1;
 var a,b: integer;
 
 procedure uno;
 var 
    b: integer;
 begin
     b := 3;    //b toma el valor de 3
     writeln(b);    //se imprime 3
 end;
 begin
     a:= 1; //a toma el valor de 1
     b:= 2; //b toma el valor de 2
     uno;   //b toma el valor de 3 e imprime 3
     writeln(b, a); //imprime 2 y luego 1
 end.