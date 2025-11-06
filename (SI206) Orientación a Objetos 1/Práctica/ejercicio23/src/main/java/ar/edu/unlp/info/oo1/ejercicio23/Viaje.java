package ar.edu.unlp.info.oo1.ejercicio23;
import java.time.LocalDate;
import java.util.*;

public class Viaje {
	private double costoTotal;
	private String localidadO;
	private String localidadD;
	private LocalDate fechaSalida;
	private int lugaresOcupados;
	private Vehiculo vehiculo;
	private List<Usuario> pasajeros;
	
	public Viaje(double costoTotal, String localidadO, String localidadD, LocalDate fechaSalida) {
		this.costoTotal = costoTotal;
		this.localidadO = localidadO;
		this.localidadD = localidadD;
		this.fechaSalida = fechaSalida;
		this.vehiculo = null;
		this.pasajeros = new LinkedList<Usuario>();
	}
	
	public void cobrarViaje() {
		double costoPorPasajero = this.getCostoPorPasajero();
		List<Usuario> copia = new LinkedList<Usuario>(this.pasajeros);	//recorro la copia
		for(Usuario usuario : copia) {
			usuario.descontarViaje(this, costoPorPasajero);
		}
	}
	
	public void registrarPasajero(Pasajero pasajero) {
		if(this.vehiculo == null) return;
		if(pasajero.getSaldo() < 0) return;
		if(this.pasajeros.size() < this.vehiculo.getCapacidad()) {
			this.pasajeros.add(pasajero);
		}
	}
	
	public double getCostoPorPasajero() {
		return (this.costoTotal / this.lugaresOcupados);
	}
	
	public void asignarVehiculo(Vehiculo vehiculo) {
		if(this.vehiculo == null) {
			this.vehiculo = vehiculo;
		}
	}
	
	public void asignarConductor(Conductor conductor) {
		if(!this.pasajeros.contains(conductor)) {
			this.pasajeros.add(conductor);
		}
	}
	
	public Vehiculo getVehiculoAsignado() {
		return this.vehiculo;
	}
	
	public String getLocalidadDestino() {
		return this.localidadD;
	}
}
