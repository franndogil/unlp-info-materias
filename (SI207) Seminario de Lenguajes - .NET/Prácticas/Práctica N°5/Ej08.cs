/* 8) Dada la siguiente definición incompleta de clase:*/
/* Completarla y agregar dos indizadores de sólo lectura
Un índice entero que permite acceder a las personas de la lista por número de documento. Por ejemplo 
p=lista[30456345] devuelve el objeto Persona que tiene DNI=30456345 o null en caso que no 
exista en la lista.
Un índice de tipo char que devuelve un List<string> con todos los nombres de las personas de la 
lista que comienzan con el carácter pasado como índice.*/

using teoria5;

ListaDePersonas lista = new ListaDePersonas();

Persona p1 = new Persona();
p1.DNI = 43851187;
p1.Nombre = "Franco";
p1.Sexo = 'M';

Persona p2 = new Persona();
p2.DNI = 444444;
p2.Nombre = "Juampi";
p2.Sexo = 'M';

Persona p4 = new Persona();
p4.DNI = 666666;
p4.Nombre = "Sebastian";
p4.Sexo = 'M';

Persona p3 = new Persona();
p3.DNI = 555555;
p3.Nombre = "Sabri";
p3.Sexo = 'F';

lista.Agregar(p1);
lista.Agregar(p2);
lista.Agregar(p3);
lista.Agregar(p4);

Persona copia = new Persona();

copia = lista[555555];
Console.WriteLine(copia.Nombre);

List<String> listaNombres = new List<string>();
listaNombres = lista['S'];

foreach (string nombre in listaNombres)
{
    Console.WriteLine(nombre);
}