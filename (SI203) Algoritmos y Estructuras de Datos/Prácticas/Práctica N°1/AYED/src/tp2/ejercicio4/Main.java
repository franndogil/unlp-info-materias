package tp2.ejercicio4;

import tp2.ejercicio1.*;

public class Main {
	public static void main(String[] args) {
		BinaryTree<Integer> ab = new BinaryTree<Integer>(10);
        ab.addLeftChild(new BinaryTree<Integer>(2));
        ab.addRightChild(new BinaryTree<Integer>(3));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(5));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(4));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(9));
        ab.getRightChild().addRightChild(new BinaryTree<Integer>(8));

        RedBinariaLlena red = new RedBinariaLlena(ab);
        System.out.println("El mayor retardo posible es de: " + red.retardoEnvio() + " segundos"); 
	}
}
	