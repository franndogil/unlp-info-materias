{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se ingrese
 uno cuyo valor sea exactamente el doble de X (el primer número leído).}

program ejer4;

var
    n1:real;
    doble:real;
begin
    n1:=0;
    doble:=0;
    read(n1);
    doble:=n1*2;
    while(n1<>doble)do begin
        read(n1);
    end;
end.
