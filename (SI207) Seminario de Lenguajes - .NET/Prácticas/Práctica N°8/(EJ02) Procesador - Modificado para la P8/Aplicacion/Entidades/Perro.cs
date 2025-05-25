using System;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class Perro : IAtendible, IVendible, ILavable, INombrable, IComparable
{
    private string _nombre = "";
    public Perro()
    {
        Nombre = "perro";
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
    public void Venta(Persona persona)
    {
        Console.WriteLine($"Vendiendo {Nombre} a {persona.Nombre}");
    }

    public void Lavado()
    {
        Console.WriteLine($"Lavando {Nombre}");
    }
    public void Secado()
    {
        Console.WriteLine($"Secando {Nombre}");
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
        string aux = $"{Nombre} es un perro.";
        return aux;
    }
}
