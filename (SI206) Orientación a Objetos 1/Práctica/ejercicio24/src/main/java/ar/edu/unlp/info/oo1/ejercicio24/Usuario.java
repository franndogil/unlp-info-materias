package ar.edu.unlp.info.oo1.ejercicio24;
import java.util.*;

public class Usuario {
	private String nombreCompleto;
	private String domicilio;
	private List<Orden> ordenes;
	
	public Usuario(String nombreCompleto, String direccion) {
		this.nombreCompleto = nombreCompleto;
		this.domicilio = domicilio;
		this.ordenes = new LinkedList<Orden>();
	}
	
	public List<Orden> getOrdenes(){
		return new LinkedList<Orden>(this.ordenes);
	}
	
	public void agregarOrden(Orden orden) {
		this.ordenes.add(orden);
	}
	
	public String getDomicilio() {
		return this.domicilio;
	}
}
