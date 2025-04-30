class Auto
 {
  protected double velocidad;
  public virtual void Acelerar() => Console.WriteLine("Velocidad = {0}", velocidad += 10);  //faltaba $
 }
 class Taxi : Auto
 {
  public override void Acelerar() => Console.WriteLine("Velocidad = {0}", velocidad += 5);  //faltaba $
 }

 //el problema esta en la variable velocidad de Taxi, no podemos acceder debido a su nivel de proteccion
 //una de las soluciones es declarar velocidad como protected