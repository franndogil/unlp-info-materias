object o1 = "A";
object o2 = o1;
o2 = "Z";
Console.WriteLine(o1 + " " + o2);

/*El resultado de la consola no es 'Z Z' porque el objeto o1 apunta a 
la direccion donde esta alojada "A" mientras que el objeto o2 apunta a la direccion
de "Z"*/