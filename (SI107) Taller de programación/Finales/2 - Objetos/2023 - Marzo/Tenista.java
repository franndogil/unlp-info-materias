package com.mycompany.finalesobjetos.marzo2023;

public class Tenista {
    private String nombre;
    private int cantGanados;
    private double premios;
    
    public Tenista(String nombre, int cantGanados, double premios){
        this.nombre = nombre;
        this.cantGanados = cantGanados;
        this.premios = premios;
    }
    
    public void setPremios(double premios){
        this.premios += premios;
    }
    
    public void setGanados(){
        this.cantGanados++;
    }
    
    public int getGanados(){
        return this.cantGanados;
    }
    
    public double getPremios(){
        return this.premios;
    }
}
