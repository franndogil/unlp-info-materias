using System;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class PeliculaClasica : Pelicula, IVendible
{
    public PeliculaClasica() : base()
    {
        base.Nombre = "Pelicula Clasica";   
    }

    public void Venta(Persona persona)
    {
        Console.WriteLine($"Vendiendo {base.Nombre} a {persona.Nombre}");
    }
}
