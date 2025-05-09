package parciales.parcial2;

import parciales.parcial2.Parcial;
import tp3.ejercicio1.GeneralTree;

public class Main {
    public static void main(String[] args) {

        GeneralTree<Integer> root = new GeneralTree<>(20);
        GeneralTree<Integer> node1 = new GeneralTree<>(1);
        GeneralTree<Integer> node2 = new GeneralTree<>(45);
        GeneralTree<Integer> node3 = new GeneralTree<>(21);
        GeneralTree<Integer> node4 = new GeneralTree<>(6);
        GeneralTree<Integer> node5 = new GeneralTree<>(0);
        GeneralTree<Integer> node6 = new GeneralTree<>(8);
        GeneralTree<Integer> node7 = new GeneralTree<>(10);
        GeneralTree<Integer> node8 = new GeneralTree<>(22);
        GeneralTree<Integer> node9 = new GeneralTree<>(2);

        root.addChild(node1);
        root.addChild(node2);
        root.addChild(node3);

        node1.addChild(node4);
        node1.addChild(node5);

        node2.addChild(node6);

        node3.addChild(node7);

        node7.addChild(node8);
        node7.addChild(node9);

        Parcial parcial = new Parcial();
        int result = parcial.resolver(root);

        System.out.println("Resultado: " + result);
    }
}