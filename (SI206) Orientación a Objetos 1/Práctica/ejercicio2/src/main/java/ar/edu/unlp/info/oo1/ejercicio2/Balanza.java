package ar.edu.unlp.info.oo1.ejercicio2;

import java.time.LocalDate;

public class Balanza {
	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;
	
	public Balanza() {
		this.cantidadDeProductos = 0;
		this.pesoTotal = 0;
		this.pesoTotal = 0;
	}
	public double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public double getPrecioTotal() {
		return this.precioTotal;
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadDeProductos;
	}
	
	public void ponerEnCero() {
		this.pesoTotal = 0;
		this.precioTotal = 0;
		this.cantidadDeProductos = 0;
	}
	
	public void agregarProducto(Producto producto) {
		this.precioTotal += producto.getPrecio();
		this.pesoTotal += producto.getPeso();
		this.cantidadDeProductos += 1;
	}
	
	public Ticket emitirTicket() {
		Ticket ticket = new Ticket(LocalDate.now(), this.cantidadDeProductos, this.pesoTotal, this.precioTotal);
		return ticket;
	}
}
