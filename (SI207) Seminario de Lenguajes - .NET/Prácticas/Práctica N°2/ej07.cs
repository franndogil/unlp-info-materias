//¿Cuál es la salida por consola del siguiente fragmento de código? ¿Por qué la tercera y sexta línea producen resultados diferentes?

 char c1 = 'A';
 char c2 = 'A';
 Console.WriteLine(c1 == c2);
 object o1 = c1;
 object o2 = c2;
 Console.WriteLine(o1 == o2);

 Console.ReadKey();

//La salida por consola es TRUE FALSE, la tercera linea compara resultados inmediatos ('A' con 'A')(TRUE), mientras que la sexta linea compara direcciones de memoria (FALSE). 