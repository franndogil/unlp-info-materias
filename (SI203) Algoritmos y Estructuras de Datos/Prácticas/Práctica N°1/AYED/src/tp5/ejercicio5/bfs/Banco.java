package tp5.ejercicio5.bfs;
import tp5.ejercicio1.*;
import tp1.ejercicio8.Queue;
import java.util.*;

public class Banco {
	public List<Persona> retornarListaJubilados(Graph<Persona> grafo, Persona empleado, int gradoMax){
		List<Persona> listaRetorno = new LinkedList<Persona>();
		
		if(grafo != null && !grafo.isEmpty()) {
			Vertex<Persona> origen = grafo.search(empleado);
			
			if(origen != null && gradoMax > 0) {
				boolean [] marcas = new boolean[grafo.getSize()];
				Queue <Vertex<Persona>> cola = new Queue<>();
				Vertex<Persona> aux;
				cola.enqueue(origen);
				cola.enqueue(null);
				int gradoAct = 0;
				
				
				while(!cola.isEmpty()) {
					aux = cola.dequeue();
					if(aux != null) {
						if(aux != origen) {
							if(gradoAct <= gradoMax && listaRetorno.size() < 40  && !aux.getData().esEmpleado() && !aux.getData().percibioJubilacion()) {
								listaRetorno.add(aux.getData());
							}
						}
						//------AGREGO ADYACENTES
						List<Edge<Persona>> listAdy = grafo.getEdges(aux);
						Iterator<Edge<Persona>> it = listAdy.iterator();
						while(it.hasNext() && listaRetorno.size() < 40) {
							Edge<Persona> e = it.next();
							int pos = e.getTarget().getPosition();
							if(!marcas[pos]) {
								marcas[pos] = true;
								cola.enqueue(e.getTarget());
							}
						}
					}
					else if(!cola.isEmpty()) {
						cola.enqueue(null);
						gradoAct++;
					}
				}
			}
		}
		
		return listaRetorno;
	}
	public static void main(String[] args) {
	    Graph<Persona> grafo = new AdjListGraph<>();
	    Persona emp1 = new Persona(true, "Matias",  true);
	    Vertex v1 = grafo.createVertex(emp1);
	    Vertex v2 = grafo.createVertex(new Persona(false, "Julian", false));
	    Vertex v3 = grafo.createVertex(new Persona(false, "Francisco",  false));
	    Vertex v4 = grafo.createVertex(new Persona(true, "Valentin",  true));
	    Vertex v5 = grafo.createVertex(new Persona(false, "Omar",  true));
	    Vertex v6 = grafo.createVertex(new Persona(true, "Rosana",  true));
	    Vertex v7 = grafo.createVertex(new Persona(false, "Maria",  false));
	    Vertex v8 = grafo.createVertex(new Persona(false, "Sandra",  true));
	    Vertex v9 = grafo.createVertex(new Persona(true, "Matheo", false));

	    // NUEVOS VÉRTICES (más jubilados y empleados)
	    Vertex v10 = grafo.createVertex(new Persona(false, "Raul",  false));
	    Vertex v11 = grafo.createVertex(new Persona(false, "Lucia",  true));
	    Vertex v12 = grafo.createVertex(new Persona(false, "Graciela", false));
	    Vertex v13 = grafo.createVertex(new Persona(false, "Pedro", false));
	    Vertex v14 = grafo.createVertex(new Persona(false, "Clara", true));
	    Vertex v15 = grafo.createVertex(new Persona(true, "Carla",  true));
	    Vertex v16 = grafo.createVertex(new Persona(false, "Dario",  false));

	    // Conexiones originales
	    grafo.connect(v1, v2);
	    grafo.connect(v2, v1);
	    grafo.connect(v2, v3);
	    grafo.connect(v3, v2);

	    grafo.connect(v1, v9);
	    grafo.connect(v9, v1);
	    grafo.connect(v9, v8);
	    grafo.connect(v8, v9);

	    grafo.connect(v1, v4);
	    grafo.connect(v4, v1);
	    grafo.connect(v1, v6);
	    grafo.connect(v6, v1);
	    grafo.connect(v4, v5);
	    grafo.connect(v5, v4);
	    grafo.connect(v5, v7);
	    grafo.connect(v7, v5);

	    // NUEVAS CONEXIONES
	    grafo.connect(v3, v10);
	    grafo.connect(v10, v3);

	    grafo.connect(v7, v11);
	    grafo.connect(v11, v7);

	    grafo.connect(v11, v12);
	    grafo.connect(v12, v11);

	    grafo.connect(v12, v13);
	    grafo.connect(v13, v12);

	    grafo.connect(v13, v14);
	    grafo.connect(v14, v13);

	    grafo.connect(v6, v15);
	    grafo.connect(v15, v6);

	    grafo.connect(v15, v16);
	    grafo.connect(v16, v15);

	    Banco banco = new Banco();

	    List<Persona> listaRetorno = banco.retornarListaJubilados(grafo, emp1, 200); // Prueba con distancia = 3

	    for (Persona p : listaRetorno) {
	        System.out.println(p.toString());
	    }
	}
}
