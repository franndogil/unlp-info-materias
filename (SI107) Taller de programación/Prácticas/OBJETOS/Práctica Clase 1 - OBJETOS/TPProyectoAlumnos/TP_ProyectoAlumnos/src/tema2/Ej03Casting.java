/*
3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */

package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Casting {
    public static void main(String[] args) {
        Persona [][] matrizCasting = new Persona [5][8];
        
        String nombre = GeneradorAleatorio.generarString(3);
        int edad = GeneradorAleatorio.generarInt(100);
        int dni = GeneradorAleatorio.generarInt(100);
        
        int aux = 1;
        int i=0, j=0;
        
        while((aux<41)&&(nombre != "ZZZ")&&(i<5)&&(j<8)){
            
        }
    }
    
}
