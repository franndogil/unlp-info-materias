package ar.edu.unlp.info.oo1.modeloParcial1;
import java.time.LocalDate;
import java.util.*;

public class Presencial extends Evento{
	private List<Sede> sedes;
	
	public Presencial(String nombre, LocalDate fecha, String tema, double precioInscripcion, double precioRemera) {
		super(nombre, fecha, tema, precioInscripcion, precioRemera);
		this.sedes = new LinkedList<Sede>();
	}
	
	public double consultarPrecio(LocalDate fechaActual) {
		double precio = (super.getPrecioInscripcion() + super.getPrecioRemera());
		List<Sede> copia = new LinkedList<Sede>(this.sedes);	//recorro la copia
		for(Sede s : copia) {
			precio += s.getPrecioTotalSede();
		}
		
		if(super.getFecha().equals(fechaActual)) {
			precio += (super.getPrecioInscripcion() * 0.20);
		}
		return precio;
	}
	
	public void agregarSede(Sede sede) {
		this.sedes.add(sede);
	}
}
