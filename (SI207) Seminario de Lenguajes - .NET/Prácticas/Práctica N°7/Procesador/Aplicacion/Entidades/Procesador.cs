using System;
using System.Diagnostics.Contracts;
using Aplicacion.Interfaces;
namespace Aplicacion.Entidades;

public static class Procesador
{
    public static void Alquilar(IAlquilable x, Persona p) => x.SeAlquilaA(p);
    public static void Atender(IAtendible x) => x.seAtiendeA();
    public static void Devolver(IAlquilable x, Persona p) => x.SeDevuelvePor(p);
    public static void Lavar(ILavable x) => x.Lavado();
    public static void Secar(ILavable x) => x.Secado();
    public static void Reciclar(IReciclable x) => x.Reciclado();
    public static void Vender(IVendible x, Persona p) => x.Venta(p);
}