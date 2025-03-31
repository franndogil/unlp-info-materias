/*20) Codificar el método Swap que recibe 2 parámetros enteros e intercambia sus valores. El cambio 
debe apreciarse en el método invocador.*/
void Swap(ref int a, ref int b){
    int aux = a;
    a = b;
    b = aux;
}

int x = 10;
int y = 20;

Console.WriteLine("Antes del Swap");
Console.WriteLine("X: " + x);
Console.WriteLine("Y: " + y);

Swap(ref x, ref y);

Console.WriteLine("Despues del Swap");
Console.WriteLine("X: " + x);
Console.WriteLine("Y: " + y);

Console.ReadKey();