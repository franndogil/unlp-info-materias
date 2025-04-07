package tp1.ejercicio7;

import java.util.*;		//importamos todo lo de util

public class TestArrayList {
	public static void main(String[] args) {
		List <Integer> lista = new ArrayList<>();
//a) 	
		Scanner s = new Scanner(System.in);
	
		System.out.println("Ingrese el numero a cargar, la carga finaliza cuando se ingresa '0': ");
		int n = s.nextInt();
	
		while(n != 0) {
			lista.add(n);
			n = s.nextInt();
		}
			
		for(Integer i : lista) {	//FOREACH	
			System.out.println(i);
		}
		
		//b) La diferencia entre una LinkedList y un ArrayList es el acceso. En la LinkedList tenemos acceso secuencial y no podriamos usar el foreach.
		
		System.out.println("Impresion con FOR");
		for(int i=0; i < lista.size(); i++) {
			System.out.println(lista.get(i));
		}
//c)
		Iterator ite = lista.iterator();
		
		while(ite.hasNext()) {
			System.out.println(((Integer)ite.next()).intValue());
		}
		
		Iterator <Integer> ite2 = lista.iterator();
		
		while(ite2.hasNext()) {
			System.out.println((ite2.next()).intValue());
		}
//d)	
		List <Estudiante> listaOriginal = new ArrayList();
		
		
		for (int i=0; i<3; i++) {
			Estudiante estudiante = new Estudiante();
			System.out.println("Ingrese los datos del estudiante n" + (i+1));
			estudiante.setApellido(s.next());
			estudiante.setNombre(s.next());
			estudiante.setDireccion(s.next());
			estudiante.setEmail(s.next());
			estudiante.setComision(s.next());
			
			listaOriginal.add(estudiante);
		}
		
		System.out.println("Impresion ORIGINAL");
		for(Estudiante i : listaOriginal) {
			System.out.println("Apellido: " + i.getApellido());
		}
		
		List <Estudiante> listaCopia = new ArrayList(listaOriginal);
		
		System.out.println("Impresion COPIA");
		for(Estudiante i : listaCopia) {
			System.out.println("Apellido: " + i.getApellido());
		}
		
		System.out.println("MODIFICANDO DATOS DE LOS ESTUDIANTES...");
		
		listaOriginal.get(1).setApellido("Sanchez");
		listaOriginal.get(2).setApellido("Karle");
		
		System.out.println("Impresion ORIGINAL");
		for(Estudiante i : listaOriginal) {
			System.out.println("Apellido: " + i.getApellido());
		}

		System.out.println("Impresion COPIA");
		for(Estudiante i : listaCopia) {
			System.out.println("Apellido: " + i.getApellido());
		}
		
		//¿Qué conclusiones obtiene a partir de lo realizado? Al parecer la copia se hace pero queda por referencia, ya que al modificar 
		//la lista original se termino modificando la lista copiada.
		
		//¿Cuántas formas de copiar una lista existen? ¿Qué diferencias existen entre ellas?
		//1) Mediante su constructor
		// ArrayList<String> peliculas_copiadas1 = new ArrayList<String>(peliculas);
		//2) Crear un nuevo ArrayList y agregar todos los elementos del original usando el método addAll()
		// ArrayList<String> peliculas_copiadas2 = new ArrayList<>();
		// peliculas_copiadas2.addAll(peliculas);
		//3) Clonar el ArrayList usando el método clone()
		// ArrayList<String> peliculas_clonadas = (ArrayList<String>)peliculas.clone();
		
	//e. A la lista del punto 7d, agregue un nuevo estudiante. Antes de agregar, verifique que el estudiante no estaba incluido en la lista.
		
		Estudiante estudianteNuevo = new Estudiante("Ciro","De Bruno", "1c", "bot@gmail.com", "Quilmes");
		if(listaOriginal.contains(estudianteNuevo.getApellido())) {
			System.out.println("El estudiante ya pertenece a la lista!");
		}
		else {
			listaOriginal.add(estudianteNuevo);
		}
		
		System.out.println("Impresion lista nueva");
		for(Estudiante i : listaOriginal) {
			System.out.println("Apellido: " + i.getApellido());
		}
		
		//f. Escriba un método que devuelva verdadero o falso si la secuencia almacenada en la lista es o no capicúa: 
		
		System.out.println(Capicua.esCapicua(lista));
	}
}
