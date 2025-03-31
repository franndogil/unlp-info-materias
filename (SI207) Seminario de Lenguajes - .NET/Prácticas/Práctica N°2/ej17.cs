/* 17) Implementar un programa que muestre todos los números primos entre 1 y un número natural dado 
(pasado al programa como argumento por la línea de comandos). Definir el método bool 
EsPrimo(int n) que devuelve true sólo si n es primo. Esta función debe comprobar si n es 
divisible por algún número entero entre 2 y la raíz cuadrada de n. (Nota: Math.Sqrt(d) devuelve la 
raíz cuadrada de d)*/

bool esPrimo(int n){
    bool ok = false;
    int cont = 1;

    for (int i=2; i<=n; i++){
        if(n % i == 0){
            cont++;
        }
    }

    if(cont == 2){
        ok = true;
    }

    return ok;
}

int p = int.Parse(args[0]);
Console.WriteLine(esPrimo(p));

Console.ReadKey();