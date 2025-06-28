/* Ejercicio 5
 El Banco Itaú se suma a las campañas "QUEDATE EN CASA" lanzando un programa para acercar el sueldo a los
 jubilados hasta sus domicilios. Para ello el banco cuenta con información que permite definir un grafo de
 personas donde la persona puede ser un jubilado o un empleado del banco que llevará el dinero.
 Se necesita armar la cartera de jubilados para cada empleado repartidor del banco, incluyendo en cada lista, los
 jubilados que vivan un radio cercano a su casa y no hayan percibido la jubilación del mes.
 Para ello, implemente un algoritmo que dado un Grafo<Persona> retorne una lista de jubilados que se
 encuentren a una distancia menor a un valor dado del empleado Itaú (grado de separación del empleado Itaú).
 El método recibirá un Grafo<Persona>, un empleado y un grado de separación/distancia y debe retornar una
 lista de hasta 40 jubilados que no hayan percibido la jubilación del mes y se encuentre a una distancia menor a
 recibido como parámetro.*/

package tp5.ejercicio5;

import java.util.*;
import tp5.ejercicio1.*;


public class Banco {
	public List<Persona> retornarJubilados(Graph<Persona> personas, Persona empleado, int distancia){
		List<Persona> listaRetorno = new LinkedList<Persona>();
		
		if(personas != null && !personas.isEmpty()) {
			Vertex<Persona> inicio = personas.search(empleado);			//busco que el empleado exista en la estructura
			
			//no esta encontrando al empleado en el grafo
			
			if(inicio != null) {	
				boolean[] marcas = new boolean[personas.getSize()];

				dfs(personas, inicio, marcas, listaRetorno, 0, distancia);
			}
		}
		return listaRetorno;
	}
	
	private boolean dfs(Graph<Persona>personas, Vertex<Persona> inicio, boolean[] marcas, List<Persona> listaRetorno, int distAct, int distancia) {
		boolean termine = false;
		marcas[inicio.getPosition()] = true;
		if(!inicio.getData().isEmpleado() && !inicio.getData().yaCobro()) {
			if(listaRetorno.size()<40) {
				listaRetorno.add(inicio.getData());
			} else {
				return true;
			}
			List<Edge<Persona>> listAdy = personas.getEdges(inicio);
			Iterator<Edge<Persona>> it = listAdy.iterator();
			while(it.hasNext() && !termine) {
				Edge<Persona> e = it.next();
				int pos = e.getTarget().getPosition();
				if(!marcas[pos] && distAct + e.getWeight() < distancia) {
					termine = dfs(personas, e.getTarget(), marcas, listaRetorno, distAct + e.getWeight(), distancia);
				}
			}
		} else {
			List<Edge<Persona>> listAdy = personas.getEdges(inicio);
			Iterator<Edge<Persona>> it = listAdy.iterator();
			while(it.hasNext() && !termine) {
				Edge<Persona> e = it.next();
				int pos = e.getTarget().getPosition();
				if(!marcas[pos] && distAct + e.getWeight() < distancia) {
					termine = dfs(personas, e.getTarget(), marcas, listaRetorno, distAct + e.getWeight(), distancia);
				}
			}
		}
		return termine;
	}
	
	public static void main(String[] args) {
	    Graph<Persona> grafo = new AdjListGraph<>();
	    Persona emp1 = new Persona(true, "Matias", "AAA", true);
	    Vertex v1 = grafo.createVertex(emp1);
	    Vertex v2 = grafo.createVertex(new Persona(false, "Julian", "BBB", false));
	    Vertex v3 = grafo.createVertex(new Persona(false, "Francisco", "CCC", false));
	    Vertex v4 = grafo.createVertex(new Persona(true, "Valentin", "DDD", true));
	    Vertex v5 = grafo.createVertex(new Persona(false, "Omar", "EEE", true));
	    Vertex v6 = grafo.createVertex(new Persona(true, "Rosana", "FFF", true));
	    Vertex v7 = grafo.createVertex(new Persona(false, "Maria", "GGG", false));
	    Vertex v8 = grafo.createVertex(new Persona(false, "Sandra", "HHH", true));
	    Vertex v9 = grafo.createVertex(new Persona(true, "Matheo", "III", false));

	    // NUEVOS VÉRTICES (más jubilados y empleados)
	    Vertex v10 = grafo.createVertex(new Persona(false, "Raul", "JJJ", false));
	    Vertex v11 = grafo.createVertex(new Persona(false, "Lucia", "KKK", true));
	    Vertex v12 = grafo.createVertex(new Persona(false, "Graciela", "LLL", false));
	    Vertex v13 = grafo.createVertex(new Persona(false, "Pedro", "MMM", false));
	    Vertex v14 = grafo.createVertex(new Persona(false, "Clara", "NNN", true));
	    Vertex v15 = grafo.createVertex(new Persona(true, "Carla", "OOO", true));
	    Vertex v16 = grafo.createVertex(new Persona(false, "Dario", "PPP", false));

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

	    List<Persona> listaRetorno = banco.retornarJubilados(grafo, emp1, 200); // Prueba con distancia = 3

	    for (Persona p : listaRetorno) {
	        System.out.println(p.ToString());
	    }
	}
}
