package ar.edu.unlp.info.oo1.ejercicio7;

public class Cuerpo3D {
	private double altura;
	private Figura caraBasal;
	
	public void setAltura(double altura) {
		this.altura = altura;
	}
	
	public void setCaraBasal(Figura caraBasal) {
		this.caraBasal = caraBasal;
	}
	
	public  double getAltura() {
		return this.altura;
	}
	
	public double getVolumen() {
		return (this.caraBasal.getArea() * this.altura);
	}
	
	public double getSuperficieExterior() {
		double superficieExterior = 0;
		
		superficieExterior = (2 * this.caraBasal.getArea()) 
							+ (this.caraBasal.getPerimetro() * this.altura);
		
		return superficieExterior;
	}
}
