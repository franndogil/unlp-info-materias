package ar.edu.unlp.info.oo1.ejercicio22;
import java.time.LocalDate;

public class RetiroLocal extends Entrega {
	private int dni;
	
	public RetiroLocal(LocalDate fechaHora, int dni) {
		super(fechaHora, true);
		this.dni = dni;
	}
}
