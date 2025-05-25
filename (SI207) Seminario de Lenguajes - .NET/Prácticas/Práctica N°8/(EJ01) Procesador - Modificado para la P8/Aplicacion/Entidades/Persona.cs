using System;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class Persona : IAtendible, INombrable, IComparable
{
    private string _nombre = "";
    public Persona()
    {
        Nombre = "persona";
    }
    public string Nombre
    {
        get => _nombre;
        set => _nombre = value;
    }

    public void seAtiendeA()
    {
        Console.WriteLine($"Atendiendo a {Nombre}");
    }

    public int CompareTo(object? obj)
    {
        int result = 0;
        if (obj is Persona p)
        {
            string nombre = p.Nombre;
            result = this.Nombre.CompareTo(nombre);
        }
        return result;
    }

    public override string ToString()
    {
        string aux = $"{Nombre} es una persona.";
        return aux;
    }
}
