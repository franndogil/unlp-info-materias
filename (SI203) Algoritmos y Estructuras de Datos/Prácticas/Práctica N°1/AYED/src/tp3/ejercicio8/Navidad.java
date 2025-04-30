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

public class Navidad {
	private GeneralTree<Integer> arbol;
	
	public Navidad(GeneralTree<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public String esAbetoNavidenio() {
		if(arbol.isEmpty()) {
			return "Esta vacio, no es un abeto navidenio.";
		}
		
		//meto recorrido por niveles ya fue
		
		Queue<GeneralTree<Integer>> cola = new Queue<>();
		
		
	}
}
