/*9) ¿Cuál es el error en el siguiente programa? */

 Auto a = new Auto();
 a.Marca = "Ford";
 Console.WriteLine(a.Marca);
 class Auto
 {
    private string marca;
    public string Marca
    {
        set
        {
            marca = value;      // Se asigna el valor a la variable privada marca (previamente tenia Marca con mayuscula, lo cual estaba mal)
            // Marca = value; // Esto causaba una recursión infinita, ya que se llamaba a sí mismo en lugar de asignar el valor a la variable privada.
        }   
        get
        {
            return marca;
        }
    }
 }
