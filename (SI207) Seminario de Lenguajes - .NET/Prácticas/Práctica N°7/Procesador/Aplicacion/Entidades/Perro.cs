using System;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class Perro : IAtendible, IVendible, ILavable
{
    private string _nombre;
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
}
