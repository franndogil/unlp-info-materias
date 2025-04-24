/*5) Qué líneas del código siguiente provocan error de compilación? Analizar cuándo es posible acceder a 
miembros estáticos y de instancia.*/

class A
 {
    char c;
    static string st;   //declaro un string statico
    void metodo1()
    {
        st = "string";  
        c = 'A';
    }
    static void metodo2()
    {
        new ClaseA().c = 'a';   //si quisiera acceder a la variable c de la clase A deberia escribir new A().c = 'a';
        st = "st2";
        c = 'B';    //c nunca fue declarada dentro del metodo (falta char c;)
        new A().st = "otro string";     //st es un string statico, no es necesario realizar new A().st para modificarlo, solo basta con poner st = "lo que sea";
    }
 }