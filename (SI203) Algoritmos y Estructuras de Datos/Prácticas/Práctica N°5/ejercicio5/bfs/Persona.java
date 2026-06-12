package tp5.ejercicio5.bfs;

public class Persona {
	private String nombre;
	private boolean esEmpleado;
	private boolean percibioJubilacion;
	
	public Persona() {
		
	}
	
	public Persona(boolean esEmpleado, String nombre , boolean percibioJubilacion) {
		this.esEmpleado = esEmpleado;
		this.percibioJubilacion = percibioJubilacion;
		this.nombre = nombre;
	}
	
	public boolean esEmpleado() {
		return esEmpleado;
	}
	
	public boolean percibioJubilacion() {
		return percibioJubilacion;
	}
	
	@Override
	
	public String toString() {
		return nombre;
	}
}
