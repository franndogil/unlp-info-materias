using System;
using System.Reflection.Metadata.Ecma335;

namespace teoria6;

public class A
{
    protected int _id;
    public A(int id) => _id = id;
    public virtual void Imprimir() => Console.WriteLine($"A_{_id}");

    public virtual int getValue() {
        return _id;
    }
}

class B : A
{
    public B(int id) : base(id) { }     //declaro el constructor para la clase B y llamo al constructor de la clase previa, en este caso, la clase A
    public override void Imprimir()
    {
        Console.Write($"B_{_id} --> ");     //imprimo lo solicitado
        base.Imprimir();                    //busco en la clase previa el metodo imprimir y lo ejectuo
    }
}

class C : B
{
    public C(int id) : base(id) { }
    public override void Imprimir()
    {
        Console.Write($"C_{_id} --> ");
        base.Imprimir();
    }
}

class D : C
{
    public D(int id) : base(id) { }
    public override void Imprimir()
    {
        Console.Write($"D_{_id} --> ");
        base.Imprimir();
    }
}
