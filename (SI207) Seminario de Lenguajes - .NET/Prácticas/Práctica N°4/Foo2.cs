using System;

namespace teoria4;

public class Foo
{
    public void Imprimir()
    {        
        string? bar;                        //la variable nunca fue inicializada
        Console.WriteLine(bar.Length);
    }
}
