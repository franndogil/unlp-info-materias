/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author franc
 */
public class Estante {
    private Libro [] libros;
    private int cantLibros;
    private boolean estado;
    private int maximo;
    
    
    private final Autor autorVacio = new Autor ("", "", "");
    private final Libro libroVacio = new Libro ("","", autorVacio, "");
    
    /*Constructor*/
    
    public Estante(int unMaximo){
        maximo = unMaximo;
        libros = new Libro[maximo];
        cantLibros = 0;
    }
    
    /*Getters*/
    
    public int getCantidadDeLibros(){
        return cantLibros;
    }
    
    public boolean getEstanteLleno(){
        if (cantLibros == 20){
            estado = true;
        }
        else
            estado = false;
        return estado;
    }
    
    public int getMaximosLibros(){
        return maximo;
    }
    
    /*setters*/
    
    public void setCantidadDeLibros(int unaCantidad){
        cantLibros = unaCantidad;
    }
    
    public void setEstado(boolean unEstado){
        estado=unEstado;
    }
    
    public void setMaximosLibros(int unaCantidad){
        maximo = unaCantidad;
    }
    
    public void agregarLibro(Libro nuevoLibro){
        if(cantLibros<20){
            libros [cantLibros] = nuevoLibro;
            cantLibros = cantLibros + 1;
        }
        else
            System.out.println("No hay espacio");
    }
    
    public Libro devolverLibro(String nombreLibro){
        int aux2=0;
        while ((aux2<cantLibros)){
            if(libros[aux2].getTitulo().equals(nombreLibro)){
                return libros[aux2];
            }
            else
                aux2++;
        }
        return libroVacio;
    }
}
