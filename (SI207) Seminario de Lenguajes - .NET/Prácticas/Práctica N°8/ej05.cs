/*5) ¿Qué obtiene un método anónimo (o expresión lambda) cuando accede a una variable definida en el 
entorno que lo rodea, una copia del valor de la variable o la referencia a dicha variable? Tip: Observar 
la salida por consola del siguiente código:*/ 

int i = 10;
Action a = delegate ()
{
    Console.WriteLine(i);
};
a.Invoke();
i = 20;
a.Invoke();

//RTA: Obtiene la referencia de dicha variable.