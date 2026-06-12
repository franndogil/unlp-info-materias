package tp1.ejercicio5;

public class Respuesta {
	private int min = Integer.MAX_VALUE;
	private int max = Integer.MIN_VALUE;
	private double prom = 0;
	
	public Respuesta(){
		
	}
	
	public int getMax() {
		return max;
	}
	public int getMin() {
		return min;
	}
	public double getProm() {
		return prom;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public void setProm(double prom) {
		this.prom = prom;
	}
}
