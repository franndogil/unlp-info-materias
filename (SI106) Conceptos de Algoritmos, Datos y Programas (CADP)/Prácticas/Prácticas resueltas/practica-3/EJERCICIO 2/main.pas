{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el
 año 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese
 año.
 a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada
 casamiento.
 b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el
 definido en el inciso a
 c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura
 finaliza al ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos
 realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos
 realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura
 de fecha.}
program ejer2;
type
    casamiento=record
        ano:integer;
        mes:integer;
        dia:integer;
    end;
    
procedure Lectura(var casam:casamiento);
begin
    writeln('Ingrese el año:');
    readln(casam.ano);
    writeln('Ingrese el mes:');
    readln(casam.mes);
    writeln('Ingrese el dia:');
    readln(casam.dia);
end;

var
    c:casamiento;
    cantv, cantp:integer;
    
begin
    cantv:=0;
    cantp:=0;
    repeat
        Lectura(c);
        if(c.ano=2019)then begin
            if(c.mes<4)then
                cantv:=cantv+1;
            if(c.dia<11)then
                cantp:=cantp+1;
        end;
    until(c.ano<>2019);
    writeln('Cantidad de casamientos en verano: ',cantv);
    writeln('Cantidad de casamientos los primeros 10 dias de todos los meses: ',cantp);
end.
    