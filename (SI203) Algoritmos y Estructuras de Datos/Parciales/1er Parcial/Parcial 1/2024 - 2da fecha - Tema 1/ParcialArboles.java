package parciales.parcialSegundaFecha2024;

import tp2.ejercicio1.BinaryTree;

public class ParcialArboles {
	private BinaryTree<Integer> arbol;
	
	public ParcialArboles(BinaryTree<Integer>arbol) {
		this.arbol = arbol;
	}
	
	public BinaryTree<Integer> nuevoTree(){
		if(arbol == null) return null;
		if(arbol.isEmpty()) return new BinaryTree<Integer>();
		
		BinaryTree<Integer> nAb = new BinaryTree<>();
		
		recorrer(arbol, nAb, 0);
		
		return nAb;
	}
	
	private void recorrer(BinaryTree<Integer> arbol, BinaryTree<Integer> nAb, int raiz) {
		nAb.setData(raiz + arbol.getData());
		
		if(arbol.hasLeftChild()) {
			nAb.addLeftChild(new BinaryTree<Integer>());
			recorrer(arbol.getLeftChild(), nAb.getLeftChild(), arbol.getData());
		}
		if(arbol.hasRightChild()) {
			nAb.addRightChild(new BinaryTree<Integer>());
			recorrer(arbol.getRightChild(), nAb.getRightChild(), 0);
		}
	}
}
