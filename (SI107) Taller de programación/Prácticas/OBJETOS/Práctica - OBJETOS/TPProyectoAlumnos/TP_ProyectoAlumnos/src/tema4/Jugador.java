
package tema4;

public class Jugador extends Empleado{
    private int cantPartidos;
    private int golesAnotados;
    
    
    /*setters*/
    public void setPartidosJugados(int cantPartidos){
        this.cantPartidos = cantPartidos;
    }
    
    public void setGolesAnotados(int golesAnotados){
        this.golesAnotados = golesAnotados;
    }
    
    /*getters*/
    
    public int getPartidosJugados(){
        return cantPartidos;
    }
    
    public int getGolesAnotados(){
        return golesAnotados;
    }
    
    /*constructor*/
    
    public Jugador(int cantPartidos, int golesAnotados, String nombre, double sueldoBasico, int antiguedad){
        super(nombre, sueldoBasico, antiguedad);
        this.cantPartidos = cantPartidos;
        this.golesAnotados = golesAnotados;
    }
    
    /*metodos*/
    
    public double calcularEfectividad(){
        double efectividad;
        
        efectividad = (double)getGolesAnotados() / getPartidosJugados();
        
        return efectividad;
    }
    
    public double calcularSueldoACobrar(){
        double sueldo;
        
        if(calcularEfectividad()>0.5){
            sueldo = getSueldoBasico() * 2;
        }
        else{
            sueldo = getSueldoBasico();
        }
        return sueldo;
    }
    
    public String toString(){
        String aux;
        
        aux = super.toString() +  " Partidos Jugados: " + getPartidosJugados() + " Goles anotados: " + getGolesAnotados();
        
        return aux;
    }
}
