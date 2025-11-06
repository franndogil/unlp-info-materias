package ar.edu.unlp.info.oo1.ejercicio22;

public class Vianda extends Producto{
	private boolean sinTacc;
	private boolean disponible;
	
	public Vianda (String nombre, double precio, boolean sinTacc, boolean disponible) {
		super(nombre, precio);
		this.sinTacc = sinTacc;
		this.disponible = disponible;
	}
	
	public boolean getSinTacc() {
		return this.sinTacc;
	}
}
