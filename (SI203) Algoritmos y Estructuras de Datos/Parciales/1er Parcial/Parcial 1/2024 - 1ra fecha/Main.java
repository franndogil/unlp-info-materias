package parciales.parcialPrimeraFecha2024;

import tp3.ejercicio1.*;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        // Crear el árbol
        GeneralTree<Integer> root = new GeneralTree<>(1); // Nodo raíz con valor 1
        GeneralTree<Integer> child1 = new GeneralTree<>(2); // Hijo con valor 2
        GeneralTree<Integer> child2 = new GeneralTree<>(3); // Hijo con valor 3
        GeneralTree<Integer> child3 = new GeneralTree<>(4); // Hijo con valor 4

        // Agregar hijos al nodo raíz
        root.addChild(child1);
        root.addChild(child2);
        root.addChild(child3);

        // Agregar hijos al nodo 2
        GeneralTree<Integer> child1_1 = new GeneralTree<>(5); // Hijo de 2 con valor 5
        GeneralTree<Integer> child1_2 = new GeneralTree<>(6); // Hijo de 2 con valor 6
        child1.addChild(child1_1);
        child1.addChild(child1_2);

        // Agregar hijos al nodo 3
        GeneralTree<Integer> child2_1 = new GeneralTree<>(7); // Hijo de 3 con valor 7
        child2.addChild(child2_1);

        // Crear una instancia de ParcialArboles
        ParcialArboles parcial = new ParcialArboles(root);

        // Llamar al método camino con un número (por ejemplo, 2)
        List<Integer> resultado = parcial.camino(2);

        /*		 1
      		   / | \
     		  2  3  4
    		 / \
   			5   6
       			|
       			7		*/
        
        // Imprimir el resultado
        System.out.println("Camino encontrado:");
        for (Integer valor : resultado) {
            System.out.print(valor + " ");
        }
    }
}