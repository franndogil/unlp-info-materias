package ar.edu.unlp.info.oo1.modeloParcial1;
import java.util.*;
import java.time.LocalDate;
import java.time.Period;

public class Usuario {
	private String nombre;
	private List<Entrada> entradas;
	
	public Usuario(String nombre) {
		this.nombre = nombre;
		this.entradas = new LinkedList<Entrada>();
	}
	
	public void agregarEntrada(Entrada entrada) {
		this.entradas.add(entrada);
	}
	
	public Entrada retornarEntrada() {
		if(this.entradas == null) return null;
		
		Entrada entrada = null;
		int dias = Integer.MAX_VALUE;
		List<Entrada> copia = new LinkedList<Entrada>(this.entradas);	//recorro copia
		for(Entrada e : copia) {
			int aux = Period.between(e.getEvento().getFecha(), LocalDate.now()).getDays();	//obtengo los dias restantes
			if(aux < dias) {	//si faltan menos dias que los actuales actualizo 
				dias = aux;
				entrada = e;
			}
		}
		return entrada;
	}
	
	public double calcularMontoTotal(LocalDate inicio, LocalDate fin) {
		double montoTotal = 0;
		
		List<Entrada> copia = new LinkedList<Entrada>(this.entradas);
		for(Entrada e : copia) {
			if(e.getFechaCompra().isAfter(inicio) && e.getFechaCompra().isBefore(fin)) {
				montoTotal += e.getPrecio();
			}
		}
		
		return montoTotal;
	}
}
