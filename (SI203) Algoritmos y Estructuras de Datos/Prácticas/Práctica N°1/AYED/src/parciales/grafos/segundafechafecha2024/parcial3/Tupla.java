package parciales.grafos.segundafechafecha2024.parcial3;

public class Tupla {
	private int cantidad;
	private boolean popularidad;
	
	public Tupla() {
		cantidad = 0;
		popularidad = false;
	}
	
	public Tupla(int cantidad, boolean popularidad) {
		this.cantidad = cantidad;
		this.popularidad = popularidad;
	}
	
	public void incrementarCantidad() {
		cantidad++;
	}
	
	public boolean esPopular() {
		return popularidad;
	}
	
	public void siEsPopular(){
		popularidad = true;
	}
	
	public int getCantidad() {
		return cantidad;
	}
	
	@Override
	
	public String toString() {
		return "Cantidad: " + cantidad + " Es popular?: " + popularidad; 
	}
}
