package tp2.ejercicio6;

import tp2.ejercicio1.*;

public class Transformacion {
	private BinaryTree<Integer> tree;
	
	public Transformacion(BinaryTree<Integer> tree) {
		this.tree = tree;
	}
	
	public BinaryTree<Integer> suma(){
		sumaArbol(tree);
		return tree;
	}	
	
	private int sumaArbol(BinaryTree<Integer> tree) {
		int suma = 0;
		if(tree.isLeaf()) {
			suma = tree.getData();
			tree.setData(0);
			return suma;
		}
		if(tree.hasLeftChild()) suma += sumaArbol(tree.getLeftChild());
		if(tree.hasRightChild()) suma += sumaArbol(tree.getRightChild());
		
		int actual = tree.getData();		
		tree.setData(suma);
		return suma + actual;
	}
}
