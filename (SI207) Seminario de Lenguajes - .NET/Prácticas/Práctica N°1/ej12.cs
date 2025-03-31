/*Escribir un programa que imprima todos los divisores de un número entero ingresado desde la
consola. Para obtener el entero desde un string st utilizar int.Parse(st).*/

string st = Console.ReadLine();
int stint = int.Parse(st);
for (int i=1; i<=stint; i++){
    if(stint % i == 0){
        Console.WriteLine(i);
    }
}
