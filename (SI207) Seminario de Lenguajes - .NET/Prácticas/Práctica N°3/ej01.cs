/*1) Ejecutar y analizar cuidadosamente el siguiente programa:*/

Console.CursorVisible = false;
ConsoleKeyInfo k = Console.ReadKey(true);
while (k.Key != ConsoleKey.End)
{
Console.Clear();    //lim
Console.Write($"{k.Modifiers}-{k.Key}-{k.KeyChar}"); //imprimo modificador, familia y caracter especifico
k = Console.ReadKey(true);
}

/*Comprobar tipeando teclas y modificadores (shift, ctrl, alt) para apreciar de qué manera se
puede acceder a esta información en el código del programa.*/