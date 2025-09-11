package ar.edu.unlp.info.oo1.ejercicio4;
import java.util.*;
import java.time.LocalDate;

public class Ticket {
	private LocalDate date;
	private List<Producto> productos;
	
	public Ticket(LocalDate date, List<Producto> productos) {
		this.date = date;
		this.productos = new LinkedList<Producto>();
		for (Producto p : productos) {
	        this.productos.add(new Producto(p.getDescripcion(), p.getPeso(), p.getPrecioPorKilo()));
	    }
		
		//De esta manera, los productos dentro del ticket 
		//son copias independientes y no se verán afectados si 
		//luego cambia el precio en los productos originales.
	}
	
	public double getPesoTotal() {
		return this.productos.stream()
				.mapToDouble(productos->productos.getPeso())
				.sum();
	}
	
	public double getPrecioTotal() {
		return this.productos.stream()
				.mapToDouble(productos->productos.getPrecio())
				.sum();
	}
	
	public int getCantidadDeProductos() {
		return this.productos.size();
	}
	
	public LocalDate getFecha() {
		return this.date;
	}
	
	public double impuesto() {
		double impuesto = this.getPrecioTotal() * 0.21;
		return impuesto;
	}
}
