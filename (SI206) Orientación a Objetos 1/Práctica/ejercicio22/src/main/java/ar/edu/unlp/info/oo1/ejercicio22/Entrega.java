package ar.edu.unlp.info.oo1.ejercicio22;
import java.time.LocalDate;

public abstract class Entrega {
	private LocalDate fechaHora;
	private boolean retiro;
	
	public Entrega(LocalDate fechaHora, boolean retiro) {
		this.fechaHora = fechaHora;
		this.retiro = retiro;
	}
	
	public boolean isRetiro() {
		return this.retiro;
	}
	
	public LocalDate getFechaEntrega() {
		return this.getFechaEntrega();
	}
}
