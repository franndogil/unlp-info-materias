using teoria6;

    A[] vector = { new A(3), new B(5), new C(15), new D(41) };
    foreach (A a in vector)
    {
        a.Imprimir();
    }


/*Salida por consola:*/
/*A_3
 B_5 --> A_5
 C_15 --> B_15 --> A_15
 D_41 --> C_41 --> B_41 --> A_41*/