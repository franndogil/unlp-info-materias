program ejer5;
type
    auto=record
        marca:string;
        modelo:string;
        precio:real;
    end;

procedure Leer(var a:auto);
begin
    writeln('Ingrese la marca: ');
    readln(a.marca);
    writeln('Ingrese el modelo: ');
    readln(a.modelo);
    writeln('Ingrese el precio: ');
    readln(a.precio);
end;

procedure Caro(a:auto; var c:auto);
begin
    if(a.precio>=c.precio)then begin
        c.precio:=a.precio;
        c.modelo:=a.modelo;
        c.marca:=a.marca;
    end;
end;

var
    carro, carrocaro:auto;
    auxmarca:string;
    prom, suma:real;
    cont:integer;

begin
    cont:=0;
    prom:=0;
    suma:=0;
    Leer(carro);
    auxmarca:=carro.marca;
    while(carro.marca<>'zzz')do begin
        if(auxmarca=carro.marca)then begin
            suma:=suma+carro.precio;
            cont:=cont+1;
        end
        else begin
            prom:=suma/cont;
            writeln('El precio promedio de la marca ', auxmarca, ' es de: ', prom);
            auxmarca:=carro.marca;
            cont:=0;
            suma:=0;
        end;
        Caro(carro, carrocaro);
        Leer(carro);
    end;
    writeln('Marca, modelo y precio del auto mas caro: ');
    writeln('Marca: ',carrocaro.marca);
    writeln('Modelo: ',carrocaro.modelo);
    writeln('Precio: ',carrocaro.precio);
end.