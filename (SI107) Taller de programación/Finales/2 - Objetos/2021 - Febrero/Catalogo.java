package com.mycompany.finalesobjetos.febrero2021;

public class Catalogo {
    private Artista [] artistas;
    private int cantidad;
    
    public Catalogo(){
        this.artistas = new Artista[15];
        this.cantidad = 0;
    }
    
    public void agregarArtista(Artista nuevoArtista){
        if(cantidad < artistas.length){
            artistas[cantidad] = nuevoArtista;
            cantidad++;
        }
        else{
            System.out.println("Catalogo lleno.");
        }
    }
    
    public int cantidadArtistas(String categoria){
        int cant = 0;

        for(int i=0; i<cantidad; i++){
            if(artistas[i].getCategoria().equals(categoria)){
                cant++;
            }
        }
        
        return cant;
    }
    
    public int getCantidad(){
        return cantidad;
    }
}
