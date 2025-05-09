package parciales.parcial3;
import tp3.ejercicio1.*;
import java.util.*;

public class Parcial {
	public Integer resolver(GeneralTree<Integer> arbol) {
		if(arbol == null) return null;
		if(arbol.isEmpty()) return null;
		
		int[] posYneg = new int[2];
		
		for(int i=0; i<2; i++) {	//inicializo el vector
			posYneg[i] = 0;
		}
		
		Integer result = 0;
		Integer suma = recorrer(arbol, posYneg);
		
		if((suma%2)==0) {
			result = posYneg[0];
		}
		else {
			result = posYneg[1];
		}
		return result;
	}
	
	private Integer recorrer(GeneralTree<Integer> ab, int[] posYneg) {
		Integer suma = 0;
		
		List<GeneralTree<Integer>> hijos = ab.getChildren();
		for(GeneralTree<Integer> h : hijos) {
			suma += recorrer(h, posYneg);
		}
		
		if(ab.getData()>=0) {
			posYneg[0] = posYneg[0] + ab.getData();
		}
		else {
			posYneg[1] = posYneg[1] + ab.getData();
		}
		
		suma += ab.getData();
		return suma;
	}
}
