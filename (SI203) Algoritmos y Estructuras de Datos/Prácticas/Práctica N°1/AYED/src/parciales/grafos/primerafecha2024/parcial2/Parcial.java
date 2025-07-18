package parciales.grafos.primerafecha2024.parcial2;
import tp5.ejercicio1.*;
import java.util.*;

public class Parcial {
	public String resolver(Graph<Recinto> sitios, int tiempo) {
		boolean estado = false;
		if(sitios != null && !sitios.isEmpty()) {
			Vertex<Recinto> origen = buscarPorNombre(sitios, "Entrada");
			
			if(origen != null) {
				boolean[] marcas = new boolean[sitios.getSize()];
				
				if(tiempo - origen.getData().getTiempo() >= 0) {
					estado = dfs(sitios, origen, tiempo - origen.getData().getTiempo(), 1, sitios.getSize(), marcas );
				}
			}
		}
		return estado ? "Alcanzable" : "No Alcanzable";
	}
	
	 private boolean dfs(Graph<Recinto> sitios, Vertex<Recinto> origen, int tiempo, int cant, int max, boolean[] marcas) {
	        boolean encontre = false;
	        marcas[origen.getPosition()] = true;
	        if(cant == max) {
	            return true;
	        } else {
	            Iterator<Edge<Recinto>> it = sitios.getEdges(origen).iterator();
	            while(it.hasNext() && !encontre) {
	                Edge<Recinto> ady = it.next();
	                Vertex<Recinto> destino = ady.getTarget();
	                int peso = destino.getData().getTiempo() + ady.getWeight(); 
	                int j = destino.getPosition();
	                if(!marcas[j] && peso <= tiempo) {
	                    encontre = this.dfs(sitios, destino, tiempo-peso, cant+1, max, marcas);
	                }
	            }
	        }
	        marcas[origen.getPosition()] = false;
	        return encontre;
	    }
	
	private Vertex<Recinto> buscarPorNombre(Graph<Recinto> grafo, String nombre){
		for(Vertex<Recinto> v : grafo.getVertices()) {
			if(v.getData().getNombre().equals(nombre)) {
				return v;
			}
		}
		return null;
	}
	
	public static void main(String args[]) {
        Graph<Recinto> grafo = new AdjListGraph<Recinto>();
        Vertex<Recinto> Entrada = grafo.createVertex(new Recinto("Entrada", 15));
        Vertex<Recinto> Cebras = grafo.createVertex(new Recinto("Cebras", 10));
        Vertex<Recinto> Tigres = grafo.createVertex(new Recinto("Tigres", 10));
        Vertex<Recinto> Flamencos = grafo.createVertex(new Recinto("Flamencos", 10));
        Vertex<Recinto> Murcielagos = grafo.createVertex(new Recinto("Murciélagos", 20));
        Vertex<Recinto> Wallabies = grafo.createVertex(new Recinto("Wallabies", 30));
        Vertex<Recinto> Tortugas = grafo.createVertex(new Recinto("Tortugas", 10));
        Vertex<Recinto> Pumas = grafo.createVertex(new Recinto("Pumas", 10));
        
        grafo.connect(Entrada, Cebras, 10);
        grafo.connect(Cebras, Entrada, 10);
        grafo.connect(Entrada, Tigres, 15);
        grafo.connect(Tigres, Entrada, 15);
        grafo.connect(Entrada, Murcielagos, 20);
        grafo.connect(Murcielagos, Entrada, 20);
        grafo.connect(Entrada, Flamencos, 25);
        grafo.connect(Flamencos, Entrada, 25);
        
        grafo.connect(Tigres, Cebras, 8);
        grafo.connect(Cebras, Tigres, 8);
        grafo.connect(Cebras, Tortugas, 5);
        grafo.connect(Tortugas, Cebras, 5);
        grafo.connect(Flamencos, Murcielagos, 25);
        grafo.connect(Murcielagos, Flamencos, 25);
        grafo.connect(Murcielagos, Wallabies, 10);
        grafo.connect(Wallabies, Murcielagos, 10);
        grafo.connect(Wallabies, Tortugas, 10);
        grafo.connect(Tortugas, Wallabies, 10);
        grafo.connect(Tortugas, Pumas, 15);
        grafo.connect(Pumas, Tortugas, 15);
        grafo.connect(Pumas, Wallabies, 2);
        grafo.connect(Wallabies, Pumas, 2);
        
        Parcial p = new Parcial();
        
        System.out.println(p.resolver(grafo, 220));
        System.out.println(p.resolver(grafo, 205));
        System.out.println(p.resolver(grafo, 195));
        System.out.println(p.resolver(grafo, 100));
    }
}