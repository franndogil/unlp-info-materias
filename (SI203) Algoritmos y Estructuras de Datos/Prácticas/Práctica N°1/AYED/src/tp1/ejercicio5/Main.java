package tp1.ejercicio5;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.println("Ingrese la dimension del arreglo: ");
		int n = s.nextInt();
		
		Respuesta res = new Respuesta();
		Integer[] vectorValores = new Integer[n];
		
		System.out.println("Cargue su arreglo: ");
		for(int i=0; i<n; i++) {
			vectorValores[i] = s.nextInt();
		}
		
		System.out.println(Calculadora.puntoA(vectorValores).toString());
		Calculadora.puntoB(vectorValores, res);
		
		System.out.println(res.getMax());
		System.out.println(res.getMin());
		System.out.println(res.getProm());
		
		
	}
}