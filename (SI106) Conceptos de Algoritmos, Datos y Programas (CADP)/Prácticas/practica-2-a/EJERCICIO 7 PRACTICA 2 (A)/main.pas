 program alcanceYFunciones;
 var
    suma, cant : integer;
 function calcularPromedio : real;
 var
    prom : real;
 begin
    if (cant = 0) then
        prom :=-1
    else
        prom := suma / cant;
    calcularPromedio:=prom; //esta es la linea que agregué
 end;
 begin { programa principal }
    readln(suma);
    readln(cant);
    if (cant>0) then begin  
    writeln('El promedio es: ' , calcularPromedio)
    end
    else
        writeln('Dividir por cero no parece ser una buena idea');
 end.
 
{i) El programa original. no imprime
 ii) El programa luego de realizar la modificación del inciso a.    imprime -1
 iii) El programa luego de realizar las modificaciones de los incisos a y b.    imprime 8    }