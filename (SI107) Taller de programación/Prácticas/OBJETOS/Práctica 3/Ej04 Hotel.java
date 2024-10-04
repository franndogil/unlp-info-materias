/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;
import PaqueteLectura.Lector;
public class Ej04Hotel {
    public static void main(String[] args) {
        System.out.println("Ingrese la cantidad de habitaciones: ");
        int n=Lector.leerInt();
        Hotel hotel = new Hotel(n);
        
        for (int i=1; i<=n; i++){
            Cliente cliente = new Cliente("Franco", 33322, 22); 
            hotel.ingresarCliente(cliente, i);
        }

        /*System.out.println("Nombre: " + hotel.getHabitacion(n).getCliente().getNombre());        //prueba de que lo guardo bien
        System.out.println("DNI: " + hotel.getHabitacion(n).getCliente().getDni());
        System.out.println("Edad: " + hotel.getHabitacion(n).getCliente().getEdad());
        System.out.println("Costo por noche: " + hotel.getHabitacion(n).getCostoPorNoche());
        System.out.println("Estado: " + hotel.getHabitacion(n).getEstado());
        
        System.out.println("Nombre: " + hotel.getHabitacion(n).getCliente().getNombre());        //prueba de que actualiza el precio
        System.out.println("DNI: " + hotel.getHabitacion(n).getCliente().getDni());
        System.out.println("Edad: " + hotel.getHabitacion(n).getCliente().getEdad());
        System.out.println("Costo por noche: " + hotel.getHabitacion(n).getCostoPorNoche());
        System.out.println("Estado: " + hotel.getHabitacion(n).getEstado());*/
        
        System.out.println(hotel.toString());   
        
        hotel.aumentarCosto(500);
        
        System.out.println(hotel.toString()); 
    }
    
}
