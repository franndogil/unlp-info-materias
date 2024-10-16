
package tema5;

public class Corista extends Persona {
    private int tonoFundamental;

    public Corista(int tonoFundamental, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }
    
    
    
}
