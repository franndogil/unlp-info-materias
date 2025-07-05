package parciales.grafos.primerafecha2025.tema2;
import tp5.ejercicio1.*;
import java.util.*;

public class ParcialGrafos {
	public List<String> rutaOptimaDistribucion(Graph<String> reino, String castillo, String aldea, int maxPociones){
		List<String> listaRetorno = new LinkedList<>();
		if(reino != null && !reino.isEmpty()) {
			Vertex<String> origen = reino.search(castillo);
			Vertex<String> destino = reino.search(aldea);
			
			if(origen != null && destino != null) {
				boolean [] marcas = new boolean[reino.getSize()];
				if(maxPociones > 0) {
					dfs(reino, origen, destino, listaRetorno, new LinkedList<String>(), maxPociones, marcas);
				}
			}
		}
		return listaRetorno;
	}
	
	private void dfs(Graph<String> grafo, Vertex<String> origen, Vertex<String> destino, List<String> listaRetorno, List<String> listaActual, int maxPociones, boolean[] marcas) {
		marcas[origen.getPosition()] = true;
		listaActual.add(origen.getData());
		if(origen.equals(destino) && listaActual.size() > listaRetorno.size()) {
			listaRetorno.clear();
			listaRetorno.addAll(listaActual);
		}
		else {
			List<Edge<String>> listAdy = grafo.getEdges(origen);
			Iterator<Edge<String>> it = listAdy.iterator();
			while(it.hasNext()) {
				Edge<String> e = it.next();
				int pos = e.getTarget().getPosition();
				if(!marcas[pos] && maxPociones - e.getWeight() >= 0) {
					dfs(grafo, e.getTarget(), destino, listaRetorno, listaActual, maxPociones - e.getWeight(), marcas);
				}
			}
		}
		marcas[origen.getPosition()] = false;
		listaActual.remove(listaActual.size()-1);
	}
	
	public static void main(String args[]) {
		Graph<String> grafo = new AdjListGraph<String>();
        Vertex<String> v1 = grafo.createVertex("Castillo");
        Vertex<String> v2 = grafo.createVertex("Cueva Encantada");
        Vertex<String> v3 = grafo.createVertex("Aldea del Lago");
        Vertex<String> v4 = grafo.createVertex("Cruce Norte");
        Vertex<String> v5 = grafo.createVertex("Bosque Sombrio");
        Vertex<String> v6 = grafo.createVertex("Campamento de Druidas");
        Vertex<String> v7 = grafo.createVertex("Aldea");
        Vertex<String> v8 = grafo.createVertex("Desfiladero de los Vientos");
        
        grafo.connect(v1, v2, 8);
        grafo.connect(v2, v1, 8);
        
        grafo.connect(v1, v3, 15);
        grafo.connect(v3, v1, 15);
        
        grafo.connect(v1, v5, 20);
        grafo.connect(v5, v1, 20);
        
        grafo.connect(v1, v4, 10);
        grafo.connect(v4, v1, 10);
        
        grafo.connect(v4, v5, 5);
        grafo.connect(v5, v4, 5);
        
        grafo.connect(v5, v3, 5);
        grafo.connect(v3, v5, 5);
        
        grafo.connect(v3, v2, 50);
        grafo.connect(v2, v3, 50);
        
        grafo.connect(v3, v8, 30);
        grafo.connect(v8, v3, 30);
        
        grafo.connect(v2, v8, 45);
        grafo.connect(v8, v2, 45);
        
        grafo.connect(v7, v8, 15);
        grafo.connect(v8, v7, 15);
        
        grafo.connect(v6, v8, 7);
        grafo.connect(v8, v6, 7);
        
        grafo.connect(v6, v7, 35);
        grafo.connect(v7, v6, 35);
        
        grafo.connect(v6, v5, 3);
        grafo.connect(v5, v6, 3);
        
        ParcialGrafos p = new ParcialGrafos();
        
        List<String> ruta = p.rutaOptimaDistribucion(grafo, "Castillo", "Aldea", 70);
        
        for(String s : ruta) {
        	System.out.print(" | " + s);
        }
	}
}
