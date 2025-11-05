package ar.edu.unlp.info.oo1.ejercicio21;

import java.time.LocalDate;
public class EnvioInternacional extends Envio implements IEnvio {
	private boolean envioRapido;
	
	public EnvioInternacional(LocalDate fecha, String direcOrigen, String direcDestino, double peso) {
		super(fecha, direcOrigen, direcDestino, peso);
		this.envioRapido = false;
	}
	
	public double calcularCosto() {
		double costo = 5000;
		
		if(super.getPeso() <= 1000) {
			costo += (super.getPeso() * 10);
		}else {
			costo += (super.getPeso() * 12);
		}
		
		if(this.isEnvioRapido()) {
			costo += 800;
		}
		
		return costo;
	}
	
	public void envioRapido() {
		this.envioRapido = true;
	}
	
	public boolean isEnvioRapido() {
		return this.envioRapido;
	}
}
