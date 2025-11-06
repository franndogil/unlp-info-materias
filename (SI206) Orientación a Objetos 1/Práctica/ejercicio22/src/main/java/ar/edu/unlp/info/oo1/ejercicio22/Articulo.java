package ar.edu.unlp.info.oo1.ejercicio22;

public class Articulo extends Producto{
	private String categoria;
	private double pesoEnKg;
	private int stock;
	
	public Articulo(String nombre, double precio, String categoria, double precioEnKg, int stock) {
		super(nombre, precio);
		this.categoria = categoria;
		this.pesoEnKg = precioEnKg;
		this.stock = stock;
	}
	
	public double getPesoEnKg() {
		return this.pesoEnKg;
	}
}
