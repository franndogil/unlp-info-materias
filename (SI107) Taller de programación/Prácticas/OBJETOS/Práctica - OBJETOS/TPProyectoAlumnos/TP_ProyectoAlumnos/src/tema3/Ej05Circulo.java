/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

/**
 *
 * @author Leonardo
 */

import PaqueteLectura.Lector;

public class Ej05Circulo {
    public static void main(String[] args) {
        System.out.println("Ingrese el radio del circulo: ");
        double radio = Lector.leerInt();
        System.out.println("Ingrese el color de relleno: ");
        String colorR = Lector.leerString();
        System.out.println("Ingrese el color de linea: ");
        String colorL = Lector.leerString();
        
        Circulo circulo = new Circulo (radio, colorR, colorL);
        
        System.out.println("El perimetro del circulo es: " + circulo.calcularPerimetro());
        System.out.println("El area del circulo es: " + circulo.calcularArea());
    }
    
}
