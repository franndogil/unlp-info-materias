{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número
 X, se escribe |X| y se define como:
 |X| = Xcuando Xesmayoroigual a cero
 |X| =-X cuando X es menor acero}

program ejer2;
var
    num1:real;
begin
    readln(num1);
    if(num1<0)then
        num1:=num1*-1
    else
        num1:=num1;
    
    writeln(num1);
end.
