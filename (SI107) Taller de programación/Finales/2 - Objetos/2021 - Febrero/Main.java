
package com.mycompany.finalesobjetos.febrero2021;

public class Main {

    public static void main(String[] args) {
        Catalogo catalogo = new Catalogo();
        
        //artistas
        Artista artistaUno = new Artista("Franco", "Musica");
        Artista artistaDos = new Artista("Coni", "Pintura");
        Artista artistaTres = new Artista("Coni", "Musica");
        Artista artistaCuatro = new Artista("Coni", "Pintura");
        
        catalogo.agregarArtista(artistaUno);
        catalogo.agregarArtista(artistaDos);
        catalogo.agregarArtista(artistaTres);
        catalogo.agregarArtista(artistaCuatro);
        
        System.out.println(catalogo.getCantidad());
        
        System.out.print(catalogo.cantidadArtistas("Pintura"));
    }
    
}
