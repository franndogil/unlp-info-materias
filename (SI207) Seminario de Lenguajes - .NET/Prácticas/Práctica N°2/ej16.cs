/*16) Escribir un programa que reciba una lista de nombres como parámetro por la línea de comandos e 
imprima por consola un saludo personalizado para cada uno de ellos.
 a) Utilizando la sentencia for
 b) Utilizando la sentencia foreach*/

//a) Con For
for(int i = 0; i<args.Length; i++){
    if(args[i] == "Franco"){
        Console.WriteLine("Hola Franco, como estas?");
    }
    if(args[i] == "Ciro"){
        Console.WriteLine("No me vomites el auto");
    }
    if(args[i] == "Ivan"){
        Console.WriteLine("Hola Ivan, queres una gomita?");
    }
}

//b) Con Foreach                PARA RECORRER ARREGLOS ENTEROS
foreach(string st in args){
    if(st == "Franco"){
        Console.WriteLine("Hola Franco, como estas?");
    }
    if(st == "Ciro"){
        Console.WriteLine("No me vomites el auto");
    }
    if(st == "Ivan"){
        Console.WriteLine("Hola Ivan, queres una gomita?");
    }
}
Console.ReadKey();