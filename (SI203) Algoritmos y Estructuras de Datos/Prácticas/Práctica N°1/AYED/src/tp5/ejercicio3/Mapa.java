package tp5.ejercicio3;

import tp5.ejercicio1.*;
import java.util.*;

public class Mapa {

	private Graph<String> mapaCiudades;
	
	public Mapa(Graph<String> mapaCiudades) {
		this.mapaCiudades = mapaCiudades;
	}
	
	public List<String> devolverCamino(String ciudad1, String ciudad2){
		List<String> listaRetorno = new LinkedList<String>();
		
		//verifico que mapaCiudades no sea null o no sea vacio
		if(this.mapaCiudades!=null && !this.mapaCiudades.isEmpty()) {
			Vertex<String> origen = this.mapaCiudades.search(ciudad1);
			Vertex<String> destino = this.mapaCiudades.search(ciudad2);
			
			if(origen != null && destino != null) {
				boolean[] marcas = new boolean [this.mapaCiudades.getSize()];
				
				devolverCaminoRecursivo(origen, destino, listaRetorno, marcas);
			}
		}
		
		return listaRetorno;
	}
	
	private boolean devolverCaminoRecursivo(Vertex<String>origen, Vertex<String>destino, List<String> camino, boolean[] marcas) {
		boolean encontre = false;
		marcas[origen.getPosition()] = true;
		camino.add(origen.getData());
		if(origen == destino) {
			return true;
		}
		else {
			List<Edge<String>> listAdy = this.mapaCiudades.getEdges(origen);
			Iterator<Edge<String>> it = listAdy.iterator();
			while(it.hasNext() && !encontre) {
				//EXTRAIGO EL SIGUIENTE
				Vertex<String> vertice = it.next().getTarget();
				int j = vertice.getPosition();
				//SI NO ESTA MARCADO HAGO LA RECURSION
				if(!marcas[j]) {
					encontre = devolverCaminoRecursivo(origen, destino, camino, marcas);
				}
			}
		}
		if(!encontre) {
			camino.remove(camino.size()-1);
		}
		marcas[origen.getPosition()] = false;
        return encontre;
	}
}
