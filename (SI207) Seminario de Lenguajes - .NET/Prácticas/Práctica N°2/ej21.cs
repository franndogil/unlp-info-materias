/*21) Codificar el método Imprimir para que el siguiente código produzca la salida por consola que se 
observa. Considerar que el usuario del método Imprimir podría querer más adelante imprimir otros 
datos, posiblemente de otros tipos pasando una cantidad distinta de parámetros cada vez que invoque el 
método. Tip: usar params*/

void imprimir(params object[] parametros){
    for(int i = 0; i < parametros.Length; i++){
        Console.Write(parametros[i] + " ");
    }
    Console.WriteLine();
}

imprimir(1, "casa", 'A', 3.4, DayOfWeek.Saturday);
imprimir(1, 2, "tres");
imprimir();
imprimir("-------------");
Console.ReadKey();