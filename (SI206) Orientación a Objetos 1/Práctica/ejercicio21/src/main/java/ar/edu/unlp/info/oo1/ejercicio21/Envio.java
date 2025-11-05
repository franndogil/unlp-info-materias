package ar.edu.unlp.info.oo1.ejercicio21;
import java.time.LocalDate;

public abstract class Envio {
	private LocalDate fecha;
	private String direcOrigen;
	private String direcDestino;
	private double peso;
	
	public Envio(LocalDate fecha, String direcOrigen, String direcDestino, double peso) {
		this.fecha = fecha;
		this.direcOrigen = direcOrigen;
		this.direcDestino = direcDestino;
		this.peso = peso;
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	abstract double calcularCosto();
}
