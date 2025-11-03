package ar.edu.unlp.info.oo1.ejercicio15;
import java.util.*;

public class Carpeta {
	private String nombre;
	private List <Email> correos;
	
	public Carpeta(String nombre) {
		this.nombre = nombre;
		this.correos = new LinkedList<Email>();
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void mover(Email email, Carpeta destino) {
		if(existe(email)) {
			destino.agregarCorreo(email);
			this.eliminarCorreo(email);
		}
	}
	
	public int getTamañoCarpeta () {
		return this.correos.stream().mapToInt(a -> a.getTamañoEmail()).sum();
	}
	
	private boolean existe(Email email) {
		if(this.correos.contains(email)) {
			return true;
		}
		return false;
	}
	
	public void agregarCorreo(Email email) {
		this.correos.add(email);
	}
	
	public Email buscar(String texto) {
		return this.correos.stream().filter(e -> e.cumple(texto)).findFirst().orElse(null);
	}
	
	private void eliminarCorreo(Email email) {
		if(existe(email)) {
			this.correos.remove(email);
		}
	}
	
	public List<Email> getCorreos() {
		return new LinkedList<Email>(this.correos);
	}
}
