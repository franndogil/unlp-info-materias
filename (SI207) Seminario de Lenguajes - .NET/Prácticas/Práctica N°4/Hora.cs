/*4) Codificar la clase Hora de tal forma que el siguiente código produzca la salida por consola que se observa. */

/*
 Hora h = new Hora(23,30,15);
 h.Imprimir
 23 horas, 30 minutos y 15 segundos */

using System;

namespace teoria4;

public class Hora
{
    private int horas;
    private int minutos;
    private int segundos;
    public Hora(){
        this.horas = 0;
        this.minutos = 0;
        this.segundos = 0;
    }

    public Hora(int horas, int minutos, int segundos){
        this.horas =  horas;
        this.minutos = minutos;
        this.segundos = segundos;
    } 

    public void Imprimir(){
        Console.WriteLine($"{horas} horas, {minutos} minutos y {segundos} segundos");
    }
}
