package tp1.ejercicio5;

public class Calculadora {
	public static Respuesta puntoA(Integer[] vectorValores){
        Respuesta respuesta = new Respuesta();
        double suma = 0;

        for(int i=0; i<vectorValores.length; i++) {
            if(vectorValores[i] > respuesta.getMax()) {
                respuesta.setMax(vectorValores[i]);
            }
            if(vectorValores[i] < respuesta.getMin()) {
                respuesta.setMin(vectorValores[i]);
            }
            suma = suma + vectorValores[i];
        }

        respuesta.setProm(suma/vectorValores.length);
        return respuesta;
    }
	
	public static void puntoB(Integer[] vectorValores, Respuesta res) {
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		int prom = 0;
		
		for(int i=0; i<vectorValores.length; i++) {
            if(vectorValores[i] > max) {
                max = vectorValores[i];
            }
            if(vectorValores[i] < min) {
                min = vectorValores[i];
            }
            prom = prom + vectorValores[i];
        }
		res.setMax(max);
		res.setMin(min);
		res.setProm(prom/vectorValores.length);
	}
	
	public static void puntoC(Integer[] vectorValores){
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		int prom = 0;
		
		for(int i=0; i<vectorValores.length; i++) {
            if(vectorValores[i] > max) {
                max = vectorValores[i];
            }
            if(vectorValores[i] < min) {
                min = vectorValores[i];
            }
            prom = prom + vectorValores[i];
        }
		Respuesta res = new Respuesta();
		
		res.setMax(max);
		res.setMin(min);
		res.setProm(prom/vectorValores.length);
	}
}
