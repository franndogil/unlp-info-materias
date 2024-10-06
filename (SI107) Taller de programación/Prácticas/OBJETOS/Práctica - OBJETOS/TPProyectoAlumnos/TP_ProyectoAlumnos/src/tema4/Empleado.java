package tema4;

public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;
    
    /*constructor*/
    
    public Empleado (String nombre, double sueldoBasico, int antiguedad){
        setNombre(nombre);
        setSueldoBasico(sueldoBasico);
        setAntiguedad(antiguedad);
    }
    
    /*setters*/
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public void setSueldoBasico(double sueldoBasico){
        this.sueldoBasico = sueldoBasico;
    }
    
    public void setAntiguedad(int antiguedad){
        this.antiguedad = antiguedad;
    }
    
    /*getters*/
    
    public String getNombre(){
        return nombre;
    }
    
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    
    public int getAntiguedad(){
        return antiguedad;
    }
    
    /*abstract*/

    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
    
    /*toString*/
    
    @Override
    public String toString(){
        String aux;
        
        aux = "Nombre: " + getNombre() + " Sueldo a cobrar: " + calcularSueldoACobrar() +
               " Efectividad: " + calcularEfectividad();
            
        return aux;
    }
}
