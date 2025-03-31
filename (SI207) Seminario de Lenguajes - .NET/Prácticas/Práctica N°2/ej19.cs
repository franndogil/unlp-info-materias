/* 18) Escribir una función (método int Fac(int n)) que calcule el factorial de un número n pasado al 
programa como parámetro por la línea de comando
 a) Definiendo una función no recursiva
 b) Definiendo una función recursiva
19) Idem. al ejercicio 18.a) y 18.b) pero devolviendo el resultado en un parámetro de salida void Fac(int n, out int f) */

//no recursiva

using System.Reflection.Metadata.Ecma335;
using System.Resources;
using System.Runtime.InteropServices;

Console.WriteLine("Ingresa el numero a calcular el factorial");
 int factorial = int.Parse(Console.ReadLine());     //pasar de string a int 

 void FacA(int n, out int f) {
    int res = n;

    for (int i = n-1; i>=2; i--){
        res = res * i;
    }
    f = res;
 }

 void FacB(int n, out int f){           //NO ME SALE CONSULTAR
    if(n>1){
        FacB(n-1, out f);
        f = f * n;
    }
 }

 int FacC(int n) => n<=1 ? 1 : FacC(n-1);

FacA(factorial, out int f);
Console.WriteLine("Respuesta (A):" + f);

FacB(factorial, out int g);
Console.WriteLine("Respuesta (B):" + g);

Console.ReadKey();