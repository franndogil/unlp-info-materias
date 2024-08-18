{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los dos
 números es el mayor. Si son iguales debe informar en pantalla lo siguiente:
 Los números leídos son iguales}

program ejer1;
var
    num1, num2:integer;
begin
    readln(num1);
    readln(num2);
    
    if(num1>num2)then
        writeln('El numero ', num1, ' es mayor al numero ', num2);
    if(num2>num1)then
        writeln('El numero ', num2, ' es mayor al numero ', num1);
    if(num1=num2)then
        writeln('Los numeros leidos son iguales');
end.
