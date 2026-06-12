/*Dada una clase Caminos que contiene una variable de instancia de tipo GeneralTree de números
 enteros, implemente un método que retorne el camino a la hoja más lejana. En el caso de haber
 más de un camino máximo retorne el primero que encuentre.
 El método debe tener la siguiente firma: public List<Integer> caminoAHojaMasLejana ()*/


package tp3.ejercicio7;

import tp3.ejercicio1.GeneralTree;
import java.util.*;

public class Caminos {
	private GeneralTree<Integer> caminos;
	
	public Caminos(GeneralTree<Integer> caminos) {
		this.caminos = caminos;
	}
	
	public List<Integer> caminoAHojaMasLejana (){
		List<Integer> actual = new LinkedList<>();
		List<Integer> maximo = new LinkedList<>();
		if(caminos != null && !caminos.isEmpty()){
			caminoAHojaMasLejanaRecursiva(caminos, actual, maximo);
		}
		return maximo;
	}
	
		/*                  1
					       / \
					      2   3
					     / \  / \
					    4   5 6  7
					              \
					               9				*/
	
	private void caminoAHojaMasLejanaRecursiva(GeneralTree<Integer> arbol, List<Integer> actual, List<Integer> maximo){
		if(arbol == null) return;
		
		actual.add(arbol.getData());	//agrego el actual a la lista
		
		if(arbol.isLeaf()) {	//si es una hoja
			if(actual.size()>maximo.size()) {	//si el camino actual es mas largo que el maximo registrado
				maximo.clear();		
				maximo.addAll(actual);
			}
		}
		else {			//si no es una hoja busco en los hijos
			List<GeneralTree<Integer>> listAux = arbol.getChildren();
			for(GeneralTree<Integer> c:listAux) {
				caminoAHojaMasLejanaRecursiva(c, actual, maximo);
			}
		}
		
		actual.remove(actual.size()-1);		//volvemos al anterior
	}
	
	//
	
	// en definitiva, cuando saglamos de la recursiva "actual" va a quedar vacia y maximo actualizada
}
