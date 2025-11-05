package ar.edu.unlp.info.oo1.ejercicio20;

public class PoliticaModerada extends Politica{
	public double reembolsar(Reserva reserva) {
		if (reserva.cantNoches() >= 7) {
			return reserva.getCosto();
		}
		if (reserva.cantNoches() > 2) {
			return reserva.getCosto() * 0.5;
		}
		return 0;
	}
}
