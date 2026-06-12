package parciales.parcialSegundaFecha2024;

import tp2.ejercicio1.BinaryTree;

public class Main {
	public static void main(String[] args) {
		
		/*			 1
		 *			/ \
		 *		   2   3 
		 * 		  / \	\
		 * 		 4   5 	 6
		 * 		/
		 * 	   7
		 * */
		
        // Crear el árbol dado
        BinaryTree<Integer> root = new BinaryTree<>(1);
        root.addLeftChild(new BinaryTree<>(2));
        root.addRightChild(new BinaryTree<>(3));
        root.getLeftChild().addLeftChild(new BinaryTree<>(4));
        root.getLeftChild().addRightChild(new BinaryTree<>(5));
        root.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<>(7));
        root.getRightChild().addRightChild(new BinaryTree<>(6));
    
        // Crear la instancia de ParcialArboles
        ParcialArboles parcial = new ParcialArboles(root);
    
        // Generar el nuevo árbol
        BinaryTree<Integer> nuevoArbol = parcial.nuevoTree();
    
        // Imprimir el nuevo árbol (puedes implementar un método para recorrerlo e imprimirlo).
        nuevoArbol.entreNiveles(1,7);
    }
}