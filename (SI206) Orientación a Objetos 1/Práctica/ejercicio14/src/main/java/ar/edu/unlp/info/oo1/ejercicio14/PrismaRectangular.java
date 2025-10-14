package ar.edu.unlp.info.oo1.ejercicio14;

public class PrismaRectangular extends Pieza{
	private double ladoMayor;
	private double ladoMenor;
	private double altura;
	
	public PrismaRectangular(double ladoMayor, double ladoMenor, double altura, String material, String color) {
		super(material, color);
		this.ladoMayor = ladoMayor;
		this.ladoMenor = ladoMenor;
		this.altura = altura;
	}
	
	@Override
	public double getVolumen() {
		double volumen = this.ladoMayor * this.ladoMenor * this.altura;
		return volumen;
	}
	
	public double getSuperficie() {
		double superficie = ((this.ladoMayor * this.ladoMenor) + (this.ladoMayor * this.altura) + (this.ladoMenor * this.altura)) * 2;
		return superficie;
	}
}
