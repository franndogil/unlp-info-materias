{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto se lee
 código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
 ● Loscódigosdelos dos productos más baratos.
 ● Lacantidaddeproductos de más de 16 pesos con código par.}
 
program ejer6;
var
    i, cod, cod1, cod2, cantpar:integer;
    pre, pre1, pre2:real;
begin
    i:=0;
    cod:=0;
    cod1:=0;
    cod2:=0;
    cantpar:=0;             //initializacion de variables
    pre:=0;
    pre1:=10000;
    pre2:=10000;
    
    for i:=1 to 3 do begin
        writeln('Ingrese el codigo: ');
        readln(cod);
        writeln('Ingrese el precio: ');
        readln(pre);
        if(pre<pre2)then begin
            if(pre<pre1)then begin
                pre2:=pre1;
                cod2:=cod1;
                pre1:=pre;
                cod1:=cod;
            end
            else begin
                pre2:=pre;
                cod2:=cod;
            end;
        end;
        if((pre>16)and((cod MOD 2)=0))then
            cantpar:=cantpar+1;
    end;
        
    writeln('Los codigos de los dos productos mas baratos son: ', cod1, ' y ', cod2);
    writeln('La cantidad de productos de mas de 16 pesos con codigo par es de: ', cantpar);
end.        