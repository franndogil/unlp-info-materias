/* 6) Teniendo en cuenta lo respondido en el ejercicio anterior, ¿Qué salida produce en la consola la 
ejecución del siguiente programa?*/ 

Action[] acciones = new Action[10];
for (int i = 0; i < 10; i++)
{
    acciones[i] = () => Console.Write(i + " ");
}
foreach (var a in acciones)
{
    a.Invoke();
}


//RTA: Salida => 0 1 2 3 4 5 6 7 8 9    MAL
//RTA CORRECTA: Salida => 10 10 10 10 10 10 10 10 10 10 

/*Esto ocurre porque la variable i es capturada por referencia en todas las lambdas del array. 
Cuando el bucle termina, i vale 10, y todas las acciones usan ese valor al ejecutarse.
En otras palabras, cada lambda no guarda el valor de i en el momento de su creación, 
sino que todas acceden a la misma variable i, que al final del bucle es 10. Por eso la salida es: 10 10 10 10 10 10 10 10 10 10 */