package ar.edu.unlp.info.oo1.ejercicio23;

public class Vehiculo {
	private String descripcion;
	private int capacidad;
	private int fabricacion;
	private double valor;
	
	public Vehiculo(String descripcion, int capacidad, int fabricacion, double valor) {
		this.descripcion = descripcion;
		this.capacidad = capacidad;
		this.fabricacion = fabricacion;
		this.valor = valor;
	}
	
	public int getCapacidad() {
		return this.capacidad;
	}
	
	public double getValor() {
		return this.valor;
	}
}
