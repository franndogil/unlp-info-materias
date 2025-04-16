/* 2) Modificar el programa anterior haciendo privados todos los campos. Definir un constructor adecuado 
y un método público Imprimir() que escriba en la consola los campos del objeto con el formato 
requerido para el listado. */

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
}
