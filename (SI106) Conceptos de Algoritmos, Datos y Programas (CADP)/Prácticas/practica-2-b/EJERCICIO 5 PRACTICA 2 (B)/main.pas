{ 5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de
 numA.
 b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
 números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad
 de pares en las que numB es el doble de numA.
 Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los
 valores 4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}
 
program ejer5;
function doble(numA, numB:integer):boolean;
var
    ok:boolean;
    condicion:integer;
begin
    condicion:=numA*2;
    if(numB=condicion)then
        ok:=true
    else
        ok:=false;
    doble:=ok;
end;

var
    a, b:integer;
    cantL, cantD:integer;
begin
    cantD:=0;
    cantL:=0;
    a:=0;
    b:=0;
    writeln('Ingrese el numA:');
    readln(a);
    writeln('Ingrese el numB:');
    readln(b);
    while((a<>0)and(b<>0))do begin
        cantL:=cantL+1;
        if(doble(a, b))then         //si es verdadero o si se cumple
            cantD:=cantD+1;
        writeln('Ingrese el numA:');
        readln(a);
        writeln('Ingrese el numB:');
        readln(b);
    end;
    writeln('Cantidad de pares leidos: ', cantL);
    writeln('Cantidad de pares en las que numB es el doble de numA: ', cantD);
end.
    
    
    
    
    
    
    
    
    
    