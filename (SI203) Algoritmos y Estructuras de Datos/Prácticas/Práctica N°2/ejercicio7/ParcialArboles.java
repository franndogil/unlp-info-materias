package tp2.ejercicio7;

import tp2.ejercicio1.*;

public class ParcialArboles {
	private BinaryTree <Integer> ab;
	
	public ParcialArboles(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	public boolean isLeftTree(int num) {
	    BinaryTree<Integer> abRet = Buscar(ab, num);

	    if (abRet != null) {
	        return cumple(abRet);
	    }
	    
	    return false;
	}

	
	private BinaryTree<Integer> Buscar(BinaryTree<Integer> ab, int num) {
	    if (ab == null) return null;
	    
	    if (ab.getData() == num) {
	        return ab;
	    }

	    BinaryTree<Integer> encontrado = null;
	    if (ab.hasLeftChild()) {
	        encontrado = Buscar(ab.getLeftChild(), num);
	    }
	    if (encontrado == null && ab.hasRightChild()) {
	        encontrado = Buscar(ab.getRightChild(), num);
	    }

	    return encontrado;
	}

	
	private boolean cumple(BinaryTree<Integer> ab) {
		int hi = 0;
		int hd = 0;
		boolean cond = false;
		if(ab.hasLeftChild()&&!ab.hasRightChild()) {
			hi = contadorHijosUnicos(ab.getLeftChild());
			hd = -1;
		}
		else if(!ab.hasLeftChild()&&ab.hasRightChild()) {
			hi = -1;
			hd = contadorHijosUnicos(ab.getRightChild());
		} else {
			hi = contadorHijosUnicos(ab.getLeftChild());
			hd = contadorHijosUnicos(ab.getRightChild());
		}
		
		System.out.print(hi);
		System.out.print(hd);
		
		if(hi > hd) cond = true;
		
		return cond;
	}
	
	private int contadorHijosUnicos(BinaryTree<Integer> ab) {
		if(ab.isLeaf()) return 0;
		
		int cont = 0;
		if(ab.hasLeftChild()&&!ab.hasRightChild()) {
			cont += 1 + contadorHijosUnicos(ab.getLeftChild());
		}
		else if(!ab.hasLeftChild()&&ab.hasRightChild()) {
			cont += 1 + contadorHijosUnicos(ab.getRightChild());
		}
		else {
			cont += contadorHijosUnicos(ab.getLeftChild());
	        cont += contadorHijosUnicos(ab.getRightChild());
		}
		return cont;
	}
	
}

