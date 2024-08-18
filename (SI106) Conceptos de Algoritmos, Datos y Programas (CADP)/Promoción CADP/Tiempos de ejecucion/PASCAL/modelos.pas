program uno;
var
    i, temp, aux, x, y, z:integer;
begin
    aux:=0;
    y:=0;
    z:=1;
    repeat
        x:=aux;
        aux:=aux+1;
        y:=aux;
        z:=z+y;
    until (aux>5);

    aux:=aux+1;
end;

program dos;
var
    i, temp, x, y, z,aux:integer;

begin
    aux:=0;
    y:=10;
    while(aux>=0) and (aux<5) do begin
        x:=aux;
        aux:=aux+1;
    end;

    aux:=aux+1;
    z:=y+aux;
end;

program uno;
var
    i, temp, aux, x, y, z:integer;
begin
    aux:=60;
    aux:=aux * 5;
    z:=10;
    y:=6;
    if(aux>45) and (aux<300)then begin
        temp:=aux - 5;
        x:= temp + z + aux + 2 * (y MOD 2);
    end
    else begin
        z:=z + y;
        x:= temp + (aux * z) MOD 2;
    end;
end;

