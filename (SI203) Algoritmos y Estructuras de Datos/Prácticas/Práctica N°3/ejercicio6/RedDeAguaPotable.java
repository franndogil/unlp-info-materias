package tp3.ejercicio6;

import tp3.ejercicio1.*;
import java.util.*;

public class RedDeAguaPotable {
	private GeneralTree<Character> estructura;
	
	public RedDeAguaPotable(GeneralTree<Character> estructura) {
		this.estructura = estructura;
	}
	
	public double minimoCaudal(double caudal) {
		if(estructura.isEmpty()) {
			return -1;
		}
		return minimoCaudalRecursiva(estructura, caudal);
	}
	
	private double minimoCaudalRecursiva(GeneralTree<Character> estructura, double caudal) {
		if(estructura.isLeaf()) {
			return caudal;		//si no tiene mas hijos (es una casa) retorno lo ultimo de agua que llega
		}
		//aplico la recursividad a cada uno de los hijos con la cantidad de agua / la cantidad de hijos
		
		double minCaudal = Double.MAX_VALUE;
		double actCaudal = 0;
		List <GeneralTree<Character>> listAux = estructura.getChildren();
		int cantHijos = listAux.size();
		caudal = caudal / cantHijos;
		
		for(GeneralTree<Character> c : listAux) {
			actCaudal = minimoCaudalRecursiva(c, caudal);
			if(actCaudal < minCaudal) minCaudal = actCaudal;
		}
		return minCaudal;
	}
}
