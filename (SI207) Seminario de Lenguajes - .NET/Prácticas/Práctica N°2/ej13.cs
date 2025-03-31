/* 13) ¿Cuál es la salida por consola si no se pasan argumentos por la línea de comandos?*/

    Console.WriteLine(args == null);
    Console.WriteLine(args.Length);

    Console.ReadKey();
//Salida por consola:
//False     aca da falso pero compara null con ningun argumento???
//0     por cero argumentos pasados en el launch.json