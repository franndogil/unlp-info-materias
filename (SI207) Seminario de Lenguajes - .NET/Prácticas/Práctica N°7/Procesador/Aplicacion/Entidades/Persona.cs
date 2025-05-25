using System;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class Persona : IAtendible
{
    private string _nombre;
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
}
