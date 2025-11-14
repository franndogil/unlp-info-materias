package ar.edu.unlp.info.oo1.modeloParcial1;
import java.time.LocalDate;


public class Virtual extends Evento{
	private double montoEnvio;
	
	public Virtual (String nombre, LocalDate fecha, String tema, double precioInscripcion, double precioRemera, double montoEnvio) {
		super(nombre, fecha, tema, precioInscripcion, precioRemera);
		this.montoEnvio = montoEnvio;
	}
	
	public double consultarPrecio(LocalDate fechaActual) {
		if(super.getFecha().equals(fechaActual)) {
			return (this.montoEnvio +(super.getPrecioInscripcion() * 1.20 )+ super.getPrecioRemera());
		}
		return (this.montoEnvio + super.getPrecioInscripcion() + super.getPrecioRemera());
	}
}
