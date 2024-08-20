program ejer4;
const
    max_clientes=9300;
type
    linea=record
        numero:integer;
        minutos:integer;
        mb:integer;
    end;
    
    cliente=record
        codigo:integer;
        cantlineas:integer;
    end;
    
procedure LectLinea(var l:linea);
begin
    writeln('Ingrese el numero: ');
    readln(l.numero);
    writeln('Ingrese los minutos: ');
    readln(l.minutos);
    writeln('Ingrese los mb: ');
    readln(l.mb);
end;

procedure LectCli(var c:cliente; var mbf:integer; var minf:integer);
var
    i, aux:integer;
    l:linea;
begin
    writeln('Ingrese el codigo de cliente: ');
    readln(c.codigo);
    writeln('Ingrese la cantidad de lineas: ');
    readln(c.cantlineas);
    i:=0;
    aux:=0;
    mbf:=0;
    minf:=0;
    aux:=c.cantlineas;
    for i:=1 to aux do begin
        LectLinea(l);
        mbf:=mbf+l.mb;
        minf:=minf+l.minutos;
    end;
end;

var
    clien:cliente;
    i:integer;
    MegasF, MinutosF:integer;
begin
    i:=0;
    for i:=1 to 9300 do begin
        LectCli(clien, MegasF, MinutosF);
        writeln('Megas a facturar: ',MegasF);
        writeln('Minutos a facturar: ',MinutosF);
    end;
end.