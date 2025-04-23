//1) Codificar la clase Cuenta de tal forma que el siguiente código produzca la salida por consola que se indica.

using System;
using System.Diagnostics.Contracts;

namespace teoria5;

public class Cuenta
{
    private static int contadorCuentasCreadas = 0;       //int static para poder asignar un id a cada cuenta nueva
    private static int contadorDepositosRealizados = 0;
    private static int contadorExtraccionesRealizadas = 0;
    private static int contadorOperacionDenegada = 0;
    private static double totalDepositado = 0;
    private static double totalExtraido = 0;
    private static double total = 0;
    private string id { get; } = Guid.NewGuid().ToString();        //indizador privado 
    private double _dineroDisponible;

    public Cuenta(){
        _dineroDisponible = 0;
        contadorCuentasCreadas ++;                                           //incremento contador de id 
        id = contadorCuentasCreadas.ToString();                             //asigno id a la cuenta
        Console.WriteLine("Se creo la cuenta " + id + ".");
    }

    public Cuenta Depositar(double cantidad){
        _dineroDisponible += cantidad;
        contadorDepositosRealizados++;
        totalDepositado += cantidad;
        total += cantidad;
        Console.WriteLine("Se deposito " + cantidad + " pesos en la cuenta " + id + ". (SALDO: " + _dineroDisponible + ")");
        return this;
    }

    public Cuenta Extraer(double cantidad){
        if(_dineroDisponible>=cantidad){
            _dineroDisponible = _dineroDisponible - cantidad;
            contadorExtraccionesRealizadas++;
            totalExtraido += cantidad;
            total = total - cantidad;
            Console.WriteLine("Se extrajo " + cantidad + " pesos en la cuenta " + id + ". (SALDO: " + _dineroDisponible + ")");
        }
        else{
            Console.WriteLine("Operación denegada - Saldo insuficiente");
            contadorOperacionDenegada++;
        }
        return this;
    }

    public static void ImprimirDetalle(){
        Console.WriteLine($"CUENTAS CREADAS: {contadorCuentasCreadas, 2}");
        Console.WriteLine($"DEPOSITOS: {contadorDepositosRealizados, 8} - Total depositado: {totalDepositado, 2}");
        Console.WriteLine($"EXTRACCIONES: {contadorExtraccionesRealizadas, 5} - Total extraido: {totalExtraido, 6}");
        Console.WriteLine($"                    - Saldo: {total, 13}");     //negrada
        Console.WriteLine($"* Se denegaron {contadorOperacionDenegada} extracciones por falta de fondos");
    }
}
