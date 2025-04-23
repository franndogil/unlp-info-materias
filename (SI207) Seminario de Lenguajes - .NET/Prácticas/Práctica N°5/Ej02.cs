using teoria5;

 new Cuenta();
 new Cuenta();
 List<Cuenta> cuentas = Cuenta.GetCuentas();
 // se recuperó la lista de cuentas creadas
 cuentas[0].Depositar(50);
 // se depositó 50 en la primera cuenta de la lista devuelta
 cuentas.RemoveAt(0);
 Console.WriteLine(cuentas.Count);
 // se borró un elemento de la lista devuelta
 // pero la clase Cuenta sigue manteniendo todos 
 // los datos "La cuenta id: 1 tiene 50 de saldo"
 cuentas = Cuenta.GetCuentas();
 // se recuperó nuevamente la lista de cuentas
 Console.WriteLine(cuentas.Count);
 cuentas[0].Extraer(30);
 //se extrajo 30 de la cuenta id: 1 que tenía 50 de saldo