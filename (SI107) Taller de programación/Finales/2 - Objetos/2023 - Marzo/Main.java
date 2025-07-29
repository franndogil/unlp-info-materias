
package com.mycompany.finalesobjetos.marzo2023;

public class Main {
    public static void main(String[] args) {
        Tenista tenistaUno = new Tenista("Franco", 10, 10000);
        Tenista tenistaDos = new Tenista("Sabri", 40, 15000);
        Tenista tenistaTres = new Tenista("Coni", 30, 6000);
        Tenista tenistaCuatro = new Tenista("Ciro", 5, 70000);
        
        Partido partidoSimples = new Partido("13 de noviembre", "Quilmes", tenistaUno, tenistaDos);
        Partido partidoDobles = new Partido("14 de noviembre", "La Plata", tenistaUno, tenistaDos, tenistaTres, tenistaCuatro);
        
        partidoSimples.setFinalizado(6, 4);
        partidoSimples.setFinalizado(4, 6);
        partidoSimples.setFinalizado(6, 4);
        partidoSimples.setFinalizado(6, 4);
        
        partidoDobles.setFinalizado(4, 6);
        partidoDobles.setFinalizado(6, 4);
        partidoDobles.setFinalizado(4, 6);
        partidoDobles.setFinalizado(4, 6);
        
        System.out.println("Partido Simple");
        
        partidoSimples.otorgarPremios(100000);
        System.out.println(tenistaUno.getGanados());
        System.out.println(tenistaUno.getPremios());
        
        System.out.println("Partido Doble");
        
        partidoDobles.otorgarPremios(500000);
        System.out.println(tenistaTres.getGanados());
        System.out.println(tenistaTres.getPremios());
        System.out.println(tenistaCuatro.getGanados());
        System.out.println(tenistaCuatro.getPremios());
    }
}
