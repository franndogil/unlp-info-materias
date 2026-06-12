package parciales.grafos.segundafechafecha2024.parcial3;
import java.util.*;
import tp5.ejercicio1.*;
import tp1.ejercicio8.Queue;

public class Parcial {
	public Tupla nivelPopularidad(Graph<String> red, String usuario, int distancia, int umbral) {
		Tupla tupla = new Tupla();
		
		if(red != null && !red.isEmpty()) {
			Vertex<String> origen = red.search(usuario);
			
			if(origen != null) {
				if(distancia > 0 && umbral > 0) {
					boolean[] marcas = new boolean[red.getSize()];
					Queue<Vertex<String>> cola = new Queue<>();
					Vertex<String> aux;
					int distAct = 0;
					
					cola.enqueue(origen);
					cola.enqueue(null);
					marcas[origen.getPosition()] = true;
					
					while(!cola.isEmpty()) {
						aux = cola.dequeue();
						if(aux != null) {
							if(distAct == distancia) {
								tupla.incrementarCantidad();
							}
							//encolo adyacentes
							List<Edge<String>> listAdy = red.getEdges(aux);
							Iterator<Edge<String>> it = listAdy.iterator();
							while(it.hasNext()) {
								Edge<String> e = it.next();
								int pos = e.getTarget().getPosition();
								if(!marcas[pos]) {
									marcas[pos] = true;
									cola.enqueue(e.getTarget());
								}
							}
						}
						else if(!cola.isEmpty()) {
							cola.enqueue(null);
							distAct++;
						}
					}
				}
			}
			if(tupla.getCantidad() >= umbral) {
				tupla.siEsPopular();
			}
		}
		return tupla;
	}
	
	public static void main(String args[]) {
        Graph<String> grafo = new AdjListGraph<String>();
        Vertex<String> v1 = grafo.createVertex("Lionel");
        Vertex<String> v2 = grafo.createVertex("Rodrigo");
        Vertex<String> v3 = grafo.createVertex("Ángel");
        Vertex<String> v4 = grafo.createVertex("Emiliano");
        Vertex<String> v5 = grafo.createVertex("Julián");
        Vertex<String> v6 = grafo.createVertex("Diego");
        Vertex<String> v7 = grafo.createVertex("Lautaro");
        Vertex<String> v8 = grafo.createVertex("Enzo");
        
        grafo.connect(v1, v2);
        grafo.connect(v2, v1);
        
        grafo.connect(v1, v3);
        grafo.connect(v3, v1);
        
        grafo.connect(v2, v4);
        grafo.connect(v4, v2);
        
        grafo.connect(v2, v5);
        grafo.connect(v5, v2);
        
        grafo.connect(v3, v5);
        grafo.connect(v5, v3);
        
        grafo.connect(v3, v6);
        grafo.connect(v6, v3);
        
        grafo.connect(v6, v7);
        grafo.connect(v7, v6);
        
        grafo.connect(v5, v7);
        grafo.connect(v7, v5);
        
        grafo.connect(v6, v8);
        grafo.connect(v8, v6);
        
        grafo.connect(v4, v8);
        grafo.connect(v8, v4);
        
        grafo.connect(v4, v7);
        grafo.connect(v7, v4);
        
        Parcial p = new Parcial();
        
        System.out.println(p.nivelPopularidad(grafo, "Lionel", 2, 3));
        System.out.println(p.nivelPopularidad(grafo, "Lionel", 1, 2));
        System.out.println(p.nivelPopularidad(grafo, "Lautaro", 1, 4));
    }
}
