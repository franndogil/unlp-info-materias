/*Ejercicio 6
 En este grafo simple, donde los empleados del banco están en
 color rojo, si se desea retornar los jubilados hasta distancia 2, se
 debería retornar los jubilados en color negro.
 La persona conoce si es empleado o jubilado, el nombre y el
 domicilio.
 Un día, Caperucita Roja decide ir desde su casa hasta la de su abuelita, recolectando frutos del bosque del
 camino y tratando de hacer el paseo de la manera más segura posible. La casa de Caperucita está en un claro
 del extremo oeste del bosque, la casa de su abuelita en un claro del extremo este, y dentro del bosque entre
 ambas hay algunos otros claros.
 El bosque está representado por un grafo, donde los vértices representan los claros (identificados por un
 String) y las aristas los senderos que los unen. Cada arista informa la cantidad de árboles frutales que hay en el
 sendero. Caperucita sabe que el lobo es muy goloso y le gustan mucho las frutas, entonces para no ser
 capturada por el lobo, desea encontrar todos los caminos que no pasen por los senderos con cantidad de
 frutales >= 5 y lleguen a la casa de la abuelita.
 Su tarea es definir una clase llamada BuscadorDeCaminos, con una variable de instancia llamada "bosque" de
 tipo Graph, que representa el bosque descrito e implementar un método de instancia con la siguiente firma:
 public List < List <String>> recorridosMasSeguro()
 que devuelva un listado con TODOS los caminos que cumplen con las condiciones mencionadas anteriormente.
 Nota: La casa de Caperucita debe ser buscada antes de comenzar a buscar el recorrido.
 Para el siguiente ejemplo:*/

package tp5.ejercicio6;

import tp5.ejercicio1.*;
import java.util.*;

public class BuscadorDeCaminos {
	private Graph<String> bosque;
	
	public BuscadorDeCaminos(Graph<String> bosque) {
		this.bosque = bosque;
	}
	
	public List <List<String>> recorridosMasSeguro(){
		List<List<String>> caminosSeguros = new LinkedList<List<String>>();
		
		if(this.bosque != null && !this.bosque.isEmpty()) {
			Vertex<String> origen = this.bosque.search("Casa Caperucita");
			Vertex<String> destino = this.bosque.search("Casa Abuelita");
			
			if(origen != null && destino != null) {
				boolean[] marcas = new boolean[this.bosque.getSize()];
				caminosSegurosRecursivo(origen, destino, marcas, caminosSeguros, new LinkedList<String>());
			}
		}
		return caminosSeguros;
	}
	
	private void caminosSegurosRecursivo(Vertex<String> origen, Vertex<String> destino, boolean[] marcas, List<List<String>> caminosSeguros, List<String> caminoAct) {
		marcas[origen.getPosition()] = true;
		caminoAct.add(origen.getData());
		
		if(origen == destino) {											//si llegue al destino es porque estaba todo ok, asi que guardo el camino
			List<String> nuevaLista = new LinkedList<String>();
			nuevaLista.addAll(caminoAct);
			caminosSeguros.add(nuevaLista);
		}
		else {
			List<Edge<String>> listAdy = this.bosque.getEdges(origen);
			Iterator<Edge<String>> it = listAdy.iterator();
			while(it.hasNext()) {
				Edge<String> e = it.next();
				int pos = e.getTarget().getPosition();
				if(!marcas[pos] && e.getWeight() < 5) {
					caminosSegurosRecursivo(e.getTarget(), destino, marcas, caminosSeguros, caminoAct);
				}
			}
		}
		//aca debo implementar el backtraking
		//primero desmarco
		marcas[origen.getPosition()] = false;
		caminoAct.remove(caminoAct.size()-1);
	}
	
	public static void main (String[] args) {
        Graph<String> bosque = new AdjListGraph<String>();
        Vertex<String> v1 = bosque.createVertex("Casa Caperucita");
        Vertex<String> v2 = bosque.createVertex("Claro 3");
        Vertex<String> v3 = bosque.createVertex("Claro 1");
        Vertex<String> v4 = bosque.createVertex("Claro 2");
        Vertex<String> v5 = bosque.createVertex("Claro 5");
        Vertex<String> v6 = bosque.createVertex("Claro 4");
        Vertex<String> v7 = bosque.createVertex("Casa Abuelita");
        bosque.connect(v1, v2, 4);
        bosque.connect(v2, v1, 4);
        bosque.connect(v1, v3, 3);
        bosque.connect(v3, v1, 3);
        bosque.connect(v1, v4, 4);
        bosque.connect(v4, v1, 4);
        bosque.connect(v2, v5, 15);
        bosque.connect(v5, v2, 15);
        bosque.connect(v3, v5, 3);
        bosque.connect(v5, v3, 3);
        bosque.connect(v4, v3, 4);
        bosque.connect(v3, v4, 4);
        bosque.connect(v4, v5, 11);
        bosque.connect(v5, v4, 11);
        bosque.connect(v4, v6, 10);
        bosque.connect(v6, v4, 10);
        bosque.connect(v4, v3, 4);
        bosque.connect(v3, v4, 4);
        bosque.connect(v5, v7, 4);
        bosque.connect(v7, v5, 4);
        bosque.connect(v6, v7, 9);
        bosque.connect(v7, v6, 9);
        BuscadorDeCaminos bos = new BuscadorDeCaminos(bosque);
        List<List<String>> lis = bos.recorridosMasSeguro();
        for(List<String> l: lis) {
            System.out.println(l);
        }

    }
}
