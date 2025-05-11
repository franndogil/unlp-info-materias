package parciales.parcialPrimeraFecha2024;
import tp3.ejercicio1.*;
import java.util.*;


public class ParcialArboles {
	private GeneralTree<Integer> arbol;
	
	public ParcialArboles(GeneralTree<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public List<Integer> camino(int num){
		if(arbol == null) return null;
		if(arbol.isEmpty())return new LinkedList<Integer>();
		
		List<Integer> lAct = new LinkedList<Integer>();
		List<Integer> lRet = new LinkedList<Integer>();
		
		recorrer(arbol, lAct, lRet, num);
		
		return lRet;
	}
	
	private boolean recorrer(GeneralTree<Integer> ab, List<Integer> lAct, List<Integer> lRet, int num) {
		boolean esValido = true;
		lAct.add(ab.getData());
		if(ab.isLeaf()) {
			esValido = false;
			lRet.clear();
			lRet.addAll(lAct);
		}
		if(ab.getChildren().size() >= num) {
			List<GeneralTree<Integer>> hijos = ab.getChildren();
			Iterator<GeneralTree<Integer>> it = hijos.iterator();
			
			while(esValido && it.hasNext()) {
				esValido = esValido && recorrer(it.next(), lAct, lRet, num);
			}
			
		}
		lAct.remove(lAct.size()-1);
		return esValido;
	}
}