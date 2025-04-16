package tp2.ejercicio3;

import java.util.*;
import tp2.ejercicio1.BinaryTree;

public class ContadorArbol {
	private BinaryTree <Integer> tree;
	
	public LinkedList <Integer> numerosParesA(){					//INorden
		LinkedList <Integer> listaEnteros = new LinkedList<>();		
		if(!tree.isEmpty()) {
			numerosParesRecursivaA(tree, listaEnteros);
		}
		return listaEnteros;
	}
	
	private void numerosParesRecursivaA(BinaryTree<Integer> tree, LinkedList<Integer> list) {
		numerosParesRecursivaA(tree.getLeftChild(), list);
		if((tree.getData() % 2) == 0) {
			list.add(tree.getData());
		}
		numerosParesRecursivaA(tree.getRightChild(), list);
	}
	
	public LinkedList<Integer> numerosParesB(){			//POSTorden
		LinkedList <Integer> listaEnteros = new LinkedList<>();		
		if(!tree.isEmpty()) {
			numerosParesRecursivaB(tree, listaEnteros);
		}
		return listaEnteros;
	}
	
	private void numerosParesRecursivaB(BinaryTree<Integer> tree, LinkedList<Integer> list) {
		numerosParesRecursivaB(tree.getLeftChild(), list);
		numerosParesRecursivaB(tree.getRightChild(), list);
		if((tree.getData() % 2) == 0) {
			list.add(tree.getData());
		}
	}
	
}