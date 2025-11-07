package ar.edu.unlp.info.oo1.modeloParcial1;

import java.time.LocalDate;
import java.time.Period;

public class Entrada {
	private Evento evento;
	private LocalDate fecha;
	private boolean seguro;
	private double precio;
	
	public Entrada(Evento evento, boolean seguro) {
		this.evento = evento;
		this.seguro = seguro;
		this.fecha = LocalDate.now();
		this.precio = evento.consultarPrecio(LocalDate.now());
		if(seguro) {
			this.precio += 500;
		}
	}
	
	public double calcularMontoRecuperar() {
		int dias = Period.between(this.fecha, this.evento.getFecha()).getDays();
		if(dias < 30 && this.seguro) {
			return (0.15 * this.precio);
		}else if(dias < 30 && !this.seguro) {
			return 0;
		}
		return (0.50 * this.precio);
	}
	
	public double getPrecio() {
		return this.precio;
	}
	
	public LocalDate getFechaCompra() {
		return this.fecha;
	}
	
	public Evento getEvento() {
		return this.evento;
	}
}
