
package finalesobjetos.marzo2024;

public class Empleado {
    private String nombre;
    private String apellido;
    private int antiguedad;
    
    public Empleado(String nombre, String apellido, int antiguedad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }
    
    @Override
    
    public String toString(){
        String retorno = "";
        
        retorno += "Nombre: " + this.nombre;
        retorno += " Apellido: " + this.apellido;
        retorno += " Antiguedad: " + this.antiguedad + " anios.";
        
        return retorno;
    }
}
