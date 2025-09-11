package ar.edu.unlp.info.oo1.ejercicio5;
import java.util.*;

public class Inversor{	//
	private String nombre;
	private List<Inversion> inversiones;
	
	public Inversor(String nombre) {
		this.nombre = nombre;
		this.inversiones = new LinkedList<Inversion>();
	}
	
	public void agregarInversion(Inversion inversion) {
		this.inversiones.add(inversion);
	}
	
	public void retirarInversion(Inversion inversion) {
		this.inversiones.remove(inversion);
	}
	
	public double getValorActual() {	//funciona
		return inversiones.stream()
				.mapToDouble(inversiones->inversiones.getValorActual())
				.sum();
	}
}
