
package tema4;

public class Entrenador extends Empleado{
    private int campeonatosGanados;
    
    /*setters*/
    public void setCampeonatosGanados(int campeonatosGanados){
        this.campeonatosGanados = campeonatosGanados;
    }
    
    /*getters*/
    public int getCampeonatosGanados(){
        return campeonatosGanados;
    }
    
    /*constructor*/
    public Entrenador(int campeonatosGanados, String nombre, double sueldoBasico, int antiguedad){
        super(nombre, sueldoBasico, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }
    
    /*metodos*/
    public double calcularEfectividad(){
        double efectividad;
        efectividad = (double)getCampeonatosGanados() / getAntiguedad ();
        return efectividad;
    }
    
    public double calcularSueldoACobrar(){
        double sueldo=0;
        if(getCampeonatosGanados()==0){
            sueldo = getSueldoBasico();
        }
        if((getCampeonatosGanados()>=1)&&(getCampeonatosGanados()<=4)){
            sueldo = getSueldoBasico() + 5000;
        }
        if((getCampeonatosGanados()>=5)&&(getCampeonatosGanados()<=10)){
            sueldo = getSueldoBasico() + 30000;
        }
        if(getCampeonatosGanados()>10){
            sueldo = getSueldoBasico() + 50000;
        }   
        return sueldo;
    }
    /*to string*/
    
    public String toString(){
        String aux;
        aux = super.toString() + " Campeonatos Ganados: " + getCampeonatosGanados();
        
        return aux;
    }
}


//negro - negro
//marron - rojo
//amarillo - celeste