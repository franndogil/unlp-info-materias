package ar.edu.unlp.info.oo1.ejercicio20;

public class PoliticaFlexible extends Politica{
	public double reembolsar(Reserva reserva ) {
		return reserva.getCosto();
	}
}
