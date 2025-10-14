package ar.edu.unlp.info.oo1.ejercicio14;

public class Esfera extends Pieza{
	private double radio;
	
	public Esfera(double radio, String material, String color) {
		super(material, color);
		this.radio = radio;
	}
	
	@Override
	public double getVolumen() {
		double volumen = 4 * (Math.PI * Math.pow(this.radio, 3)) /3 ;
		return volumen;
	}
	
	public double getSuperficie() {
		double superficie = 4 * Math.PI * Math.pow(this.radio, 2);
		return superficie;
	}
}
