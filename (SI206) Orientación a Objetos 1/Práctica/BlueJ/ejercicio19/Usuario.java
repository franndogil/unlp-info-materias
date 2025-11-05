import java.util.*;

public class Usuario {
	private String nombre;
	private String direccion;
	private int dni;
	private List<Propiedad> propiedades;
	
	public Usuario(String nombre, String direccion, int dni) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.dni = dni;
		this.propiedades = new LinkedList<Propiedad>();
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public String getDireccion() {
		return this.direccion;
	}
	
	public int getDni() {
		return this.dni;
	}
	
	public double calcularIngresos() {				//debo hacerlo con un stream es mas facil en teoria
		double ingresos = 0;
		for(Propiedad p : this.propiedades) {		//for anidado
			for(Reserva r : p.getReservas()) {
				ingresos += r.getCosto();
			}
		}
		ingresos = (ingresos * 0.75);
		return ingresos;
	}
	
	public void agregarPropiedad(Propiedad propiedad) {
		this.propiedades.add(propiedad);
	}
	
	public int cantPropiedades() {
		return this.propiedades.size();
	}
}
