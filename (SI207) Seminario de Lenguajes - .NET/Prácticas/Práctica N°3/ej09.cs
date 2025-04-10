/*9) ¿Qué líneas del siguiente método provocan error de compilación y por qué?*/

var a = 3L;     //long
dynamic b = 32;
object obj = 3;
a = (long) (a * 2.0);    //no puedo convertir implicitamente un double en un long, deberia castearlo.
b = b * 2.0;
b = "hola"; 
obj = b;
b = b + 11;
obj = (int) obj + 11; //no puedo sumar un object con un int de forma implicita, debo castearlo.
var c = new { Nombre = "Juan" };
var d = new { Nombre = "María" };
var e = new { Nombre = "Maria", Edad = 20 };
var f = new { Edad = 20, Nombre = "Maria" };
f.Edad = 22; //Los tipos anónimos (new { ... }) son inmutables, por lo que no se pueden modificar las propiedades una vez creados.
d = c;
e = d; //e no puede tomar el valor de d porque sus propiedades son diferentes.
f = e; //f no puede tomar el valor de e porque sus propiedades estan invertidos.