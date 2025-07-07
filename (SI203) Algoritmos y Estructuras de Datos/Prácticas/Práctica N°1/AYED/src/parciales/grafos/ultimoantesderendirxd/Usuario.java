package parciales.grafos.ultimoantesderendirxd;

public class Usuario {
	private String nombre;
	private int grado;
	
	public Usuario(String nombre, int grado) {
		this.nombre = nombre;
		this.grado = grado;
	}
	
@Override
	
	public String toString() {
		return "Nombre: " + nombre + " Distancia: " + grado;
	}
}
