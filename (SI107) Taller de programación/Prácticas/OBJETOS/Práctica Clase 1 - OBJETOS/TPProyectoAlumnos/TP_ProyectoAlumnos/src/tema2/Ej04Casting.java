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
        
        String nombre = GeneradorAleatorio.generarString(3);
        int edad = GeneradorAleatorio.generarInt(100);
        int dni = GeneradorAleatorio.generarInt(100);
        
        int i=0, j=0, cupos=0;
        
        while ((cupos<40)&&(!nombre.equals("ZZZ"))){
            matrizCasting [i][j]=new Persona(nombre, dni, edad);
            
            j++;
            cupos++;
            
            if(j==8){  
                j=0;
                i++;
            }
            
            nombre = GeneradorAleatorio.generarString(3);
            edad = GeneradorAleatorio.generarInt(100);
            dni = GeneradorAleatorio.generarInt(100);
        }
        
        int aux=0;
        
        aux=cupos;
        cupos=0;
        i=0;
        j=0;
        
        while(cupos<aux){
            System.out.println("Dia: " + (i+1) + " Turno: "+ (j+1) +" Nombre: " + matrizCasting[i][j].getNombre());
            
            j++;
            cupos++;
            
            if(j==8){
                j=0;
                i++;
            }
        }
    }
    
}
