/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;

/**
 *
 * @author Franco Dogil
 */
import PaqueteLectura.GeneradorAleatorio;

public class Ej02VectorPersonas {
    public static void main(String[] args) {
        
        Persona [] vectorPersonas = new Persona [15];
        
        int i=0;
        
        GeneradorAleatorio.iniciar();
        
        int dni = GeneradorAleatorio.generarInt(100);
        int edad = GeneradorAleatorio.generarInt(100);
        String nombre = GeneradorAleatorio.generarString(5);
        
        while((i<15)&&(edad!=0)){
            vectorPersonas[i] = new Persona (nombre, dni, edad);
            i=i+1;
            
            dni = GeneradorAleatorio.generarInt(100);
            edad = GeneradorAleatorio.generarInt(100);
            nombre = GeneradorAleatorio.generarString(5);
        }
        
        /* for(i=0; i<15; i++){
            System.out.println(vectorPersonas[i]);
        }
        */
        
        int cant = 0, mendni = 200, posmendni=0;
        
        for (i=0;i<15; i++){
            if(vectorPersonas[i].getDNI()<=mendni){
                mendni = vectorPersonas[i].getDNI();
                posmendni = i; 
            }
            if(vectorPersonas[i].getEdad()>65){
                cant = cant + 1;
            }
        }
        
        System.out.println("Cantidad de personas mayores a 65 años: " + cant);
        System.out.println("Representacion de la persona con menor DNI: ");
        System.out.println(vectorPersonas[posmendni]);
      
    }
}
