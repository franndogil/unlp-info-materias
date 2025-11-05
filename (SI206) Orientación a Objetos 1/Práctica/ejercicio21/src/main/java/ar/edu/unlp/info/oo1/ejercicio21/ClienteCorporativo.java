package ar.edu.unlp.info.oo1.ejercicio21;

public class ClienteCorporativo extends Cliente{
	private int cuit;
	
	public ClienteCorporativo(String nombre, String direccion, int cuit) {
		super(nombre, direccion);
		this.cuit = cuit;
	}
}
