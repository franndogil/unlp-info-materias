{ Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén.
 La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse. Para cada producto
 leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.
     Por ejemplo:
 ○ Siseingresa el código 10382, con precio actual 40 y nuevo precio 44, deberá imprimir:
 El aumento de precio del producto 10382 no supera el 10%
 ○ Siseingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir:
 El aumento de precio del producto 32767 es superior al 10%”
}

program ejer7;
var
    cod:integer;
    pact, pnew, aumento:real;
begin
    cod:=0;
    pact:=0;
    pnew:=0;
    aumento:=0;
    write('Ingrese un numero del producto:');
    read(cod);
    while(cod<>32767)do begin
        write('Ingrese el precio actual:');
        read(pact);
        write('Ingrese el precio actual:');
        read(pnew);
        aumento:=pact*1.10;
        if(pnew>=aumento)then
            writeln('El aumento de precio del producto ',cod,' es superior al 10%' )
        else
            writeln('El aumento de precio del producto ', cod,' no supera el 10%');
        write('Ingrese un nuevo numero de producto:');
        read(cod);
    end;
    write('Ingrese el precio actual:');
    read(pact);
    write('Ingrese el precio actual:');
    read(pnew);
    aumento:=pact*1.10;
    if(pnew>=aumento)then
            writeln('El aumento de precio del producto ',cod,' es superior al 10%')
        else
            writeln('El aumento de precio del producto ', cod,' no supera el 10%');
end.
    
    
    
    
    
    
    