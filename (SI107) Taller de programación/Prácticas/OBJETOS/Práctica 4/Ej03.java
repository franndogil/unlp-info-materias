
package tema4;

public class Ej03 {

    public static void main(String[] args) {
        Persona persona = new Persona ("Franco", 4444444, 22);
        System.out.println(persona.toString());
        
        Trabajador trabajador = new Trabajador ("Community Manager", "Sabrina", 5555555, 22);
        System.out.println(trabajador.toString());
    }
    
}
