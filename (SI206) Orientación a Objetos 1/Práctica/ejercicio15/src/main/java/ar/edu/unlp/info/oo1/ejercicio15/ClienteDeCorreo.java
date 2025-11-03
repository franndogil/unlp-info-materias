package ar.edu.unlp.info.oo1.ejercicio15;
import java.util.*;

public class ClienteDeCorreo {
	private List<Carpeta> carpetas;
	private Carpeta inbox;
	
	public ClienteDeCorreo() {
		this.carpetas = new LinkedList<Carpeta>();
		this.inbox = new Carpeta("Inbox");
		this.carpetas.add(inbox);	//si no la agrego no cuento el inbox a la hora de buscar o de obtener el espacio ocupado
	}
	
	public void recibir(Email email) {
		this.inbox.agregarCorreo(email);
	}
	
	public Email buscar(String texto) {
		return this.carpetas.stream().map(c -> c.buscar(texto)).findFirst().orElse(null);
	}
	
	public int espacioOcupado() {
		return this.carpetas.stream().mapToInt(a -> a.getTamañoCarpeta()).sum();
	}
	
	public void agregarCarpeta(Carpeta carpeta){
		this.carpetas.add(carpeta);
	}
	
	public List<Carpeta> getCarpetas(){
		return new LinkedList<Carpeta>(this.carpetas);
	}
}
