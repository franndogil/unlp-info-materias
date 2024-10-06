
package tema4;

public class Ej02 {

    public static void main(String[] args) {
        Jugador uno = new Jugador (10, 16, "Franco", 5000, 3);
        
        System.out.println(uno.toString());
        
        Entrenador dos = new Entrenador(3, "Jose", 10000, 5);
        System.out.println(dos.toString());
    }
    
}
