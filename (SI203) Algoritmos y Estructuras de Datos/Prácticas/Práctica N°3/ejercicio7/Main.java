package tp3.ejercicio7;

import tp3.ejercicio1.GeneralTree;
import java.util.*;

public class Main {	
    public static void main(String[] args) {

        GeneralTree<Integer> raiz = new GeneralTree<>(1);

        GeneralTree<Integer> childLeft = new GeneralTree<>(2);
        GeneralTree<Integer> childRight = new GeneralTree<>(3);

        GeneralTree<Integer> childLeftLeft = new GeneralTree<>(4);
        GeneralTree<Integer> childLeftRight = new GeneralTree<>(5);

        GeneralTree<Integer> childRightLeft = new GeneralTree<>(6);
        GeneralTree<Integer> childRightRight = new GeneralTree<>(7);

        GeneralTree<Integer> leafRight = new GeneralTree<>(9);

        raiz.addChild(childLeft);
        raiz.addChild(childRight);

        childLeft.addChild(childLeftLeft);
        childLeft.addChild(childLeftRight);

        childRight.addChild(childRightLeft);
        childRight.addChild(childRightRight);

        childRightRight.addChild(leafRight);

        Caminos caminos = new Caminos(raiz);

        List<Integer> caminoLargo = caminos.caminoAHojaMasLejana();
        System.out.println("Camino a la hoja más lejana: " + caminoLargo);
    }
}