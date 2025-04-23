package tp2.ejercicio7;

import tp2.ejercicio1.*;

public class ParcialArboles {
	private BinaryTree <Integer> tree;
	
	public boolean isLeftTree (int num) {
		return isLeftTreeRecursiva(tree, num);
	}
	
	private boolean isLeftTreeRecursiva(BinaryTree<Integer> tree, int num){
		if(tree.isLeaf()){ 		//si no tiene hijos, es hoja, retorna false
			return false;		
		}
		
		boolean state = false;		//siempre es falso hasta que se demuestre lo contrario
		int chi = 0;	//contador de 
		int chd = 0;
		
		if(tree.getData()==num){		//si el numero es igual empiezo
			if(tree.hasLeftChild()) {
				chi = contadorDeHijosUnicos(tree.getLeftChild());
			}
			if(tree.hasRightChild()) {
				chd = contadorDeHijosUnicos(tree.getRightChild());
			}
			
			if(chi > chd) state = true;
			
		}
		else {	//si el numero es diferente, sigo buscando en los hijos
			if(tree.hasLeftChild()) state = isLeftTreeRecursiva(tree.getLeftChild(), num);
			if(tree.hasRightChild()) state = isLeftTreeRecursiva(tree.getRightChild(), num);
		}
		
		return state;
	}
															//entra el 23
	private int contadorDeHijosUnicos(BinaryTree<Integer> tree) {		//recursiva para contar hijos unicos dentro de un camino
		int suma = 0;
		if(tree.hasLeftChild()&&!tree.hasRightChild()){
			suma += 1 + contadorDeHijosUnicos(tree.getLeftChild());
		}
		if(!tree.hasLeftChild()&&tree.hasRightChild()){
			suma += 1 + contadorDeHijosUnicos(tree.getRightChild());
		}
		return suma;
	}
}

