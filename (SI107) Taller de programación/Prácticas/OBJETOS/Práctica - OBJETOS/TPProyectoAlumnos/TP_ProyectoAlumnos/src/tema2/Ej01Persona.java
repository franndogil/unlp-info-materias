
package tema2;

import PaqueteLectura.Lector;

public class Ej01Persona {
    public static void main(String[] args) {
        //Persona p = new Persona("Franco", 43851187, 22 );
        
        Persona p = new Persona();
        
        System.out.println("Ingrese el nombre: ");
        p.setNombre(Lector.leerString());
        System.out.println("Ingrese el DNI: ");
        p.setDNI(Lector.leerInt());
        System.out.println("Ingrese la edad: ");
        p.setEdad(Lector.leerInt());
        
        System.out.println("Nombre: ");
        System.out.println(p.getNombre());
        System.out.println("DNI: ");
        System.out.println(p.getDNI());
        System.out.println("Edad: ");
        System.out.println(p.getEdad());
                
    } 
}
