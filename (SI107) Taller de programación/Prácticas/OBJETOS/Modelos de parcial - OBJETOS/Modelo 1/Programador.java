
package modelo.pkg1;

public class Programador {
    private String nombre;
    private int dni;
    private double sueldoBasico;
    private int cantLinCod;
    private String lenguajeDePreferencia;
    
    /*constructor*/
    
    public Programador(String nombre, int dni, double sueldoBasico, int cantLinCod, String lenguajeDePreferencia){
        setNombre(nombre);
        setDni(dni);
        setSueldoBasico(sueldoBasico);
        setCantLinCod(cantLinCod);
        setLenguajeDePreferencia(lenguajeDePreferencia);
    }
    
    public Programador(){
    
    }
    
    /*setters*/
    void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    void setDni(int dni){
        this.dni = dni;
    }
    
    void setSueldoBasico(double sueldoBasico){
        this.sueldoBasico = sueldoBasico;
    }
    
    void setCantLinCod(int cantLinCod){
        this.cantLinCod = cantLinCod;
    }
    
    void setLenguajeDePreferencia(String lenguajeDePreferencia){
        this.lenguajeDePreferencia = lenguajeDePreferencia;
    }
    
    /*getters*/
    
    public String getNombre(){
        return nombre;
    }
    
    public int getDni(){
        return dni;
    }
    
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    
    public int getCantLinCod(){
        return cantLinCod;
    }
    
    public String getLenguajeDePreferencia(){
        return lenguajeDePreferencia;
    }
    
    /*metodos*/
    
    public double calcularSueldoFinalProgramador(){
        double sueldoFinal = getSueldoBasico();
        
        if(getCantLinCod()>200){
            sueldoFinal = getSueldoBasico() + 50000;
        }
        
        return sueldoFinal;
    }
    
    void aumentarSueldoBasico(double monto){
        this.sueldoBasico = this.sueldoBasico + monto;
    }
    
    /*toString*/
    
    @Override
    
    public String toString(){
        String aux;
        
        aux = getNombre() + ", " + getDni() + ", " + getLenguajeDePreferencia() + ", " + calcularSueldoFinalProgramador();
        
        return aux;
    }
    
}
