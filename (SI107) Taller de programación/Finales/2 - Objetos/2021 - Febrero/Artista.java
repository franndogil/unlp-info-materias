package com.mycompany.finalesobjetos.febrero2021;

public class Artista {
    private String nombre;
    private String categoria;
    
    public Artista(String nombre, String categoria){
        this.categoria = categoria;
        this.nombre = nombre;
    }
    
    public String getCategoria(){
        return categoria;
    }
}
