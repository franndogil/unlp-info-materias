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
    private Libro [] libros = new Libro [20];
    private int cantLibros = 0;
    private boolean lleno;
    private int aux2=0;
    private Autor autorVacio = new Autor ("", "", "");
    private Libro libroVacio = new Libro ("","", autorVacio, "");
    
    /*Getters*/
    
    public int getCantidadDeLibros(){
        return cantLibros;
    }
    
    public boolean getEstanteLleno(){
        if (cantLibros == 20){
            lleno = true;
        }
        else
            lleno = false;
        return lleno;
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
