using System;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class Libro : IAlquilable, IReciclable
{
    private string _nombre;

    public Libro()
    {
        Nombre = "libro";
    }

    public string Nombre
    {
        get => _nombre;
        set => _nombre = value;
    }

    public void SeAlquilaA(Persona persona)
    {
        Console.WriteLine($"Alquilando {Nombre} a {persona.Nombre}");
    }

    public void SeDevuelvePor(Persona persona)
    {
        Console.WriteLine($"{Nombre} devuelto por {persona.Nombre}");
    }
    public void Reciclado()
    {
        Console.WriteLine($"Reciclando {Nombre}");
    }
}
