package ar.edu.unlp.info.oo1.ejercicio23;

public class Pasajero extends Usuario {
	private static final double BONO_VIAJERO_FRECUENTE = 5000.0;
	
	public Pasajero(String nombre, String direccion) {
		super(nombre, direccion);
	}
	
	@Override
	public void descontarExtra(Viaje viaje) {	//viaje no se esta usando aca
		if(super.listarDestinosVisitados().size() > 0) {
			super.descontarSaldo(BONO_VIAJERO_FRECUENTE);
		}
	}

}
