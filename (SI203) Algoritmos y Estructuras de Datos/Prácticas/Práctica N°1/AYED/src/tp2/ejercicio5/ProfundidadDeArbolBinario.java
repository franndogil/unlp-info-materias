package tp2.ejercicio5;

import tp1.ejercicio8.*;
import tp2.ejercicio1.*;

public class ProfundidadDeArbolBinario {
	private BinaryTree<Integer> arbol;
	
	public ProfundidadDeArbolBinario(BinaryTree<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public int sumaElementosProfundidad(int profundidad) {
		if(arbol.isEmpty()) return 0;
		
		Queue<BinaryTree<Integer>> cola = new Queue<>();
		cola.enqueue(arbol);
		
		int nivelActual = 0;
		int suma = 0;
		
		while(nivelActual <= profundidad) {
			int tamañoCola = cola.size();
			
			if(nivelActual == profundidad) {
				for (int i = 0; i < tamañoCola; i++) {
					BinaryTree<Integer> nodo = cola.dequeue();
					suma += nodo.getData();
					
				}
			} else {
				for (int i = 0; i < tamañoCola; i++) {
					BinaryTree<Integer> nodo = cola.dequeue();
					if (nodo.hasLeftChild()) cola.enqueue(nodo.getLeftChild());
					if (nodo.hasRightChild()) cola.enqueue(nodo.getRightChild());
				}
			}
			nivelActual++;
		}
		return suma;
	}
}