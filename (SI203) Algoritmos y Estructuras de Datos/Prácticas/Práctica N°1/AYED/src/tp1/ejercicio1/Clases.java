package tp1.ejercicio1;

public class Clases {
	
	public static void impresionFor(int a, int b) {
		int i = 0;
		for (i=a; i<=b; i++) {
			System.out.println(i);
		}
	}
	
	public static void impresionWhile(int a, int b) {
		int i=a;
		while(i<=b) {
			System.out.println(i);
			i++;
		}
	}
	
	public static void impresionSinEstructuras(int a, int b) {
		if(a<=b){
			System.out.println(a);
			Clases.impresionSinEstructuras(a+1, b);
		}
	}
	
}