
package tema4;

public class Ej01 {

    public static void main(String[] args) {
        Triangulo uno = new Triangulo (10,23,32,"Rojo","Verde");    //instancia de triangulo
        System.out.println(uno.toString());
       
        Circulo dos = new Circulo (10, "Amarillo", "Azul");     //instancia de circulo
        System.out.println(dos.toString());
        
        Cuadrado tres = new Cuadrado (10, "Negro", "Celeste");
        System.out.println(tres.toString());
        
        Rectangulo cuatro = new Rectangulo (10, 20, "Gris", "Violeta");
        System.out.println(cuatro.toString());
        
        cuatro.despintar();     //metodo despintar
        
        System.out.println(cuatro.toString());      //prueba de funcionamiento        
    }
}

