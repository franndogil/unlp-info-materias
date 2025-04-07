package tp1.ejercicio2;

public class metodos {
	public static int[] multiplos(int n) {
		int[] a = new int[n];
		int i = 0;
		
		for (i=0; i<n; i++) {
			a[i] = n * (i+1);
		}
		return a;
	}
}