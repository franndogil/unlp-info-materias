package ar.edu.unlp.info.oo1.ejercicio23;
import java.util.*;

public abstract class Usuario {
	private double saldoCuenta;
	private String nombre;
	private String direccion;
	private List<String> desVisitados;

	public Usuario(String nombre, String direccion) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.saldoCuenta = 0;
		this.desVisitados = new LinkedList<String>();
	}
	
	public void descontarViaje(Viaje viaje, double costoPorPasajero) {
		this.descontarSaldo(costoPorPasajero);
		this.descontarExtra(viaje);	//realiza descuento extra
		String destino = viaje.getLocalidadDestino();
		if(destino != null && !this.desVisitados.contains(destino)) {	//actualiza localidades visitadas (no tuve en cuenta la ciudad origen XD)
			this.desVisitados.add(destino);
		}
	}
	
	public abstract void descontarExtra(Viaje viaje);
	
	public List<String> listarDestinosVisitados(){
		return new LinkedList<String>(this.desVisitados);
	}
	
	public void cargarSaldo(double saldo) {
		this.saldoCuenta += saldo;
	}
	
	protected void descontarSaldo(double monto) {
		this.saldoCuenta = this.saldoCuenta - monto;
	}
	
	public double getSaldo() {
		return this.saldoCuenta;
	}
}
