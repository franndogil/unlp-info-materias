/* 18) Escribir una función (método int Fac(int n)) que calcule el factorial de un número n pasado al 
programa como parámetro por la línea de comando
 a) Definiendo una función no recursiva
 b) Definiendo una función recursiva
 c) idem a b) pero con expression-bodied methods (Tip: utilizar el operador condicional ternario)*/


//no recursiva

using System.Reflection.Metadata.Ecma335;
using System.Resources;
using System.Runtime.InteropServices;

Console.WriteLine("Ingresa el numero a calcular el factorial");
 int factorial = int.Parse(Console.ReadLine());     //pasar de string a int 

 int FacA(int n){
    int res = n;

    for (int i = n-1; i>=2; i--){
        res = res * i;
    }
    return res;
 }

 int FacB(int n){
    if (n<=1){
        return 1;
    }
    return n * FacB(n-1);
 }

 int FacC(int n) => n<=1 ? 1 : FacC(n-1);

Console.WriteLine(FacA(factorial));
Console.WriteLine(FacB(factorial));

Console.ReadKey();