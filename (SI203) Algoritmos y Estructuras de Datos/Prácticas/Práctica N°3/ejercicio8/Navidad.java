/*Ejercicio de la teoria Abeto navideño                                

Considere un árbol general. Recordemos que el vértice u se llama hijo del vértice v y el vértice v 
se llama padre del vértice u si existe una arista dirigida de v a u. 

El árbol tiene un vértice distinguido llamado raíz, que es el único vértice que no tiene padre. 
Un vértice se llama hoja si no tiene hijos y tiene padre. Llamaremos abeto a un árbol si cada vértice
no hoja tiene al menos 3 hijos hojas. Dado un árbol general, compruebe si es un abeto.

*/

package tp3.ejercicio8;

import tp3.ejercicio1.GeneralTree;
import tp1.ejercicio8.Queue;
import java.util.*;

public class Navidad {
	private GeneralTree<Integer> arbol;
	
	public Navidad(GeneralTree<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public String esAbetoNavidenio() {
		if(arbol.isEmpty()) {
			return "Esta vacio, no es un abeto navidenio.";
		}
		boolean abeto = recorridoPorNiveles(arbol);
		
		if(abeto){
			return "Es un abeto navidenio.";
		}
		
		return "No es un abeto navidenio.";
	}
	
	private boolean recorridoPorNiveles(GeneralTree<Integer> arbol) {
		boolean cond = true;	//es navidenio hasta que se demuestre lo contrario
		Queue<GeneralTree<Integer>> cola = new Queue<>();
		GeneralTree<Integer> aux;	//para desencolar
		
		cola.enqueue(arbol);		//encolo al primero
		cola.enqueue(null);			//separo el nivel
		
		while(!cola.isEmpty() && cond) {
			aux = cola.dequeue();	//desencolo al primero en aux
			if(aux != null) {		//si es distinto de null 
				if(aux.hasChildren()) {
					if(aux.getChildren().size()>=3) {
						List<GeneralTree<Integer>> listAux = aux.getChildren();
						for(GeneralTree<Integer> a : listAux) {
							cola.enqueue(a);	//encolo a cada uno de los hijos
						}
					}else cond = false;		//si tiene hijos pero no son mayor o igual a tres ya no es un arbol navidenio
				}
			}else if(!cola.isEmpty()) {		//si la cola no esta vacia encolamos null para hacer la separacion de nivel
				cola.enqueue(null);
			}
		}
		
		return cond;
	}
}
