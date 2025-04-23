//3) Reemplazar el método estático GetCuentas() del ejercicio anterior por una propiedad estática de sólo lectura.

using teoria5;

 new Cuenta();
 new Cuenta();
 List<Cuenta> cuentas = Cuenta.Cuentas;
 cuentas[0].Depositar(50);
 cuentas.RemoveAt(0);
 Console.WriteLine(cuentas.Count);
 cuentas = Cuenta.Cuentas;
 Console.WriteLine(cuentas.Count);
 cuentas[0].Extraer(30);