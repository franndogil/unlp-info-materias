/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

import PaqueteLectura.Lector;

public class Ej03Estante {

    public static void main(String[] args) {
        System.out.println("Ingrese una cantidad maxima de libros: ");
        int cantMax = Lector.leerInt();
        Estante estanteG = new Estante(cantMax);
        Libro libroG;
        Autor autorG;
        int i=0;
        
        System.out.println("Ingrese el titulo: ");
        String titulo = Lector.leerString();
        System.out.println("Ingrese la editorial: ");
        String editorial = Lector.leerString();
        System.out.println("Ingrese el ISBN: ");
        String isbn = Lector.leerString();
        System.out.println("Ingrese los datos del autor: ");
        System.out.println("Ingrese el nombre: ");
        String nombre = Lector.leerString();
        System.out.println("Ingrese la biografía: ");
        String bio = Lector.leerString();
        System.out.println("Ingrese el origen: ");
        String origen = Lector.leerString();
        autorG = new Autor(nombre, bio, origen);
        libroG = new Libro (titulo, editorial, autorG, isbn);
        
        while(((estanteG.getCantidadDeLibros()<estanteG.getMaximosLibros()))&&(!libroG.getTitulo().equals("ZZZ"))){
            estanteG.agregarLibro(libroG);
            
            System.out.println("Ingrese el titulo: ");
            titulo = Lector.leerString();
            System.out.println("Ingrese la editorial: ");
            editorial = Lector.leerString();
            System.out.println("Ingrese el ISBN: ");
            isbn = Lector.leerString();
            System.out.println("Ingrese los datos del autor: ");
            System.out.println("Ingrese el nombre: ");
            nombre = Lector.leerString();
            System.out.println("Ingrese la biografía: ");
            bio = Lector.leerString();
            System.out.println("Ingrese el origen: ");
            origen = Lector.leerString();
            autorG = new Autor(nombre, bio, origen);
            libroG = new Libro (titulo, editorial, autorG, isbn);
        }
        
        
        System.out.println("Cantidad de libros almacenados en el estante: " + estanteG.getCantidadDeLibros());
        Libro libro2 = estanteG.devolverLibro("Mujercitas");
        System.out.println("Autor del libro a buscar: " + libro2.getPrimerAutor().toString());
    }
    
}
