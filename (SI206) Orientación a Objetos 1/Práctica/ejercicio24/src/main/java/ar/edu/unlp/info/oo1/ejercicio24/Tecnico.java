package ar.edu.unlp.info.oo1.ejercicio24;

public class Tecnico {
	private String nombreCompleto;
	private String especialidad;
	private double valorHora;
	
	public Tecnico(String nombreCompleto, String especialidad, double valorHora) {
		this.nombreCompleto = nombreCompleto;
		this.especialidad = especialidad;
		this.valorHora = valorHora;
	}
	
	public double getValorHora() {
		return this.valorHora;
	}
}
