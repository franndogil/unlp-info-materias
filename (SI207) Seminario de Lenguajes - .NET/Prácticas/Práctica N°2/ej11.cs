/*11) ¿Para qué sirve el método Split de la clase string? Usarlo para escribir en la consola todas las 
palabras (una por línea) de una frase ingresada por consola por el usuario.

El metodo Split sirve para dividir una cadena de string y guardar cada string de la cadena por separado dentro de un vector de strings.

"El método String.Split crea una matriz de subcadenas mediante la división de la cadena de entrada en función de uno o varios delimitadores.
 A menudo, este método es la manera más fácil de separar una cadena en límites de palabras. 
También sirve para dividir las cadenas en otras cadenas o caracteres específicos."

FUENTE: .NET
*/

using System.Collections.Specialized;

string str = "";

Console.WriteLine("Ingrese una frase: ");
str = Console.ReadLine();

string[] str2 = str.Split();

for (int i=0; i<str2.Length; i++){
    Console.WriteLine(str2[i]);
}
Console.ReadKey();