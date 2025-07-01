package parciales.grafos.primerafecha2024;
import tp5.ejercicio1.*;
import java.util.*;

public class Parcial {
	public int resolver(Graph<Recinto> sitios, int tiempo) {
		int cantRecintos = 0;
		
		if(sitios != null && !sitios.isEmpty()) {
			Vertex<Recinto> origen = buscarPorNombre(sitios, "Entrada");
			
			if(origen != null) {
				boolean[] marcas = new boolean[sitios.getSize()];
				cantRecintos = dfs(sitios, origen, marcas, 0, 0, tiempo, 0);
			}
		}
		
		return cantRecintos;
	}
	//----------------------------------------------------------------------------------------------------------------------------
	private int dfs(Graph<Recinto> sitios, Vertex<Recinto> origen, boolean[]marcas, int cantAct, int cantMax, int tiempoMax, int tiempoAct) {
		marcas[origen.getPosition()] = true;
		if(tiempoMax >= tiempoAct + origen.getData().getTiempo()) {
			tiempoAct += origen.getData().getTiempo();
			cantAct += 1;
		}
		if(cantAct > cantMax) {
			cantMax = cantAct;
		}
		
		if(tiempoMax > tiempoAct) {
			List<Edge<Recinto>> listAdy = sitios.getEdges(origen);
			Iterator<Edge<Recinto>> it = listAdy.iterator();
			while(it.hasNext()) {
				Edge<Recinto> e = it.next();
				int pos = e.getTarget().getPosition();
				int tiempoCamino = e.getWeight();
				if(!marcas[pos] && tiempoMax > tiempoAct + tiempoCamino) {
					cantMax = dfs(sitios, e.getTarget(), marcas, cantAct, cantMax, tiempoMax, tiempoAct + tiempoCamino);
				}
			}
		}
		marcas[origen.getPosition()] = false;
		return cantMax;
	}
	
	//---------------------PROCEDIMIENTO PARA ENCONTRAR POR NOMBRE----------------------------------------------------------------
	private Vertex<Recinto> buscarPorNombre(Graph<Recinto> grafo, String nombre){
		for(Vertex<Recinto> v : grafo.getVertices()) {
			if(v.getData().getNombre().equals(nombre)) {
				return v;
			}
		}
		return null;
	}
	//main extraido de guaymas
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
        grafo.connect(Entrada, Tigres, 10);
        grafo.connect(Tigres, Entrada, 10);
        grafo.connect(Entrada, Murcielagos, 20);
        grafo.connect(Murcielagos, Entrada, 20);
        grafo.connect(Entrada, Flamencos, 25);
        grafo.connect(Flamencos, Entrada, 25);
        
        grafo.connect(Tigres, Cebras, 8);
        grafo.connect(Cebras, Tigres, 8);
        grafo.connect(Cebras, Tortugas, 10);
        grafo.connect(Tortugas, Cebras, 10);
        grafo.connect(Flamencos, Murcielagos, 25);
        grafo.connect(Murcielagos, Flamencos, 25);
        grafo.connect(Murcielagos, Wallabies, 10);
        grafo.connect(Wallabies, Murcielagos, 10);
        grafo.connect(Wallabies, Tortugas, 10);
        grafo.connect(Tortugas, Wallabies, 10);
        grafo.connect(Tortugas, Pumas, 15);
        grafo.connect(Pumas, Tortugas, 15);
        
        Parcial p = new Parcial();
        
        System.out.println(p.resolver(grafo, 100));
        System.out.println(p.resolver(grafo, 30));
    }
}
