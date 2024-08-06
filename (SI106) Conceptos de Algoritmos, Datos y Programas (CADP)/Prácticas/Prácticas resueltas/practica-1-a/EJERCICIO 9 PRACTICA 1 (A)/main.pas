{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter,
 debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse una secuencia
 de números enteros que finaliza con 0. El programa deberá aplicar la operación leída con la secuencia de
 números, e imprimir el resultado final.
 Por ejemplo:
 ○ Siseleeel carácter “-” y la secuencia 4 3 5-6 0 , deberá imprimir:
 2
 ○ Siseleeel carácter “+” y la secuencia-10 5 6-1 0, deberá imprimir: 0
 (4– 3–5-(-6) )
 (-10 + 5 + 6+(-1))}
 
program ejer9;
var
    c1:char;
    num, suma, resta:integer;
begin
    num:=0;
    suma:=0;
    resta:=0;
    writeln('Ingrese + o -:');
    readln(c1);
    if((c1='+')or(c1='-'))then begin
        if(c1='+')then begin
            writeln('Ingrese un numero:');
            readln(num);
            while(num<>0)do begin
                suma:=suma+num;
                writeln('Ingrese un numero:');
                readln(num);
            end;
            writeln('La suma de los numeros dió: ', suma);
        end
        else begin
            writeln('Ingrese un numero:');
            readln(num);
            resta:=num;
            while(num<>0)do begin
                writeln('Ingrese un numero:');
                readln(num);
                resta:=resta-num;
            end;
            writeln('La resta entre los numeros dió: ', resta);
        end;
    end
    else
        writeln('ERROR');
end.
            
            
            
            
            
            
            
            
            
            
            