package parciales.grafos.simulacro2024.parcial;

public class Ciudad {
	private String nombre;
	private int dias;
	
	public Ciudad(String nombre, int dias) {
		this.dias = dias;
		this.nombre = nombre;
	}
	
	public int getDias() {
		return dias;
	}
	
	public String getNombre() {
		return nombre;
	}
}
