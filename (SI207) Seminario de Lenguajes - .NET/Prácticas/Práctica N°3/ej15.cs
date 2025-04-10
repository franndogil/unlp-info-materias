/*15) ¿Qué salida por la consola produce el siguiente código?*/

/*Salida por consola:
Del try imprime esto
8

Intenta dividir por cero en la linea marcada y tira la siguiente exepcion en el catch
Attempted to divide by zero.
*/

int x = 0;
try
{
  Console.WriteLine(1.0 / x); 
  Console.WriteLine(1 / x);       //linea marcada
  Console.WriteLine("todo OK");
}
catch (Exception e)
{
  Console.WriteLine(e.Message);
}

Console.ReadKey();

/*¿Qué se puede inferir respecto de la excepción división por cero en relación al tipo de los operandos?
Si intento dividir un entero por cero emite una excepcion, si intento dividir un float deberia imprimir Infinity pero por alguna razon me imprime "8" */