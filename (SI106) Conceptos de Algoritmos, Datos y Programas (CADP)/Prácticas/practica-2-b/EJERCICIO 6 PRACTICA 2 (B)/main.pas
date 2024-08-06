{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio}

program ejer6;
procedure barato(p:real; c:integer; var p1:real; var p2:real; var c1:integer; var c2:integer);
begin
    if(p<p2)then begin
        if(p<p1)then begin
            p2:=p1;
            c2:=c1;
            p1:=p;
            c1:=c;
        end
        else begin
            p2:=p;
            c2:=c;
        end;
    end;
end;

procedure caro(p:real; c:integer; var p1:real; var c1:integer);
begin
    if(p>p1)then begin
        p1:=p;
        c1:=c;
    end;
end;

procedure promedio(p:real; var s:real);
begin
    s:=s+p;
end;

var
    precio, preciob1, preciob2, precioc, suma, prom:real;
    tipo:string;
    codigo, codigob1, codigob2, codigoc, i:integer;
    
begin
    precio:=0; preciob1:=10000; preciob2:=10000; precioc:=0; suma:=0;
    i:=0; codigo:=0; codigob1:=0; codigob2:=0; codigoc:=0;
    for i:=1 to 100 do begin
        readln(codigo);
        readln(precio);
        readln(tipo);
        barato(precio, codigo, preciob1, preciob2,codigob1, codigob2);
        if(tipo='pantalon')then
            caro(precio, codigo, precioc, codigoc);
        promedio(precio, suma);
    end;
    prom:=suma/100;
    writeln('Codigo de los dos productos mas baratos: ', codigob1,' y ',codigob2);
    writeln('Codigo del pantalon mas caro: ',codigoc);
    writeln('Precio promedi0: ', prom);
end.








