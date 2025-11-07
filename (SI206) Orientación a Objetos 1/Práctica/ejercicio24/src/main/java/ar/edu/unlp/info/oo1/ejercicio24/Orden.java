package ar.edu.unlp.info.oo1.ejercicio24;
import java.util.*;
import java.time.LocalDate;

public abstract class Orden {
	private LocalDate fecha;
	private Usuario usuario;
	private String domicilio;
	private List<Producto> productos;
	
	public Orden(LocalDate fecha, Usuario usuario, String domicilio) {
		this.fecha = fecha;
		this.usuario = usuario;
		this.domicilio = domicilio;
		this.productos = new LinkedList<Producto>();
	}
	
	public abstract double calcularCosto();
	
	public List<Producto> getProductos(){
		return new LinkedList<Producto>(this.productos);
	}
	
	public void agregarProducto(Producto producto) {
		if(producto != null) {
			this.productos.add(producto);
		}
	}
}
