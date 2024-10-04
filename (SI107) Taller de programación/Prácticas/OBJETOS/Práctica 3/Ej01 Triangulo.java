/*
 B- Realizar un programa que instancie un triángulo, le cargue información leída desde
 teclado e informe en consola el perímetro y el área.
 */
package tema3;

import PaqueteLectura.Lector;
public class Ej01B {
    public static void main(String[] args) {
        double lado1=0;
        double lado2=0;
        double lado3=0;
        String colorRelleno;
        String colorLinea;
        
        System.out.println("Ingrese el largo del primer lado: ");
        lado1 = Lector.leerDouble();
        System.out.println("Ingrese el largo del segundo lado: ");
        lado2 = Lector.leerDouble();
        System.out.println("Ingrese el largo del tercer lado: ");
        lado3 = Lector.leerDouble();
        System.out.println("Ingrese el color de relleno: ");
        colorRelleno = Lector.leerString();
        System.out.println("Ingrese el color de linea: ");
        colorLinea = Lector.leerString();
        
        Triangulo primerTriangulo = new Triangulo(lado1, lado2, lado3, colorRelleno, colorLinea);
        
        double perimetro = primerTriangulo.calcularPerimetro();
        System.out.println("El perimetro del triangulo es: " + perimetro);
        
        double area = primerTriangulo.calcularArea();
        System.out.println("El area del triangulo es: " + area);
    }
}
