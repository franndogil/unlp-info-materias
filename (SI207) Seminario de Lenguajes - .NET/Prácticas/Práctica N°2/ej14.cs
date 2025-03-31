/*14) ¿Qué hace la instrucción? ¿Asigna a la variable vector el valor null?*/

int[]? vector = new int[0];     //creo un vector con 0 espacios 
Console.WriteLine(vector);

if(vector == null){
    Console.WriteLine("Si, apunta a null");
}
else{
    Console.WriteLine("No apunta a null");
}

Console.ReadKey();

//Por consola imprimo el objeto vector

//La variable vector no es null