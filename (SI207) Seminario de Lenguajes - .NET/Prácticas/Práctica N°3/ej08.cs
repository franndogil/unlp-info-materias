/*8) Señalar errores de compilación y/o ejecución en el siguiente código*/

object obj = new int[10];
dynamic dyna = 13;
Console.WriteLine(((int[])obj).Length);     //faltaba castear el objeto a vector de enteros
Console.WriteLine(dyna.Length);             //Error en dyna.Length: dyna es de tipo dynamic y tiene un valor asignado de 13 (un número entero). 
                                            //Los enteros no tienen una propiedad Length, lo que causará una excepción en tiempo de ejecución (RuntimeBinderException).
