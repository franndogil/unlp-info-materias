package ar.edu.unlp.info.oo1.ejercicio7;

public class Circulo implements Figura{
	private double diametro;
	private double radio;
	
	public Circulo() {
		
	}
	
	public Circulo(double diametro, double radio) {
		this.diametro = diametro;
		this.radio = radio;
	}
	
	public void setDiametro(double diametro) {
		this.diametro = diametro;
		this.radio = diametro / 2;
	}
	
	public double getDiametro() {
		return this.diametro;
	}
	
	public void setRadio(double radio) {
		this.radio = radio;
		this.diametro = radio * 2;
	}
	
	public double getRadio() {
		return this.radio;
	}
	
	// Implementacion de los metodos de la interface
	
	public double getPerimetro() {
		return (Math.PI * diametro);
	}
	
	public double getArea() {
		return(Math.PI * (radio * radio));
	}
}
