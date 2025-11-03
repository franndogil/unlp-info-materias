package ar.edu.unlp.info.oo1.ejercicio15;
import java.util.*;

public class Email {
	private String titulo;
	private String cuerpo;
	private List<Archivo> adjuntos;
	
	public Email(String titulo, String cuerpo) {
		this.titulo = titulo;
		this.cuerpo = cuerpo;
		this.adjuntos = new LinkedList<Archivo>();
	}
	
	public String getTitulo() {
		return this.titulo;
	}
	
	public String getCuerpo() {
		return this.cuerpo;
	}
	
	public int getTamañoEmail() {
		return this.titulo.length() + this.cuerpo.length() + this.adjuntos.stream().mapToInt(a -> a.getTamañoArchivo()).sum();
	}
	
	public void agregarAdjunto(Archivo archivo) {
		this.adjuntos.add(archivo);
	}
	
	public List<Archivo> adjuntos(){
		return this.adjuntos;
	}
	
	public boolean cumple(String texto) {
		return this.titulo.contains(texto) | this.cuerpo.contains(texto);
	}
}
