package parciales.grafos.ultimoantesderendirxd;
import tp5.ejercicio1.*;
import java.util.*;

import tp1.ejercicio8.Queue;

public class Parcial {
	public List<Usuario> invitacionMasterClass(Graph<String> red, String usuario, int distancia, int limite){
		List<Usuario> lRet = new LinkedList<Usuario>();
		
		if(red != null && !red.isEmpty()) {
			Vertex<String> origen = red.search(usuario);
			if(distancia > 0 && limite > 0) {
				boolean[] marcas = new boolean [red.getSize()];
				int grado = 0;
				int cAct = 0;
				Queue<Vertex<String>> cola = new Queue<>();
				cola.enqueue(origen);
				cola.enqueue(null);
				Vertex<String> aux;
				while(!cola.isEmpty()) {
					aux = cola.dequeue();
					if(aux != null) {
						if(aux.getData() != origen.getData() && cAct<limite && grado <= distancia) {
							Usuario u = new Usuario(aux.getData(), grado);
							lRet.add(u);
							cAct++;
						}
						List<Edge<String>> listAdy = red.getEdges(aux);
						Iterator<Edge<String>> it = listAdy.iterator();
						while(it.hasNext() && cAct<40) {
							Edge<String> e = it.next();
							if(!marcas[e.getTarget().getPosition()]) {
								marcas[e.getTarget().getPosition()] = true;
								cola.enqueue(e.getTarget());
							}
						}
					}else if(!cola.isEmpty()) {
						cola.enqueue(null);
						grado++;
					}
				}
			}
		}
		return lRet;
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
        
        List<Usuario> lista1 = p.invitacionMasterClass(grafo, "Lionel", 3, 2);
        List<Usuario> lista2 = p.invitacionMasterClass(grafo, "Enzo", 3, 6);
        
        System.out.println("LISTA 1");
        for(Usuario u : lista1) {
        	System.out.println(u.toString());
        }
        
        
        System.out.println("LISTA 2");
        for(Usuario u : lista2) {
        	System.out.println(u.toString());
        }
    }
}
