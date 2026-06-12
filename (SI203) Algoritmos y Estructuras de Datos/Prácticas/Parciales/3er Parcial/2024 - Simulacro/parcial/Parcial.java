package parciales.grafos.simulacro2024.parcial;
import tp5.ejercicio1.*;
import java.util.*;

public class Parcial {
	public List<String> resolver(Graph<Ciudad> mapa, String ciudad, int cantDiasVacas){
		List<String> lRet = new LinkedList<String>();
		if(mapa != null && !mapa.isEmpty()) {
			Vertex<Ciudad> origen = buscarPorNombre(mapa, ciudad);
			if(origen != null) {
				boolean [] marcas = new boolean[mapa.getSize()];
				if(cantDiasVacas>0) {
					dfs(mapa, origen, cantDiasVacas - origen.getData().getDias(), marcas, lRet, new LinkedList<String>());
				}
			}
		}
		return lRet;
	}
	
	private Vertex<Ciudad> buscarPorNombre(Graph<Ciudad> grafo, String ciudad){
		for(Vertex<Ciudad> v : grafo.getVertices()) {
			if(v.getData().getNombre().equals(ciudad)) {
				return v;
			}
		}
		return null;
	}
	
	private void dfs(Graph<Ciudad> grafo, Vertex<Ciudad> origen, int cantD, boolean[]marcas, List<String> lRet, List<String> lAct) {
		marcas[origen.getPosition()] = true;
		lAct.add(origen.getData().getNombre());
		if(cantD == 0) {
			if(lAct.size() > lRet.size()) {
				lRet.clear();
				lRet.addAll(lAct);
			}
		}
		else {
			List<Edge<Ciudad>> listAdy = grafo.getEdges(origen);
			Iterator <Edge<Ciudad>> it = listAdy.iterator();
			while(it.hasNext()) {
				Edge<Ciudad> e = it.next();
				int pos = e.getTarget().getPosition();
				int diasSig = e.getTarget().getData().getDias();
				if(!marcas[pos] && cantD - diasSig >= 0) {
					dfs(grafo, e.getTarget(), cantD - diasSig, marcas, lRet, lAct);
				}
			}
		}
		marcas[origen.getPosition()] = false;
		lAct.remove(lAct.size()-1);
	}
	
	public static void main(String args[]) {
        Graph<Ciudad> grafo = new AdjListGraph<Ciudad>();
        Vertex<Ciudad> v1 = grafo.createVertex(new Ciudad("Mar del Plata", 7));
        Vertex<Ciudad> v2 = grafo.createVertex(new Ciudad("Pila", 1));
        Vertex<Ciudad> v3 = grafo.createVertex(new Ciudad("Mar azul", 3));
        Vertex<Ciudad> v4 = grafo.createVertex(new Ciudad("Pinamar", 4));
        Vertex<Ciudad> v5 = grafo.createVertex(new Ciudad("Dolores", 1));
        Vertex<Ciudad> v6 = grafo.createVertex(new Ciudad("Madariaga", 1));
        Vertex<Ciudad> v7 = grafo.createVertex(new Ciudad("Chascomus", 1));
        Vertex<Ciudad> v8 = grafo.createVertex(new Ciudad("La Plata", 5));
        Vertex<Ciudad> v9 = grafo.createVertex(new Ciudad("Hudson", 1));    
        Vertex<Ciudad> v10 = grafo.createVertex(new Ciudad("Las gaviotas", 1));
        Vertex<Ciudad> v11 = grafo.createVertex(new Ciudad("Querandi", 1));
        
        grafo.connect(v1, v2);
        grafo.connect(v2, v1);
        
        grafo.connect(v1, v3);
        grafo.connect(v3, v1);
        
        grafo.connect(v3, v10);
        grafo.connect(v10, v3);
        
        grafo.connect(v3, v11);
        grafo.connect(v11, v3);
        
        grafo.connect(v3, v4);
        grafo.connect(v4, v3);
        
        grafo.connect(v4, v6);
        grafo.connect(v6, v4);
        
        grafo.connect(v6, v5);
        grafo.connect(v5, v6);
        
        grafo.connect(v2, v5);
        grafo.connect(v5, v2);
        
        grafo.connect(v5, v7);
        grafo.connect(v7, v5);
        
        grafo.connect(v7, v8);
        grafo.connect(v8, v7);
        
        grafo.connect(v8, v9);
        grafo.connect(v9, v8);
        
        Parcial p = new Parcial();
        
        List<String> lRet = p.resolver(grafo, "Mar del Plata", 15);
        
        System.out.println("Lista retorno");
        
        for(String s : lRet) {
        	System.out.print(s + " | ");
        }
    }
}
