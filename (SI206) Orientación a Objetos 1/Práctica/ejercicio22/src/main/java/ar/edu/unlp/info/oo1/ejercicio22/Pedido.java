package ar.edu.unlp.info.oo1.ejercicio22;
import java.time.LocalDate;

public abstract class Pedido {
	private String email;
	private Entrega entrega;
	private LocalDate fechaHora;
	
	public Pedido(String email, Entrega entrega) {
		this.email = email;
		this.entrega = entrega;
		this.fechaHora = LocalDate.now();
	}
	
	public double calcularTiempoEspera() {
		if(this.entrega.isRetiro()) {
			return (double) java.time.temporal.ChronoUnit.HOURS.between(this.fechaHora, entrega.getFechaEntrega());
		} else{
			//modelar uso de GPS (se ocupa la empresa)
		}
		return 0;
	}
	
	public abstract double calcularCosto();
}

