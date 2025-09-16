package ar.edu.unlp.info.oo1.ejercicio5;

public class InversionEnAccion implements Inversion {
	private String nombre;
	private int cantidad;
	private Accion accion;
	
	public InversionEnAccion(String nombre, int cantidad, Accion accion) {
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.accion = accion;
	}
	
	public double getValorActual() {
		return (this.cantidad * this.accion.getValorUnitario());
	}
}
