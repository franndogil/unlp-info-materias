package ar.edu.unlp.info.oo1.ejercicio21;
import java.time.LocalDate;

public class EnvioLocal extends Envio implements IEnvio{
	private boolean envioRapido;
	
	public EnvioLocal(LocalDate fecha, String direcOrigen, String direcDestino, double peso) {
		super(fecha, direcOrigen, direcDestino, peso);
		this.envioRapido = false;
	}
	
	public double calcularCosto() {
		double costo = 1000;
		if(this.isEnvioRapido()) {
			costo += 500;
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
