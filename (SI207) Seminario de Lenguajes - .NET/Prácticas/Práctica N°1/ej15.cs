/*¿Cuál es el problema del código siguiente y cómo se soluciona?*/

int i = 0;
for (int i = 1; i <= 10;){
      Console.WriteLine(i++);
}

//Declara dos veces la variable i. Se soluciona eliminando la segunda declaración. 

int i = 0;
for (i = 1; i <= 10;){
      Console.WriteLine(i++);
}
