/*17) Cuál es la salida por consola del siguiente programa:*/

void Metodo1()
 {
    object obj = "hola";
    try
    {
        int i = (int)obj;
    }
    finally
    {
        Console.WriteLine("Bloque finally en Metodo1");
    }
 }
 
 void Metodo2()
 {
    object obj = "hola";
    try
    {
        int i = (int)obj;
    }
    catch (OverflowException)
    {
        Console.WriteLine("Overflow");
    }
 }
 void Metodo3()
 {
    object obj = "hola";
    try
    {
        int i = (int)obj;
    }
    catch (InvalidCastException)
    {
        Console.WriteLine("Excepción InvalidCast en Metodo3");
        throw;
    }
 }

//programa

try
 {
    Metodo1();
 }
 catch
 {
    Console.WriteLine("Método 1 propagó una excepción no tratada");
 }
 try
 {
    Metodo2();
 }
 catch
 {
    Console.WriteLine("Método 2 propagó una excepción no tratada");
 }
 try
 {
    Metodo3();
 }
 catch
 {
    Console.WriteLine("Método 3 propagó una excepción");
 }

Console.ReadKey();
