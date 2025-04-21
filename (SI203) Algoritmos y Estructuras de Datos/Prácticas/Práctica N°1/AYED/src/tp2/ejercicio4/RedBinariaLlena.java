package tp2.ejercicio4;

import java.util.*;
import tp2.ejercicio1.*;

public class RedBinariaLlena {
	private BinaryTree <Integer> redBinaria;
	
	public RedBinariaLlena(BinaryTree<Integer> arbol) {
		this.redBinaria = arbol;
	}
	
	public int retardoEnvio() {
		if(!this.redBinaria.isEmpty()) {
			return retardoEnvioRecursivo(redBinaria);
		}
		return 0;
	}
	
	private int retardoEnvioRecursivo(BinaryTree<Integer> arbol) {
		int HI = 0;
		int HD = 0;
		
		if(arbol.isLeaf()) return arbol.getData();
		
		HI = retardoEnvioRecursivo(arbol.getLeftChild());
		HD = retardoEnvioRecursivo(arbol.getRightChild());
		
		return Math.max(HI, HD) + arbol.getData();
	}
}
