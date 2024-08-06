{Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
 programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
 destinado por mes al pago de salarios, y el salario del empleado de mayor legajo.}
 
program programadores;
procedure leerDatos(var legajo: integer; var salario : real); //declaramos salario por referencia
begin
    writeln('Ingrese el nro de legajo y el salario');
    read(legajo);
    read(salario);
end;
procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer; var maxSalario:real);
//declaramos maxSalario por referencia

begin
    if (nuevoLegajo > maxLegajo) then begin
        maxLegajo:= nuevoLegajo;
        maxSalario := nuevoSalario;         //falta punto y coma
    end;
end;
var
    legajo, maxLegajo, i : integer;
    salario, maxSalario, sumaSalarios : real; //declaro sumaSalarios
begin
    legajo:=0;          //inicializamos las variables del programa
    maxLegajo:=0;
    i:=0;
    salario:=0;
    maxSalario:=0;      //inicializamos maxSalario
    sumaSalarios := 0;
    for i := 1 to 2 do begin
        leerDatos(legajo, salario);     //estaban invertidos el legajo y el salario
        actualizarMaximo(legajo, salario, maxLegajo, maxSalario);   //agregamos al procedimiento maxSalario
        sumaSalarios := sumaSalarios + salario;
    end;
    writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
    writeln('El salario del empleado más nuevo es ',maxSalario);
end.