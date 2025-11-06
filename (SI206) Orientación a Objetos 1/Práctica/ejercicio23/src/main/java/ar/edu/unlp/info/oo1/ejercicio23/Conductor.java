package ar.edu.unlp.info.oo1.ejercicio23;
import java.util.*;

public class Conductor extends Usuario {
	private List<Vehiculo> vehiculos;
	private List<Viaje> viajes;
	
	public Conductor(String nombre, String direccion) {
		super(nombre, direccion);
		this.vehiculos = new LinkedList<Vehiculo>();
		this.viajes = new LinkedList<Viaje>();
	}
	
	public void registrarVehiculo(Vehiculo vehiculo) {
		this.vehiculos.add(vehiculo);
	}
	
	public void crearViaje(Vehiculo vehiculo, Viaje viaje) {
		if(this.vehiculos.contains(vehiculo)) {
			this.viajes.add(viaje);
			viaje.asignarVehiculo(vehiculo);
			viaje.asignarConductor(this);
		}
	}
	
	@Override
	public void descontarExtra(Viaje viaje) {
		if(this.viajes.contains(viaje)) {
			Vehiculo v = viaje.getVehiculoAsignado();
			if(v != null) {
				double valor = v.getValor();
				super.descontarSaldo(valor * 0.001);
				this.finalizarViaje(viaje);
			}
		}
	}
	
	public void finalizarViaje(Viaje viaje) {
		this.viajes.remove(viaje);
	}
}
