package ar.edu.unlp.info.oo1.ejercicio21;
import java.util.*;
import java.time.LocalDate;

public abstract class Cliente {
	private String nombre;
	private String direccion;
	private List<Envio> envios;
	
	public Cliente(String nombre, String direccion) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.envios = new LinkedList<Envio>();
	}
	
	public void agregarEnvio(Envio envio) {
		this.envios.add(envio);
	}
	
	public double montoPagar(LocalDate inicio, LocalDate fin) {
		//aca deberia usar un stream para ser bien pro
		
		//sin stream porque no me sale :(((
		double monto = 0;
		for(Envio e : this.envios) {
			if(e.getFecha().isAfter(inicio)&&(e.getFecha().isBefore(fin))) {
				monto += e.calcularCosto();
			}
		}
		return monto;
	}
}
