package ar.edu.unlp.info.oo1.ejercicio19;
import java.time.LocalDate;

public class Reserva {
	private DateLapse periodo;
	private Usuario usuario;
	private Propiedad propiedad;
	
	public Reserva(DateLapse periodo, Usuario usuario, Propiedad propiedad) {
		this.periodo = periodo;
		this.usuario = usuario;
		this.propiedad = propiedad;
	}
	
	public DateLapse getPeriodo() {
		return this.periodo;
	}
	
	public boolean enCurso() {
		LocalDate ld = LocalDate.now();
		
		if(periodo.includesDate(ld)) {
			return true;
		}
		return false;
	}
	 
	public double getCosto() {
		return this.propiedad.getPrecio() * (int) this.periodo.sizeInDays();
	}
	
	public int cantNoches() {
		return (int) this.periodo.sizeInDays();
	}
}