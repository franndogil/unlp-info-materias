package parciales.parcial5;
import tp3.ejercicio1.*;
import java.util.*;

public class Parcial {
	public Integer resolver(GeneralTree<Integer> arbol, Integer min, Integer max) {
		if(arbol == null) return null;
		if(arbol.isEmpty()) return 0;
		
		int[]sumaYcant = new int[2];
		for(int i = 0; i<2; i++) {
			sumaYcant[i] = 0;
		}
		
		recorrer(arbol, min, max, sumaYcant);
		
		
		Integer res = 0;
		res = sumaYcant[0]/sumaYcant[1];
		return res;
	}
	
	private void recorrer(GeneralTree<Integer> arbol, Integer min, Integer max, int[] sumaYcant) {
		List<GeneralTree<Integer>> hijos = arbol.getChildren(); 
		Iterator <GeneralTree<Integer>> it = hijos.iterator();
		
		if(it.hasNext()) {
			recorrer(it.next(), min, max, sumaYcant);
		}
		
		if(arbol.getData() >= min && arbol.getData() <= max) {
			sumaYcant[1]++;
			sumaYcant[0] = sumaYcant[0] + arbol.getData();
		}
		
		while(it.hasNext()) {
			recorrer(it.next(), min, max, sumaYcant);
		}
	}
}
