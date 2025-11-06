package ar.edu.unlp.info.oo1.ejercicio22;
import java.time.LocalDate;

public class Delivery extends Entrega{
	private String direccion;
	
	public Delivery(LocalDate fechaHora, String direccion) {
		super(fechaHora, false);
		this.direccion = direccion;
	}
}
