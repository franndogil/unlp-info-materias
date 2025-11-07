package ar.edu.unlp.info.oo1.modeloParcial1;
import java.time.LocalDate;

public abstract class Evento {
	private String nombre;
	private LocalDate fecha;
	private String tema;
	private double precioInscripcion;
	private double precioRemera;
	
	public Evento(String nombre, LocalDate fecha, String tema, double precioInscripcion, double precioRemera) {
		this.nombre = nombre;
		this.fecha = fecha;
		this.tema = tema;
		this.precioInscripcion = precioInscripcion;
		this.precioRemera = precioRemera;
	}
	
	public void comprarEntrada(boolean seguro, Usuario usuario) {
		usuario.agregarEntrada(new Entrada(this, seguro));
	}
	
	public double getPrecioInscripcion() {
		return this.precioInscripcion;
	}
	
	public double getPrecioRemera() {
		return this.precioRemera;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public abstract double consultarPrecio(LocalDate fechaActual);
}
