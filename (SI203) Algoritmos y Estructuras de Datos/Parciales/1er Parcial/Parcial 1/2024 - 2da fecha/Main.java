package parciales.parcialColapinto;
import java.util.*;

import tp3.ejercicio1.GeneralTree;

public class Main {
    public static void main(String[] args) {
        // Crear el nodo raíz (no se considera en los cálculos)
        Compuesto root = new Compuesto(0, 0); // Nodo raíz
        GeneralTree<Compuesto> arbol = new GeneralTree<>(root);

        // Nivel 1
        GeneralTree<Compuesto> nodo1 = new GeneralTree<>(new Compuesto(10, 0)); // 10 Soft
        GeneralTree<Compuesto> nodo2 = new GeneralTree<>(new Compuesto(20, 0.7)); // 20 Hard
        GeneralTree<Compuesto> nodo3 = new GeneralTree<>(new Compuesto(35, 0.7)); // 35 Hard

        arbol.addChild(nodo1);
        arbol.addChild(nodo2);
        arbol.addChild(nodo3);

        // Nivel 2
        // Hijos de nodo1
        GeneralTree<Compuesto> nodo1_1 = new GeneralTree<>(new Compuesto(10, 0)); // 10 Soft
        nodo1.addChild(nodo1_1);

        // Hijos de nodo2
        GeneralTree<Compuesto> nodo2_1 = new GeneralTree<>(new Compuesto(30, 0.7)); // 30 Hard
        GeneralTree<Compuesto> nodo2_2 = new GeneralTree<>(new Compuesto(15, 0.4)); // 15 Med
        nodo2.addChild(nodo2_1);
        nodo2.addChild(nodo2_2);

        // Hijos de nodo3
        GeneralTree<Compuesto> nodo3_1 = new GeneralTree<>(new Compuesto(15, 0)); // 15 Soft
        nodo3.addChild(nodo3_1);

        // Nivel 3
        // Hijos de nodo1_1
        GeneralTree<Compuesto> nodo1_1_1 = new GeneralTree<>(new Compuesto(30, 0.7)); // 30 Hard
        nodo1_1.addChild(nodo1_1_1);

        // Hijos de nodo2_2
        GeneralTree<Compuesto> nodo2_2_1 = new GeneralTree<>(new Compuesto(15, 0.4)); // 15 Med
        nodo2_2.addChild(nodo2_2_1);

        // El árbol está construido, ahora puedes calcular la mejor estrategia
        Estrategia estrategia = new Estrategia();
        List<Compuesto> mejorEstrategia = estrategia.mejorEstrategia(arbol);

        // Imprimir la mejor estrategia
        System.out.println("Mejor estrategia:");
        for (Compuesto c : mejorEstrategia) {
            System.out.println("Vueltas: " + c.getVueltas() + ", Compuesto: " + c.getCompuesto());
        }
    }
}