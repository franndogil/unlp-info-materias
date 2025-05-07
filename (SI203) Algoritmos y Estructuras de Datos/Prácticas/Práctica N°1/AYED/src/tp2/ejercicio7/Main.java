package tp2.ejercicio7;

import tp2.ejercicio1.*;

public class Main {
    public static void main(String[] args) {
    	BinaryTree<Integer> root = new BinaryTree<>(2);
        root.addLeftChild(new BinaryTree<>(7));
        root.addRightChild(new BinaryTree<>(-5));
        
        root.getLeftChild().addLeftChild(new BinaryTree<>(23));
        root.getLeftChild().addRightChild(new BinaryTree<>(6));
        
        root.getRightChild().addLeftChild(new BinaryTree<>(19));
        root.getRightChild().getLeftChild().addRightChild(new BinaryTree<>(4));
        
        root.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<>(-3));
        
        root.getLeftChild().getRightChild().addLeftChild(new BinaryTree<>(55));
        root.getLeftChild().getRightChild().addRightChild(new BinaryTree<>(11));
        
        root.getRightChild().getLeftChild().getRightChild().addLeftChild(new BinaryTree<>(18));


        ParcialArboles parcial = new ParcialArboles(root);
        
        System.out.println(parcial.isLeftTree(-5));
    }
}
