/*15) Determinar qué hace el siguiente programa y explicar qué sucede si no se pasan parámetros cuando 
se invoca desde la línea de comandos.*/
 
Console.WriteLine("¡Hola {0}!", args[0]);       //imprimo el primer argumento agregado
Console.ReadKey();

//El programa agrega el argumento al string
//Si no le paso ningun argumento, se produce una exepcion por fuera de rango. A la hora de concatenar intentamos acceder
//a la posicion 0 del vector de argumentos, pero esta posicion no existe debido a que no se le paso ningun argumento. 