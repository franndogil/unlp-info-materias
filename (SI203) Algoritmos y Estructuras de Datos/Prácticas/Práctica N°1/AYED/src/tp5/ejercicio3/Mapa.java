package tp5.ejercicio3;

import tp5.ejercicio1.*;
import java.util.*;

public class Mapa {

	private Graph<String> mapaCiudades;
	
	public Mapa(Graph<String> mapaCiudades) {
		this.mapaCiudades = mapaCiudades;
	}
	//---------------------------------------------------------------------------------------------------------------------------------------
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
	
	//---------------------------------------------------------------------------------------------------------------------------------------
	public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades){
		List<String> listaRetorno = new LinkedList<String>();
		
		//verifico que mapaCiudades no sea null o no sea vacio
		if(this.mapaCiudades!=null && !this.mapaCiudades.isEmpty()) {
			Vertex<String> origen = this.mapaCiudades.search(ciudad1);
			Vertex<String> destino = this.mapaCiudades.search(ciudad2);
			
			if(origen != null && destino != null) {
				boolean[] marcas = new boolean [this.mapaCiudades.getSize()];
				
				exceptuarCiudades(ciudades, marcas);
				devolverCaminoRecursivo(origen, destino, listaRetorno, marcas);
			}
		}
		
		return listaRetorno;
	}
	
	private void exceptuarCiudades(List<String> ciudades, boolean[] marcas) {
		for(String c : ciudades) {
			Vertex<String> actual = this.mapaCiudades.search(c);	
			//si la ciudad a exceptuar existe, la tildo como false para no tenerla en cuenta
			if(actual!=null) {
				marcas[actual.getPosition()] = true;
			}
		}
	}
	//---------------------------------------------------------------------------------------------------------------------------------------
		public List<String> caminoMasCorto(String ciudad1, String ciudad2){
			List<String> listaRetorno = new LinkedList<String>();
			
			if(this.mapaCiudades!= null && !this.mapaCiudades.isEmpty()) {
				Vertex<String> origen = this.mapaCiudades.search(ciudad1);
				Vertex<String> destino = this.mapaCiudades.search(ciudad2);
				
				if(origen != null && destino != null) {
					boolean[] marcas = new boolean [this.mapaCiudades.getSize()];
					caminoMasCortoRecursivo(origen, destino, new LinkedList<String>(), listaRetorno, marcas, 0, Integer.MAX_VALUE);
				}
			}
			return listaRetorno;
		}
		
		private int caminoMasCortoRecursivo(Vertex<String> origen, Vertex<String> destino, List<String> caminoAct, List<String> caminoCorto, boolean[] marcas, int total, int min) {
			if(origen == destino && total < min) {
				caminoCorto.clear();
				caminoCorto.addAll(caminoAct);
				min =  total;
			}
			else {
				List<Edge<String>> listAdy = this.mapaCiudades.getEdges(origen);
				Iterator<Edge<String>> it = listAdy.iterator();
				while(it.hasNext() && total < min) {
					Edge<String> v = it.next();				
	                int j = v.getTarget().getPosition();
	                int aux = total + v.getWeight();
	                if(!marcas[j] && aux < min) {
	                    min = caminoMasCortoRecursivo(v.getTarget(), destino, caminoCorto, caminoAct, marcas, aux, min);
	                }	
				}
			}
			marcas[origen.getPosition()] = false;
	        caminoAct.remove(caminoAct.size()-1);
	        return min;
		}
		
		//---------------------------------------------------------------------------------------------------------------------------------------
		
		public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto){
			List<String> listaRetorno = new LinkedList<String>();
			
			if(this.mapaCiudades != null && !this.mapaCiudades.isEmpty()) {
				Vertex<String> origen = this.mapaCiudades.search(ciudad1);
				Vertex<String> destino = this.mapaCiudades.search(ciudad2);
				
				if(origen != null && destino != null) {
					boolean[] marcas = new boolean[this.mapaCiudades.getSize()];
					caminoSinCargarCombustibleRecursivo(origen, destino, marcas, tanqueAuto, listaRetorno);
				}
			}
			return listaRetorno;
		}
		
		private boolean caminoSinCargarCombustibleRecursivo(Vertex<String> origen, Vertex<String> destino, boolean[] marcas, int tanqueAuto, List<String> listaRetorno) {
			boolean encontre = false;
			marcas[origen.getPosition()] = true;	//me faltaba marcarlo
			listaRetorno.add(origen.getData());
			if(origen == destino) {
				return true;
			}
			else {
				List<Edge<String>> listAdy = this.mapaCiudades.getEdges(origen);
				Iterator<Edge<String>> it = listAdy.iterator();
				while(it.hasNext() && !encontre) {
					Edge<String> e = it.next();			//obtengo al siguiente adyacente
					int pos = e.getTarget().getPosition();	//obtengo la posicion del adyacente actual
					if(!marcas[pos] && tanqueAuto - e.getWeight() > 0) {		//si no esta marcado y no se acaba el combustible avanzo
						encontre = caminoSinCargarCombustibleRecursivo(e.getTarget(), destino, marcas, tanqueAuto - e.getWeight(), listaRetorno);
					}
					
				}
			}
			if(!encontre) {		//si no corresponde, elimino al actual de la lista
				listaRetorno.remove(listaRetorno.size()-1);
			}
			marcas[origen.getPosition()] = false;	//desmarco para poder utilizar en otro recorrido
			return encontre;
		}
		
		//---------------------------------------------------------------------------------------------------------------------------------------
		public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
			List<String> listaRetorno = new LinkedList<String>();
			
			if(this.mapaCiudades != null && !this.mapaCiudades.isEmpty()) {
				Vertex<String> origen = this.mapaCiudades.search(ciudad1);
				Vertex<String> destino = this.mapaCiudades.search(ciudad2);
				
				if(origen != null && destino != null) {
					boolean[]marcas = new boolean[this.mapaCiudades.getSize()];
					caminoConMenorCargaRecursivo(origen, destino, new LinkedList<String>(), listaRetorno, marcas, tanqueAuto, tanqueAuto, 0, Integer.MAX_VALUE);
				}
			}
			
			return listaRetorno;
		}
		
		private int caminoConMenorCargaRecursivo(Vertex<String> origen, Vertex<String> destino, List<String> caminoAct, List<String> caminoMin, boolean [] marcas, int tanqueActual, int tanque, int recargas, int recargasMin) {
			marcas[origen.getPosition()] = true;
			caminoAct.add(origen.getData());
			if(origen == destino  && recargas < recargasMin) {
				caminoMin.clear();
				caminoMin.addAll(caminoAct);
				recargasMin = recargas;
			}
			else {
				List<Edge<String>> listAdy = this.mapaCiudades.getEdges(origen);
				Iterator<Edge<String>> it = listAdy.iterator();
				while(it.hasNext() && recargas < recargasMin) {
					Edge<String> e = it.next();
					int pos = e.getTarget().getPosition();
					int distancia = e.getWeight();
					if(tanqueActual >= distancia) {
						recargasMin = caminoConMenorCargaRecursivo(e.getTarget(), destino, caminoAct, caminoMin, marcas, tanqueActual - distancia, tanque, recargas, recargasMin);
					}
					else if(tanque >= distancia) {
						recargasMin = caminoConMenorCargaRecursivo(e.getTarget(), destino, caminoAct, caminoMin, marcas, tanque - distancia, tanque, recargas + 1, recargasMin);
					}
				}
			}
			marcas[origen.getPosition()] = false;	//la desmarco
			caminoAct.remove(caminoAct.size()-1);
			return recargasMin;
		}
		
		//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
		/* Ejercicio 7) 1. Implemente nuevamente el ejercicio 3.3 haciendo uso del algoritmo de Dijkstra*/
		
		//public List<String> caminoMasCortoDijkstra(String ciudad1, String ciudad2){
			
		//}
		
		/* 2. Implemente nuevamente el ejercicio 3.3 haciendo uso del algoritmo de Floyd*/
		
		//public List<String> caminoMasCortoFloyd(String ciudad1, String ciudad2){
			
		//}
		
		
}
