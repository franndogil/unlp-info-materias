using System;
using System.Reflection.Metadata.Ecma335;

namespace teoria4;

public class Ecuacion2
{
    private double a;
    private double b;
    private double c;
    public Ecuacion2(double a, double b, double c){
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public double getDiscriminante(){
        return ((b*b)-(4*a*c)); 
    }

    public int getCantidadDeRaices(){
        if(getDiscriminante()<0){
            return 0;
        }
        if(getDiscriminante()==0){
            return 1;
        }
        return 2;
    }

    public void imprimirRaices(){
        if(getCantidadDeRaices()==0){
            Console.WriteLine("No tiene raices reales!");
        }
        else if(getCantidadDeRaices()==1){
            double raiz1 = (-b) / (2*a);
            Console.WriteLine("Unica Raiz: " + raiz1);
        }
        else{
            double raizCuadrada = Math.Sqrt(getDiscriminante());
            double raiz1 = (-b) + raizCuadrada;
            double raiz2 = (-b) - raizCuadrada;
            Console.WriteLine("Raiz 1: " + raiz1/(2*a));
            Console.WriteLine("Raiz 2: " + raiz2/(2*a));
        }
    }
}
