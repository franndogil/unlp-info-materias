package parciales.parcialColapinto;

public class Compuesto {
	private int vueltas;
	private double compuesto;
	
	public Compuesto(int vueltas, double compuesto) {
		this.vueltas = vueltas;
		this.compuesto = compuesto;
	}
	
	public double getCompuesto() {
		return compuesto;
	}
	
	public int getVueltas() {
		return vueltas;
	}
}
