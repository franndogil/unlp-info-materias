using System;
using System.Diagnostics.Contracts;

namespace teoria5;

public class Persona
{
    public Object? this[int i]{         //lo declare con Object porque sino no puedo retornar diferentes tipos de datos, ejemplo, string, char, int, dateTime
        get{
            if(i==0) return Nombre;
            else if(i == 1) return Sexo;
            else if(i == 2) return DNI;
            else if(i == 3) return FechaNacimiento;
            else if(i == 4) return Edad; 
            else return null;
        }
    }

    public string Nombre{ get; set; }
    public char Sexo { get; set; }
    public int DNI { get; set; }
    public DateTime FechaNacimiento { get; set; }
    public int Edad {   //propiedad de solo lectura 
         get => DateTime.Now.Year - FechaNacimiento.Year - (DateTime.Now.Date < FechaNacimiento.Date.AddYears(DateTime.Now.Year - FechaNacimiento.Year) ? 1 : 0);
    } 
}
