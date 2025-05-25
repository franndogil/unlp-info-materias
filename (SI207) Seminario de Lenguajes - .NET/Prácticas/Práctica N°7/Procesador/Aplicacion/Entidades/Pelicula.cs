using System;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class Pelicula : IAlquilable
{
    private string _nombre;

    public string Nombre
    {
        get => _nombre;
        set => _nombre = value;
    }
    public Pelicula()
    {
        Nombre = "pelicula";
    }
    public void SeAlquilaA(Persona persona)
    {
        Console.WriteLine($"Alquilando {Nombre} a {persona.Nombre}");
    }
    public void SeDevuelvePor(Persona persona)
    {
        Console.WriteLine($"{Nombre} devuelta por {persona.Nombre}");
    }
}
