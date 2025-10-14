package ar.edu.unlp.info.oo1.ejercicio14;

public class Cilindro extends Pieza{
	private double radio;
	private double altura;
	
	public Cilindro(double altura, double radio, String material, String color) {
		super(material, color);
		this.altura = altura;
		this.radio = radio;
	}
	
	@Override
	public double getVolumen() {
		double volumen = (Math.PI * Math.pow(this.radio, 2) * this.altura);
		return volumen;
	}
	
	public double getSuperficie() {
		double superficie = ((2 * Math.PI * this.radio * this.altura) + (2 * Math.PI * Math.pow(this.radio, 2)));
		return superficie;
	}
}
