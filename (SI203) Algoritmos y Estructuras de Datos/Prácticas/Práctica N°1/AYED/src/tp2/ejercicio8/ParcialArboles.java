package tp2.ejercicio8;
import tp2.ejercicio1.BinaryTree;

public class ParcialArboles {
	
	public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
		if(arbol1 == null || arbol2 == null) {
			return false;
		}
		boolean estructuraValida = recorrer(arbol1, arbol2);
		
		return estructuraValida;
	}
	
	private boolean recorrer(BinaryTree<Integer> ab1, BinaryTree<Integer> ab2) {
		boolean esValida = true;
		if(ab1.getData() == ab2.getData()) {
			if(ab1.hasLeftChild()){
				if(ab2.hasLeftChild()) {
					esValida = recorrer(ab1.getLeftChild(), ab2.getLeftChild());
				}else {
					esValida = false;
				}
			}
			if(ab1.hasRightChild()) {				//anido los if para 
				if(ab2.hasRightChild()) {
					esValida = esValida && recorrer(ab2.getRightChild(), ab2.getRightChild());
				}
				else {
					esValida = false;
				}
			}	
		}
		else {
			esValida = false;
		}
		return esValida;
	}
}
