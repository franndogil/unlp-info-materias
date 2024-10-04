/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double costoPorNoche;
    private boolean estado;
    private Cliente cliente;
    
    /*constructor*/
     public Habitacion(){
        costoPorNoche = GeneradorAleatorio.generarDouble(6001)+2000;
        cliente = null;
        estado = false;
    }
    
    /*setters*/
    
    public void setEstado(boolean unEstado){
        estado = unEstado;
    }
    
    public void setCostoPorNoche(double unCosto){
        costoPorNoche = unCosto;
    }
    
    public void setCliente (Cliente unCliente){
        cliente = unCliente;
        estado = true;
    }
    
    /*getters*/
    
    public boolean getEstado(){
        return estado;
    }
    
    public double getCostoPorNoche(){
        return costoPorNoche;
    }
    
    public Cliente getCliente(){
        return cliente;
    }
    
    @Override
    public String toString() {
        String aux="";
        String estadoAct;

        if(estado){
            estadoAct = "Ocupada";
        }
        else
            estadoAct = "Libre";
        
        aux = " Costo por noche: $" + costoPorNoche + " Disponibilidad: " + estadoAct;

        if(estado){
            aux += " Cliente: " + cliente.toString();
        }
        
    return aux;
    }
    
}
