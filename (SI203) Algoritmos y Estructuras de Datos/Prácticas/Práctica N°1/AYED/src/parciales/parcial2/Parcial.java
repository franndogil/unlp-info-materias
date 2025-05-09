package parciales.parcial2;
import tp1.ejercicio8.Queue;
import tp3.ejercicio1.GeneralTree;
import java.util.*;

public class Parcial {
	public int resolver(GeneralTree<Integer> arbol) {
		if(arbol==null) return 0;
		if(arbol.isEmpty()) return 0;
		
		Queue<GeneralTree<Integer>> cola = new Queue<>();
		GeneralTree<Integer> aux;
		cola.enqueue(arbol);
		cola.enqueue(null);
		int multi = 1;
		while(!cola.isEmpty()) {
			aux = cola.dequeue();
			
			if(aux!=null) {
				multi = (multi * aux.getData());
				List<GeneralTree<Integer>> hijos = aux.getChildren();
				for(GeneralTree<Integer> h : hijos) {
					cola.enqueue(h);
				}
			}
			
			else if(!cola.isEmpty()) {
				cola.enqueue(null);
				multi = 1;
			}
		}
		
		return multi;
	}
}