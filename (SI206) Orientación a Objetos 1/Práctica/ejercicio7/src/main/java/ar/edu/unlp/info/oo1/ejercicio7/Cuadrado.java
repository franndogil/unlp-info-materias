package ar.edu.unlp.info.oo1.ejercicio7;

public class Cuadrado implements Figura {
	private double lado;
	
	public Cuadrado() {
		
	}
	
	public Cuadrado(double lado) {
		this.lado = lado;
	}
	
	public void setLado(double lado) {
		this.lado = lado;
	}
	
	public double getLado() {
		return this.lado;
	}
	
	
	//implementacion de los metodos de la interface
	
	public double getPerimetro() {
		return (lado * 4);
	}
	
	public double getArea() {
		return (lado * lado);
	}
}
