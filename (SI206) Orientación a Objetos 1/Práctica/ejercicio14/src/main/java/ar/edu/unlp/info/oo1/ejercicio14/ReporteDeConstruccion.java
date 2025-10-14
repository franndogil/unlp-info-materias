package ar.edu.unlp.info.oo1.ejercicio14;
import java.util.*;

public class ReporteDeConstruccion{
	private List<Pieza> piezas;
	
	public ReporteDeConstruccion() {
		this.piezas = new LinkedList<Pieza>();
	}
	
	public void agregarPieza(Pieza pieza) {
		this.piezas.add(pieza);
	}
	
	public double volumenDeMaterial(String material) {
		return piezas.stream()
				.filter(pieza -> pieza.getMaterial().equals(material))
				.mapToDouble(pieza -> pieza.getVolumen())
				.sum();
	}
	
	public double superficieDeColor(String color) {
		return piezas.stream()
				.filter(pieza -> pieza.getColor().equals(color))
				.mapToDouble(pieza -> pieza.getSuperficie())
				.sum();
	}
}
