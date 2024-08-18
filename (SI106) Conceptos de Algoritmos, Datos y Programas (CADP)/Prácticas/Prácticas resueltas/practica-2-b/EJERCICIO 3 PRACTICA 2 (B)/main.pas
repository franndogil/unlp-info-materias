program ejercicio5;
    { suma los números entre a y b, y retorna el resultado en c }
procedure sumar(a, b: integer; var c:integer); //nos falta ; y declaramos la variable C por referencia
var
    i ,suma : integer;  //falta delarar i
    
begin
    suma:=0;            //hay que inicializar la suma
    for i := a to b do  begin //debemos agregar begin y end
    suma := suma + i;       //suma=0+1=1        suma=1+2=3
    c := c + suma;          //c=0+1=1           c=1+3=4
    end;
end;
var
    a, b:integer; //hay que declarar a y b
    result : integer;
    ok: boolean; //hay que declarar OK
begin
    a:=0;
    b:=0;
    result := 0;
    readln(a); readln(b);
    sumar(a, b, result); //result va en lugar de 0
    write('La suma total es' ,result);
        { averigua si el resultado final estuvo entre 10 y 30}
    ok := (result >= 10) or (result <= 30);
    if (not ok) then
        write ('La suma no quedó entre 10 y 30');
end.
