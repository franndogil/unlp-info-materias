/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.pkg1;

public class Lider extends Programador{
    private int antiguedad;
    private int cantProyectos;
    
    /*constructor*/
    
    public Lider(String nombre, int dni, double sueldoBasico, int cantLinCod, String lenguajeDePreferencia, int antiguedad, int cantProyectos){
        super(nombre, dni, sueldoBasico, cantLinCod, lenguajeDePreferencia);
        setAntiguedad(antiguedad);
        setCantProyectos(cantProyectos);
    }
    
    /*setters*/
    void setAntiguedad(int antiguedad){
        this.antiguedad = antiguedad;
    }
    
    void setCantProyectos(int cantProyectos){
        this.cantProyectos = cantProyectos;
    }
    
    /*getters*/
    public int getAntiguedad(){
        return antiguedad;
    }
    
    public int getCantProyectos(){
        return cantProyectos;
    }
    
    /*metodos*/
    
    public double calcularSueldoFinalLider(){
        double sueldoFinal = calcularSueldoFinalProgramador() + (getCantProyectos()*20000) + (getAntiguedad()*10000);
   
        return sueldoFinal;
    }
    
    /*toString*/
    
    @Override
    public String toString(){
        String aux="";
        
        aux = getNombre() + ", " + getDni() + ", " + getLenguajeDePreferencia() + ", " + calcularSueldoFinalLider();
        
        return aux;
    }
}
