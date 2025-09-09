package ar.edu.unlp.info.oo1.ejercicio2;
import java.time.LocalDate;

public class Ticket {
	private LocalDate date;
	private int cantidadDeProductos;
	private double pesoTotal;
	private double precioTotal;
	
	public Ticket(LocalDate date, int cantidadDeProductos, double pesoTotal, double precioTotal) {
		this.date = date;
		this.cantidadDeProductos = cantidadDeProductos;
		this.pesoTotal = pesoTotal;
		this.precioTotal = precioTotal;
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
	
	public LocalDate getFecha() {
		return this.date;
	}
	
	public double impuesto() {
		double impuesto = this.precioTotal * 0.21;
		return impuesto;
	}
}
