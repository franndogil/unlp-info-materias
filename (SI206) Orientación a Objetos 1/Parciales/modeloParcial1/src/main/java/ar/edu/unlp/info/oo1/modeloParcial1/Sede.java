package ar.edu.unlp.info.oo1.modeloParcial1;

public class Sede {
	private String nombre;
	private double estDia;
	private int cantDias;
	
	public Sede(String nombre, double estDia, int cantDias) {
		this.nombre = nombre;
		this.estDia = estDia;
		this.cantDias = cantDias;
	}
	
	public double getPrecioTotalSede() {
		return (this.cantDias * this.estDia);
	}
}	
