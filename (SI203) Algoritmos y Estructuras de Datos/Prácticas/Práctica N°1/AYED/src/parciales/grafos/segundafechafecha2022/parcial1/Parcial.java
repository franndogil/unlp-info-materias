package parciales.grafos.segundafechafecha2022.parcial1;
import tp5.ejercicio1.*;
import java.util.*;

public class Parcial {
	public List<String> recorrido(Graph<String> grafo, int cantLocalidades, int cantNafta, List<String> localidadesExceptuadas){
		List<String> listaRetorno = new LinkedList<String>();
		
		if(grafo != null && !grafo.isEmpty()) {
			Vertex<String> origen = grafo.search("Mendoza");
			
			if(origen != null && cantNafta > 0 && cantLocalidades > 0) {
				boolean[] marcas = new boolean[grafo.getSize()];
				
				restringirLocalidades(grafo, localidadesExceptuadas, marcas);
				
				recorridoRecursivo(grafo, origen, cantLocalidades, 0, cantNafta, marcas, listaRetorno, new LinkedList<String>());
			}
		}
		
		return listaRetorno;
	}
	
	private void restringirLocalidades(Graph<String> grafo, List<String> localidadesExceptuadas, boolean[] marcas) {
		for(Vertex<String> s : grafo.getVertices()) {
			if(localidadesExceptuadas.contains(s.getData())) {
				marcas[s.getPosition()] = true;
			}
		}
	}
	
	private boolean recorridoRecursivo(Graph<String> grafo, Vertex<String> origen, int cantLoc, int cantActLoc, int cantNafta, boolean [] marcas, List<String> recRet, List<String> recAct) {
		boolean encontre = false;
		marcas[origen.getPosition()] = true;
		cantActLoc += 1;
		recAct.add(origen.getData());
		
		if(cantActLoc >= cantLoc) {
			recRet.clear();
			recRet.addAll(recAct);
			return true;
		}
		else {
			List<Edge<String>> listAdy = grafo.getEdges(origen);
			Iterator<Edge<String>> it = listAdy.iterator();
			while(it.hasNext() && !encontre) {
				Edge<String> e = it.next();
				int pos = e.getTarget().getPosition();
				int consumo = e.getWeight();
				if(!marcas[pos] && cantNafta - consumo >= 0 ) {
					encontre = recorridoRecursivo(grafo, e.getTarget(), cantLoc, cantActLoc, cantNafta - consumo, marcas, recRet, recAct);
				}
			}
		}
		
		marcas[origen.getPosition()] = false;
		recAct.remove(recAct.size()-1);								//no andaba porque no estaba haciendo el backtraking, importante
	
		return encontre;
	}
	
	public static void main(String args[]) {
        Graph<String> grafo = new AdjListGraph<String>();
        Vertex<String> v1 = grafo.createVertex("Mendoza");
        Vertex<String> v2 = grafo.createVertex("Tunuyán");
        Vertex<String> v3 = grafo.createVertex("San Martin");
        Vertex<String> v4 = grafo.createVertex("La Paz");
        Vertex<String> v5 = grafo.createVertex("Santa Rosa");
        Vertex<String> v6 = grafo.createVertex("San Rafael");
        Vertex<String> v7 = grafo.createVertex("Malargue");
        Vertex<String> v8 = grafo.createVertex("General Alvear");
        
        grafo.connect(v1, v2, 10);
        grafo.connect(v1, v3, 6);
        grafo.connect(v2, v3, 10);
        grafo.connect(v3, v4, 8);
        grafo.connect(v4, v5, 2);
        grafo.connect(v3, v6, 13);
        grafo.connect(v6, v2, 11);
        grafo.connect(v6, v8, 7);
        grafo.connect(v2, v7, 12);
        grafo.connect(v8, v7, 6);
        
        List<String> localidadesExceptuadas = new LinkedList<String>();
        localidadesExceptuadas.add("General Alvear");
        localidadesExceptuadas.add("La Paz");
        
        Parcial p = new Parcial();
        
        System.out.println(p.recorrido(grafo, 5, 80, localidadesExceptuadas));
    }
}
