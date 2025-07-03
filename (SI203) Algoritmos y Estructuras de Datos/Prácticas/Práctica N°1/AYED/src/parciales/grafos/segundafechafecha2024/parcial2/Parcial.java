package parciales.grafos.segundafechafecha2024.parcial2;
import java.util.*;
import tp5.ejercicio1.*;
import tp1.ejercicio8.Queue;

public class Parcial {
	public List<Usuario> invitacionMasterClass(Graph<String> red, String usuario, int distancia, int limite){
		List<Usuario> listaRetorno = new LinkedList<Usuario>();
		
		if(red != null && !red.isEmpty()) {
			Vertex<String> origen = red.search(usuario);
			
			if(origen != null) {
				boolean[] marcas = new boolean[red.getSize()];
				Queue<Vertex<String>> cola = new Queue<>();
				Vertex<String> aux;
				cola.enqueue(origen);
				cola.enqueue(null);
				marcas[origen.getPosition()] = true;
				int cantPersonas = 0;
				int distAct = 0;
				
				while(!cola.isEmpty()) {
					aux = cola.dequeue();	//desencolo
					if(aux != null) {
						if(distAct <= distancia && cantPersonas <limite && aux.getData() != usuario) {
							Usuario nuevoUsuario = new Usuario(aux.getData(), distAct);
							cantPersonas++;
							listaRetorno.add(nuevoUsuario);
						}
						List<Edge<String>> listAdy = red.getEdges(aux);
						Iterator<Edge<String>> it = listAdy.iterator();
						while(it.hasNext() && cantPersonas < limite) {
							Edge<String> e = it.next();
							int pos = e.getTarget().getPosition();
							if(!marcas[pos]) {
								marcas[pos] = true;
								cola.enqueue(e.getTarget());		//si no esta marcado, lo marco y lo agrego a la cola
							}
						}
					}
					else if(!cola.isEmpty()){
						cola.enqueue(null);
						distAct++;
					}
				}
			}
		}
		
		return listaRetorno;
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
        
        List<Usuario> lista1 = p.invitacionMasterClass(grafo, "Lionel", 3, 10);
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
