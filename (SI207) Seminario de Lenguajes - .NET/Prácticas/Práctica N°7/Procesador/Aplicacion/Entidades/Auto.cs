using System;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class Auto : ILavable, IReciclable, IVendible
{
    private string _nombre;
    public Auto()
    {
        Nombre = "auto";
    }
    public string Nombre
    {
        get => _nombre;
        set => _nombre = value;
    }
    public void Lavado()
    {
        Console.WriteLine($"Lavando {Nombre}");
    }
    public void Secado()
    {
        Console.WriteLine($"Secando {Nombre}");
    }
    public void Reciclado()
    {
        Console.WriteLine($"Reciclando {Nombre}");
    }
    public void Venta(Persona persona)
    {
        Console.WriteLine($"Vendiendo {Nombre} a {persona.Nombre}");
    }
}
