/*4) Contestar sobre el siguiente programa:*/


Taxi t = new Taxi(3, "Ford");
Console.WriteLine($"Un {t.Marca} con {t.Pasajeros} pasajeros");
class Auto
{
    public string Marca { get; private set; } = "Ford";
    public Auto(string marca) => this.Marca = marca;
 }
 class Taxi : Auto
 {
    public int Pasajeros  { get; private set; }
    public Taxi(int pasajeros, string marca) : base (marca) => this.Pasajeros = pasajeros;
 }

/* ¿Por qué no es necesario agregar :base en el constructor de Taxi?
RTA: Porque en el constructor de la clase Auto nos encontramos con un constructor sin parametros.
class Auto
{
    public string Marca { get; private set; } = "Ford";
    public Auto(string marca) => this.Marca = marca;
    public Auto(){
    }
 }


Eliminar el segundo constructor de la clase Auto y modificar la clase 
Taxi para el programa siga funcionando.*/