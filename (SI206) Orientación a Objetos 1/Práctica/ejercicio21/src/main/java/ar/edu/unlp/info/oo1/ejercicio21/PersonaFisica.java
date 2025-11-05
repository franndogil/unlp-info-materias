package ar.edu.unlp.info.oo1.ejercicio21;
import java.time.LocalDate;

public class PersonaFisica extends Cliente {
	private int dni;
	
	public PersonaFisica(String nombre, String direccion, int dni) {
		super(nombre, direccion);
		this.dni = dni;
	}
	
	@Override
	public double montoPagar(LocalDate inicio, LocalDate fin) {
		double monto = super.montoPagar(inicio, fin);
		monto = (monto * 0.9);
		return monto;
	}
}