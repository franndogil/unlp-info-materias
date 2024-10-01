/*
 4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej04Casting {
    public static void main(String[] args) {
        Persona [][] matrizCasting = new Persona [5][8];
        int []  vecCont = new int [5];
        
        String nombre = GeneradorAleatorio.generarString(3);
        int edad = GeneradorAleatorio.generarInt(100);
        int dni = GeneradorAleatorio.generarInt(100);
        int dia = GeneradorAleatorio.generarInt(5);
        
        int i=0, j=0 , cupos=0;
        
        for (i=0; i<5; i++){
            vecCont[i]=0;
        }
        
        while ((cupos<40) && (!nombre.equals("ZZZ"))){
            if(vecCont[dia] < 8){  //si la matriz (dia y posicion) es nula Y el cupo diario sea menor a 8 hacer
                
                matrizCasting [dia][vecCont[dia]] = new Persona(nombre, dni, edad);
                vecCont[dia]++; //sumo 1 al contador de cupos por dia
                cupos++;    //sumo 1 cupo al contador global
            }
            else
                System.out.println("No existe turno en este dia (dia: " + (dia+1) + ")");
            
            nombre = GeneradorAleatorio.generarString(3);
            edad = GeneradorAleatorio.generarInt(100);
            dni = GeneradorAleatorio.generarInt(100);
            dia = GeneradorAleatorio.generarInt(5);
        }
        
        int aux;
        
        aux=cupos;
        cupos=0;
        i=0;
        j=0;
        
        for (i=0; i<5; i++){
            System.out.println("Dia: " + (i+1) + " Cantidad de inscriptos al casting: "+ (vecCont[i]));
            
            for (j=0; j < (vecCont[i]); j++){
                System.out.println("Nombre: " + matrizCasting[i][j].getNombre());
            }
        }
    }
    
}
