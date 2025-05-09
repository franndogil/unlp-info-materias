package parciales.parcial4;

import tp3.ejercicio1.GeneralTree;
import java.util.*;

public class Parcial {
	public Integer resolver(GeneralTree<Integer> arbol) {
		if(arbol == null) return null;
		if(arbol.isEmpty()) return 0;
		
		int[] posYneg = new int[2];
		for(int i=0; i<2; i++) {
			posYneg[i] = 0;
		}
		
		Integer res = 0;
		int cant = recorrer(arbol, posYneg);
		
		if((cant%2)==0) {
			res = posYneg[0];
		}
		else {
			res = posYneg[1];
		}
		return res;
	}
	
	private int recorrer(GeneralTree<Integer> arbol, int[] posYneg) {
		int suma = 0;
		List<GeneralTree<Integer>> hijos = arbol.getChildren();
		Iterator<GeneralTree<Integer>> it = hijos.iterator();
		
		if(it.hasNext()) {							//mando al primer hijo
			suma += recorrer(it.next(), posYneg);
		}
		
		suma++;	//incremento suma por el nodo raiz
		
		if(arbol.getData()>=0) {
			posYneg[0]++;
		}
		else {
			posYneg[1]++;
		}
				
		while(it.hasNext()) {						//mando al resto de los hijos
			suma += recorrer(it.next(), posYneg);	
		}
		
		return suma;
	}
}
