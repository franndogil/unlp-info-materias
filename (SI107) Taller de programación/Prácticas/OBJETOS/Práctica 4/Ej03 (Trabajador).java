/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Leonardo
 */
public class Trabajador extends Persona{
    private String trabajo;
    
    /*constructor*/
    public Trabajador(String trabajo, String nombre, int dni ,int edad){
        super(nombre, dni, edad);
        setTrabajo(trabajo);
    }
    
    /*setters*/
    public void setTrabajo(String trabajo){
        this.trabajo=trabajo;
    }
    
    /*getters*/
    public String getTrabajo(){
        return trabajo;
    }
    
    /*toString*/
    
    public String toString(){
        String aux;
        aux = super.toString() + " Soy " + getTrabajo() + ".";
        
        return aux;
    }
    
}
