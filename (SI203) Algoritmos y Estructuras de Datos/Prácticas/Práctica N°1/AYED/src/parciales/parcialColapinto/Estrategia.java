package parciales.parcialColapinto;
import java.util.*;
import tp3.ejercicio1.GeneralTree;

public class Estrategia {
	private static final String MAX_VALUE = null;

	public List<Compuesto> mejorEstrategia(GeneralTree<Compuesto> arbol){
		if(arbol==null)return null;
		if(arbol.isEmpty()) return new LinkedList<Compuesto>();
		
		List<Compuesto> listaAct = new LinkedList<>();
		List<Compuesto> listaMin = new LinkedList<>();
		
		Auxiliar aux = new Auxiliar(Double.MAX_VALUE, 0);
		
		List<GeneralTree<Compuesto>> hijos = arbol.getChildren();
		for(GeneralTree<Compuesto> h : hijos) {
			recorrer(h, listaAct, listaMin, aux);
		}
		
		return listaMin;
	}
	
	private void recorrer(GeneralTree<Compuesto> arbol, List<Compuesto> listaAct, List<Compuesto> listaMin, Auxiliar aux) {
		listaAct.add(arbol.getData());
		aux.setAct(aux.getAct()+(arbol.getData().getVueltas() * arbol.getData().getCompuesto()));
		if(!arbol.isLeaf()) {
			aux.setAct(aux.getAct()+10);
		}
		else if(aux.getAct()<aux.getMin()){
			aux.setMin(aux.getAct());
			listaMin.clear();
			listaMin.addAll(listaAct);
		}
		List<GeneralTree<Compuesto>> hijos = arbol.getChildren();
		for(GeneralTree<Compuesto> h : hijos) {
			recorrer(h, listaAct, listaMin, aux);
		}
		listaAct.remove(listaAct.size()-1);
		aux.setAct(aux.getAct() - (arbol.getData().getVueltas() * arbol.getData().getCompuesto()));		//copilot me hizo cambiar estas lineas, para que sean mas consistentes
		if (!arbol.isLeaf()) {
		    aux.setAct(aux.getAct() - 10);
		}
	}
}