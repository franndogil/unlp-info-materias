package ar.edu.unlp.info.oo1.ejercicio4;

public class Producto {
	private double peso;
	private double precioPorKilo;
	private String descipcion;
	
	public Producto(String descripcion, double peso, double precioPorKilo) {
		this.peso = peso;
		this.precioPorKilo = precioPorKilo;
		this.descipcion = descripcion;
	}
	
	public double getPrecio() {
		return (this.precioPorKilo * this.peso);
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public String getDescripcion() {
		return this.descipcion;
	}
	
	public double getPrecioPorKilo() {
		return this.precioPorKilo;
	}
	
	public void setPrecioPorKilo(double precioPorKilo) {
		this.precioPorKilo = precioPorKilo;
	}
}
