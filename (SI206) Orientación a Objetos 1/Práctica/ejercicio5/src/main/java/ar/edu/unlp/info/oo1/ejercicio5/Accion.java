package ar.edu.unlp.info.oo1.ejercicio5;

public class Accion {
	private String nombre;
	private double valorUnitario;
	
	public Accion(String nombre, double valorUnitario) {
		this.nombre = nombre;
		this.valorUnitario =  valorUnitario;
	}
	
	public double getValorUnitario() {
		return this.valorUnitario;
	}
}
