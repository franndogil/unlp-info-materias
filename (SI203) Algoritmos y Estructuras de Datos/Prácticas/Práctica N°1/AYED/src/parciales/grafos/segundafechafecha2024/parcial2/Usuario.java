package parciales.grafos.segundafechafecha2024.parcial2;

public class Usuario {
	private String nombre;
	private int distancia;
	
	public Usuario() {
		
	}
	
	public Usuario(String nombre, int distancia) {
		this.nombre = nombre;
		this.distancia = distancia;
	}
	
	@Override
	
	public String toString() {
		return "Nombre: " + nombre + " Distancia: " + distancia;
	}
}
