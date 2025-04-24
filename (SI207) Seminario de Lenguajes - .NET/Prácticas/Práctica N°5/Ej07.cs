/*7) Definir la clase Persona con las siguientes propiedades de lectura y escritura: Nombre  de tipo 
string, Sexo de tipo char, DNI de tipo int, y FechaNacimiento de tipo DateTime. Además   
definir una propiedad de sólo lectura (calculada) Edad de tipo int. Definir un indizador de 
lectura/escritura que permita acceder a las propiedades a través de un índice entero. Así, si p es un 
objeto Persona, con p[0] se accede al nombre, p[1] al sexo p[2] al DNI, p[3] a la fecha de 
nacimiento y p[4] a la edad. En caso de asignar p[4] simplemente el valor es descartado. Observar 
que el tipo del indizador debe ser capaz almacenar valores de tipo int, char, DateTime y string.*/

using teoria5;

Persona p1 = new Persona();
p1.Nombre = "Franco";
p1.Sexo = 'M';
p1.FechaNacimiento = new DateTime(2001, 11, 13);
p1.DNI = 43851187;
Console.WriteLine("Edad: " + p1.Edad);

Console.WriteLine(p1[0]);
Console.WriteLine(p1[1]);
Console.WriteLine(p1[2]);
Console.WriteLine(p1[3]);
Console.WriteLine(p1[4]);