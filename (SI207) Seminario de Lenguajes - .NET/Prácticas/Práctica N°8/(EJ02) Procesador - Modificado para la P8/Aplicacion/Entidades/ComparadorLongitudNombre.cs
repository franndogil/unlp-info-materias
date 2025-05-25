using System;
using System.Collections;
using System.Security.AccessControl;
using Aplicacion.Interfaces;

namespace Aplicacion.Entidades;

public class ComparadorLongitudNombre : IComparer
{
    public int Compare(object? x, object? y)
    {
        var a = x as INombrable;
        var b = y as INombrable;
        if (a == null) return -1;
        if (b == null) return -1;
        return a.Nombre.Length.CompareTo(b.Nombre.Length);
    }
}