package tp1.ejercicio2;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in) ;
		int n = s.nextInt();
		
		int[] array = new int[n];
		array = metodos.multiplos(n);
		
		int i = 0;
		
		for (i=0; i<n; i++) {
			System.out.println(array[i]);
		}
	}
	
	
}
