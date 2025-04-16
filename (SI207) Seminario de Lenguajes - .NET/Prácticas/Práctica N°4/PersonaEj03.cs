/*3) Agregar a la clase Persona un método EsMayorQue(Persona p) que devuelva verdadero si la 
persona que recibe el mensaje tiene más edad que la persona enviada como parámetro. Utilizarlo para 
realizar un programa que devuelva la persona más jóven de la lista.*/

using System;

namespace teoria4;

public class Persona
{
    private string? nombre;
    private long documento;
    private int edad;

    public Persona(){

    }

    public Persona(string nombre, long documento, int edad){
        this.nombre = nombre;
        this.documento  = documento;
        this.edad = edad;
    }

    public void setNombre(string nombre){
        this.nombre = nombre;
    }

    public string? getNombre(){
        return this.nombre;
    }

    public void setDocumento(long documento){
        this.documento = documento;
    }

    public void setEdad(int edad){
        this.edad = edad;
    }

    public void Imprimir(){
        Console.WriteLine($"{nombre,-12}{documento,-10}{edad,-5}");    //PONER SIGNO PESO POR FUERA
    }

    public Boolean esMayorQue(Persona pers){
        if(this.edad > pers.edad){
            return true;
        }
        
        return false;
    }
}
