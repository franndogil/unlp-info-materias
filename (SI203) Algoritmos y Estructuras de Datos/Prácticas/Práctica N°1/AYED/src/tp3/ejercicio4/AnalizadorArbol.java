package tp3.ejercicio4;

import tp1.ejercicio8.Queue;
import tp3.ejercicio1.GeneralTree;
import java.util.*;

public class AnalizadorArbol {
	 public double devolverMaximoPromedio (GeneralTree<AreaEmpresa> arbol){
		 if(arbol.isEmpty()) {
			 return -1;
		 }
		 Queue<GeneralTree> cola = new Queue<>();
		 GeneralTree<AreaEmpresa> aux;	//aux para desencolar
		 
		 cola.enqueue(arbol);	//encolo el primero
		 cola.enqueue(null);	//separo el primer nivel del resto
		 
		 double promedioMax = 0;	//maximo registrado
		 int cont = 0;
		 double sumador = 0;
		 double promedio = 0;
		 
		 while(!cola.isEmpty()) {	
			 aux = cola.dequeue();	//desencolo en aux
			 if(aux != null) {
				 List<GeneralTree<AreaEmpresa>> listAux = aux.getChildren();
				 if(listAux.size()!=0) {
					 cont = listAux.size();
					 for(GeneralTree<AreaEmpresa> c : listAux) {
						 sumador = sumador + c.getData().getTardanza();
						 cola.enqueue(c);
					 }
				 }
			 }
			 else if(!cola.isEmpty()) {	
				 cola.enqueue(null);
				 promedio = (sumador / cont);
				 if(promedio > promedioMax) promedioMax = promedio;
				 cont = 0;
				 sumador = 0;
			 }
		 }
		 return promedioMax;
	}
}


