/*10) Identificar todos los miembros en la siguiente declaración de clase. Indicar si se trata de un 
constructor, método, campo, propiedad o indizador, si es estático o de instancia, y en caso que 
corresponda si es de sólo lectura, sólo escritura o lectura y escritura. En el caso de las propiedades 
indicar también si se trata de una propiedad auto-implementada.
Nota: La clase compila perfectamente. Sólo prestar atención a la sintaxis, la semántica es irrelevante.*/

class A
    {
        private static int a;   //campo estático privado
        private static readonly int b;  //campo estático de sólo lectura privado
        A() { }     //constructor privado
        public A(int i) : this() { } //constructor público que llama al constructor privado
        static A() => b = 2;  //constructor estático que inicializa el campo b
        int c; //campo de instancia privado
        public static void A1() => a = 1; //metodo estático
        public int A1(int a) => A.a + a;  //método de instancia que suma el campo estático a un parámetro
        public static int A2;   //campo estatico público
        static int A3 => 3;     //campo estatico de sólo lectura
        private int A4() => 4;  //método privado de instancia que devuelve 4
        public int A5 { get => 5; }     //propiedad de solo lectura
        int A6 { set => c = value; }      //propiedad de solo escritura
        public int A7 { get; set; }     //propiedad
        public int A8 { get; } = 8;     //propiedad de solo lectura
        public int this[int i] => i;    //indizador de solo lectura
    }