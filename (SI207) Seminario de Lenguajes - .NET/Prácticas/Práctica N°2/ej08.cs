/*8) Investigar acerca de la clase StringBuilder del espacio de nombre System.Text ¿En qué 
circunstancias es preferible utilizar StringBuilder en lugar de utilizar string? Implementar un 
caso de ejemplo en el que el rendimiento sea claramente superior utilizando StringBuilder en lugar 
de string y otro en el que no.*/

/*RTA: 
La clase StringBuilder (que esta definida en el espacio de nombre System.Text) se puede utilizar para modificar una cadena sin crear un objeto. */

/*EJEMPLOS*/
//Sin StringBuilder

using System.Text;

string str1 = "";
for (int i=0; i<1000; i++){
    str1 = str1 + 'a';
}
Console.WriteLine(str1);
Console.ReadKey();

//Con StringBuilder

StringBuilder str2 = new StringBuilder();
for (int i=0; i<1000; i++){
    str2.Append('a');
}

Console.WriteLine(str2);
Console.ReadKey();