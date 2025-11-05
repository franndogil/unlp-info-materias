 
import java.util.*;
import java.time.LocalDate;

public class Propiedad {
	private String direccion;
	private String nombre;
	private double precio;
	private List<Reserva> reservas;
	private List<DateLapse> periodos;
	
	public Propiedad(String direccion, String nombre, double precio) {
		this.direccion = direccion;
		this.nombre = nombre;
		this.precio = precio;
		this.reservas = new LinkedList<Reserva>();
		this.periodos = new LinkedList<DateLapse>();
	}
	
	public Reserva crearReserva(Usuario usuario, DateLapse periodo) {
		if(this.isDisponible(periodo.getFrom(), periodo.getTo())) {
			this.periodos.add(periodo);
			Reserva r =  new Reserva(periodo, usuario ,this);
			this.reservas.add(r);
			return r;
		}
		return null;
	}
	
	public void cancelarReserva(Reserva reserva) {
		if(this.reservas.contains(reserva)) {
			this.reservas.remove(reserva);
			this.periodos.remove(reserva.getPeriodo());
		}
	}
	
	public List<Reserva> getReservas(){
		return new LinkedList<Reserva>(this.reservas);
	}
	
	public double getPrecio() {
		return this.precio;
	}
	
	public boolean isDisponible(LocalDate from, LocalDate to) {
		DateLapse periodo = new DateLapse(from, to);
		
		for(DateLapse d : this.periodos) {
			if(d.overlaps(periodo)) {
				return false;
			}
		}
		return true;
	}
}
