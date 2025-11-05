package ar.edu.unlp.info.oo1.ejercicio21;

import java.time.LocalDate;

public class EnvioInterurbano extends Envio {
	private double distancia;
	
	public EnvioInterurbano(LocalDate fecha, String direcOrigen, String direcDestino, double peso, double distancia) {
		super(fecha, direcOrigen, direcDestino, peso);
		this.distancia = distancia;
	}
	
	public double calcularCosto() {
		double costo = 0;
		if(this.distancia < 100) {
			costo = 20 * super.getPeso();
		}
		if((this.distancia >= 100)&&(this.distancia<=500)){
			costo = 25 * super.getPeso();
		}
		if(this.distancia > 500) {
			costo = 30 * super.getPeso();
		}
		return costo;
	}
}
