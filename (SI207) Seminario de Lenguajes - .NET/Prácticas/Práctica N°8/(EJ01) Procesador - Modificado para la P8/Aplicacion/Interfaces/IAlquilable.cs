using System;
using Aplicacion.Entidades;

namespace Aplicacion.Interfaces;

public interface IAlquilable
{
    public void SeAlquilaA(Persona persona);
    public void SeDevuelvePor(Persona persona);
}
