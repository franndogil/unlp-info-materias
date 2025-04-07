package tp1.ejercicio7;

import java.util.*;

public class ej7 {
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
		//f) 
			System.out.println(Capicua.esCapicua(lista));
	}
}
